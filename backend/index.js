const mysql = require('mysql2/promise');
const functions = require('@google-cloud/functions-framework');
const cors = require('cors')({ origin: true });

// Configuration using Environment Variables.
const dbConfig = {
    socketPath: `/cloudsql/${process.env.INSTANCE_UNIX_SOCKET}`, 
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
};

functions.http('synctechApi', async (req, res) => {
    cors(req, res, async () => {
        let connection;
        try {
            connection = await mysql.createConnection(dbConfig);

            if (req.path === '/login' && req.method === 'POST') {
                const { usuario, clave } = req.body;
                
                // Security check for both fields (should be active)
                if (!usuario || !clave || clave.trim() === '') {
                    return res.status(401).json({ success: false, message: 'Username and password are required.' });
                }

                const [rows] = await connection.execute(
                    'SELECT * FROM usuario WHERE usuario = ? AND clave = ?',
                    [usuario, clave]
                );

                if (rows.length > 0) {
                    res.json({ success: true, rol: rows[0].rol, usuario: rows[0].usuario });
                } else {
                    res.status(401).json({ success: false, message: 'Invalid credentials' });
                }
                return;
            }

            if (req.path === '/inventario') {
                if (req.method === 'GET') {
                    const [rows] = await connection.execute('SELECT id_inventario, articulo, precio, stock FROM inventario WHERE stock > 0');
                    res.json(rows);
                } else if (req.method === 'POST') {
                    const { articulo, precio, stock } = req.body;
                    const [result] = await connection.execute(
                        'INSERT INTO inventario (articulo, precio, stock) VALUES (?, ?, ?)',
                        [articulo, precio, stock]
                    );
                    res.json({ success: true, id: result.insertId });
                }
                return;
            }
            
            if (req.path === '/cliente') {
                if (req.method === 'POST') {
                    const { nombre, dui, email, cel } = req.body;
                    if (!nombre || !dui) {
                        return res.status(400).json({ success: false, message: 'Name and DUI are mandatory.' });
                    }
                    const [result] = await connection.execute(
                        'INSERT INTO clientes (nombre, dui, email, cel) VALUES (?, ?, ?, ?)',
                        [nombre, dui, email, cel]
                    );
                    res.json({ success: true, id: result.insertId, message: 'Client registered successfully.' });

                } else if (req.method === 'GET') {
                    const { dui, q } = req.query;
                    let sql = 'SELECT id_cliente, nombre, dui, email, cel FROM clientes WHERE 1=1';
                    const params = [];
                    
                    if (dui) {
                        sql += ' AND dui = ?';
                        params.push(dui);
                    } else if (q) {
                        sql += ' AND (nombre LIKE ? OR dui LIKE ?)';
                        params.push(`%${q}%`, `%${q}%`);
                    } else {
                        return res.status(400).json({ success: false, message: 'Search parameter missing.' });
                    }

                    const [rows] = await connection.execute(sql, params);
                    if (!rows.length) return res.json({ success: false, message: 'Client not found.' });

                    res.json({ success: true, cliente: rows[0] });
                }
                return;
            }
            
            if (req.path === '/reporte/top' && req.method === 'GET') {
                const [rows] = await connection.execute(`
                    SELECT 
                        i.articulo, 
                        SUM(df.cantidad) AS total_vendido
                    FROM detalle_factura df
                    JOIN inventario i ON df.id_inventario = i.id_inventario
                    GROUP BY i.id_inventario, i.articulo
                    ORDER BY total_vendido DESC
                    LIMIT 5;
                `);
                res.json(rows);
                return;
            }
            
            if (req.path === '/reporte/finanzas' && req.method === 'GET') {
                
                const [salesRows] = await connection.execute('SELECT SUM(total) AS total_ventas FROM factura');
                const totalVentas = salesRows[0].total_ventas || 0;
                
                const [stockRows] = await connection.execute('SELECT SUM(stock) AS total_stock FROM inventario');
                const totalStock = stockRows[0].total_stock || 0;

                res.json({ total_ventas: totalVentas, total_stock: totalStock });
                return;
            }

            if (req.path === '/pedidos' && req.method === 'GET') {
                const [rows] = await connection.execute('SELECT id_factura, id_cliente, fecha, total FROM factura ORDER BY fecha DESC');
                res.json(rows);
                return;
            }

            if (req.path.startsWith('/factura/') && req.method === 'GET') {
                const facturaId = req.path.split('/')[2]; 

                const [facRows] = await connection.execute(
                    `SELECT f.*, c.nombre, c.dui, c.email, c.cel
                     FROM factura f
                     JOIN clientes c ON f.id_cliente = c.id_cliente
                     WHERE f.id_factura = ?`,
                    [facturaId]
                );
                
                if (!facRows.length) return res.status(404).json({ success: false, message: 'Invoice not found.' });

                const factura = facRows[0];
                
                const [detRows] = await connection.execute(
                    `SELECT d.cantidad, d.precio_unitario, d.subtotal, i.articulo
                     FROM detalle_factura d
                     JOIN inventario i ON d.id_inventario = i.id_inventario
                     WHERE d.id_factura = ?`,
                    [facturaId]
                );

                res.json({
                    success: true,
                    factura,
                    detalles: detRows
                });
                return;
            }


            if (req.path === '/venta' && req.method === 'POST') {
                const { id_cliente, total, items } = req.body;
                
                if (!id_cliente || !total || !items || items.length === 0) {
                    return res.status(400).json({ success: false, message: 'Missing transaction data.' });
                }

                await connection.beginTransaction();

                try {
                    const [resFactura] = await connection.execute(
                        'INSERT INTO factura (id_cliente, fecha, total) VALUES (?, NOW(), ?)',
                        [id_cliente, total]
                    );
                    const idFactura = resFactura.insertId;

                    for (const item of items) {
                        await connection.execute(
                            'INSERT INTO detalle_factura (id_factura, id_inventario, cantidad, precio_unitario, subtotal) VALUES (?, ?, ?, ?, ?)',
                            [idFactura, item.id_inventario, item.cantidad, item.precio, item.subtotal]
                        );
                        
                        await connection.execute(
                            'UPDATE inventario SET stock = stock - ? WHERE id_inventario = ?',
                            [item.cantidad, item.id_inventario]
                        );
                    }

                    await connection.commit();
                    res.json({ success: true, id_factura: idFactura });

                } catch (error) {
                    await connection.rollback();
                    if (error.code.includes('check constraint')) {
                         return res.status(400).json({ success: false, message: 'Stock update failed. Insufficient inventory.' });
                    }
                    throw error;
                }
                return;
            }

            res.status(404).json({ error: 'Route not found' });

        } catch (err) {
            console.error(err);
            res.status(500).json({ error: err.message });
        } finally {
            if (connection) await connection.end();
        }
    });
});