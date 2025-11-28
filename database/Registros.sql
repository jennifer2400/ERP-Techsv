-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 28-11-2025 a las 04:37:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mini_erp`
--

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `dui`, `email`, `cel`) VALUES
(1, 'Carlos Alberto Hernández', '05897452-3', 'carlosh@gmail.com', '70125689'),
(2, 'María Fernanda López', '06452398-1', 'mariaflopez@hotmail.com', '71238945'),
(3, 'José Ricardo Martínez', '05214789-6', 'jrmartinez@gmail.com', '78965412'),
(4, 'Lucía Alejandra Castro', '06124578-9', 'lucia.castro@gmail.com', '72581463'),
(5, 'David Alexander Gómez', '05541236-4', 'davidgomez@outlook.com', '78894561'),
(6, 'Sofía Beatriz Ramírez', '06897541-2', 'sofiaramirez@gmail.com', '70451236'),
(7, 'Andrés Mauricio Chávez', '05478963-7', 'andres.chavez@gmail.com', '73214569'),
(8, 'Laura Vanessa Pérez', '06258974-5', 'lauraperez@hotmail.com', '79025641'),
(9, 'Felipe Antonio Mejía', '05987412-8', 'felipemejia@gmail.com', '71369874'),
(10, 'Carolina Isabel Torres', '06698547-9', 'carolinatorres@outlook.com', '72015498'),
(11, 'Ernesto Javier Molina', '05789456-1', 'ernesto.molina@gmail.com', '70123456'),
(12, 'Génesis Abigail Torres', '06547895-2', 'genesis.torres@hotmail.com', '71234587'),
(13, 'Roberto Antonio Salinas', '05487962-3', 'roberto.salinas@gmail.com', '78965412'),
(14, 'Daniela Sofía Campos', '06123458-9', 'daniela.campos@outlook.com', '72589641'),
(15, 'Héctor Emilio Herrera', '06789452-4', 'hector.herrera@gmail.com', '78895412'),
(16, 'Andrea Lisseth López', '06897541-7', 'andrea.lopez@hotmail.com', '70451289'),
(17, 'Luis Alejandro Guzmán', '05987412-3', 'luis.guzman@gmail.com', '71325489'),
(18, 'Melanie Beatriz Funes', '06321458-4', 'melanie.funes@outlook.com', '79021456'),
(19, 'Carlos Andrés Borja', '05697412-8', 'carlos.borja@gmail.com', '72369845'),
(20, 'Ivonne Carolina Pérez', '06658974-2', 'ivonne.perez@hotmail.com', '72894561'),
(21, 'Ricardo Esteban Soto', '06124587-3', 'ricardo.soto@gmail.com', '73256984'),
(22, 'Larissa Nicole Aguilar', '06789413-7', 'larissa.aguilar@outlook.com', '74126985'),
(23, 'Fernando José Cruz', '05897412-9', 'fernando.cruz@gmail.com', '78962145'),
(24, 'Karla Yamileth Martínez', '06478521-3', 'karla.mtz@hotmail.com', '72013654'),
(25, 'Eduardo Javier Pineda', '06987412-6', 'eduardo.pineda@gmail.com', '73149562'),
(26, 'Patricia del Carmen Ramos', '06321457-1', 'patricia.ramos@outlook.com', '70123968'),
(27, 'Sergio Alexander Rivera', '05789541-8', 'sergio.rivera@gmail.com', '79654123'),
(28, 'Liliana Beatriz Serrano', '06854123-5', 'liliana.serrano@hotmail.com', '71236549'),
(29, 'Gabriel Ernesto Castro', '06021458-4', 'gabriel.castro@gmail.com', '78945216'),
(30, 'Jocelyn Marisol Rivas', '06697854-9', 'jocelyn.rivas@outlook.com', '72045619'),
(31, 'Kevin Alejandro Mendoza', '05987456-2', 'kevin.mendoza@gmail.com', '70125896'),
(32, 'Paola Xiomara Díaz', '06123547-8', 'paola.diaz@hotmail.com', '72251684'),
(33, 'Oswaldo Jeremías Mejía', '05897463-7', 'oswaldo.mejia@gmail.com', '73984512'),
(34, 'Emily Carolina Sandoval', '06789452-8', 'emily.sandoval@gmail.com', '71023689'),
(35, 'David Eduardo Rubio', '06325489-4', 'david.rubio@outlook.com', '78941256'),
(36, 'María José Cañas', '06478952-3', 'maria.canas@gmail.com', '71459862'),
(37, 'Jonathan Isaac Flores', '05623148-9', 'jonathan.flores@gmail.com', '72369841'),
(38, 'Rebeca Alejandra Molina', '06987452-6', 'rebeca.molina@hotmail.com', '79541238'),
(39, 'Diego Armando Aguilar', '06231548-8', 'diego.aguilar@gmail.com', '70234591'),
(40, 'Julia Antonella García', '06689745-7', 'julia.garcia@outlook.com', '72891456'),
(41, 'Samuel Adrián Peña', '05748962-1', 'samuel.pena@gmail.com', '70145986'),
(42, 'Marisol Andrea Chávez', '06578412-3', 'marisol.chavez@outlook.com', '71523689'),
(43, 'Óscar Alexander Linares', '06854712-4', 'oscar.linares@gmail.com', '79214683'),
(44, 'Valeria Fernanda Ruiz', '06478569-9', 'valeria.ruiz@hotmail.com', '72895461'),
(45, 'Mauricio Enrique Cáceres', '06214587-6', 'mauricio.caceres@gmail.com', '78012569'),
(46, 'Elsy Margarita Hernández', '06147852-8', 'elsy.hernandez@outlook.com', '79985412'),
(47, 'Cristian Alberto Castillo', '05987413-4', 'cristian.castillo@gmail.com', '72301456'),
(48, 'Nayeli Guadalupe Zúñiga', '06784521-9', 'nayeli.zuniga@hotmail.com', '71369854'),
(49, 'José Armando Quintanilla', '05841236-7', 'jose.quintanilla@gmail.com', '70125694'),
(50, 'Camila Sofía Miranda', '06321489-1', 'camila.miranda@gmail.com', '78945120');

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalle`, `id_factura`, `id_inventario`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 1, 2, 2, 5.00, 10.00),
(2, 1, 10, 3, 2.25, 6.75),
(3, 2, 5, 1, 4.99, 4.99),
(4, 2, 8, 2, 5.50, 11.00),
(5, 3, 1, 1, 3.50, 3.50),
(6, 3, 4, 1, 7.50, 7.50);

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_cliente`, `fecha`, `total`) VALUES
(1, 1, '2025-11-11 09:15:00', 45.25),
(2, 2, '2025-11-11 10:30:00', 27.80),
(3, 3, '2025-11-11 11:00:00', 14.90);

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `articulo`, `stock`, `precio`) VALUES
(1, 'Teclado inalámbrico Logitech K380', 15, 28.50),
(2, 'Mouse óptico HP USB', 20, 9.75),
(3, 'Monitor Samsung 24\" LED Full HD', 8, 139.99),
(4, 'Laptop Lenovo IdeaPad 3 Ryzen 5', 5, 585.00),
(5, 'Impresora Epson EcoTank L3250', 4, 210.75),
(6, 'Memoria USB Kingston 32GB', 30, 6.25),
(7, 'Disco duro externo Seagate 1TB', 10, 65.40),
(8, 'Cable HDMI 2.0 de 2 metros', 25, 4.85),
(9, 'Auriculares Gamer Redragon Ares', 12, 29.90),
(10, 'Micrófono USB Fifine K669B', 6, 45.00),
(11, 'Cámara web Logitech C270 HD', 7, 39.99),
(12, 'Router TP-Link Archer C20 AC750', 9, 32.50),
(13, 'Switch TP-Link 8 Puertos Gigabit', 6, 27.30),
(14, 'Mousepad RGB Razer Firefly', 10, 19.99),
(15, 'Laptop Dell Inspiron i5 15\"', 4, 649.99),
(16, 'Fuente de poder EVGA 500W 80+', 5, 45.70),
(17, 'Tarjeta gráfica ASUS GTX 1650', 3, 245.00),
(18, 'SSD Kingston 480GB SATA III', 10, 37.90),
(19, 'Cable UTP Cat6 1.5m', 40, 2.25),
(20, 'Ventilador Cooler Master 120mm', 15, 8.99),
(21, 'Memoria RAM DDR4 8GB Crucial', 12, 31.20),
(22, 'Base para laptop con ventilador', 8, 14.99),
(23, 'Kit teclado + mouse Genius', 18, 21.50),
(24, 'Parlantes Logitech Z313', 7, 49.80),
(25, 'Adaptador USB WiFi TP-Link', 20, 10.75),
(26, 'Cable HDMI 1.5m', 25, 3.50),
(27, 'Cable VGA 1.8m', 20, 4.25),
(28, 'Mouse óptico genérico', 30, 5.00),
(29, 'Teclado USB básico', 25, 7.50),
(30, 'Adaptador HDMI a VGA', 15, 4.99),
(31, 'Extensión eléctrica 3 tomas', 18, 6.25),
(32, 'Cargador universal para laptop', 10, 12.00),
(33, 'Memoria USB 16GB', 20, 5.50),
(34, 'Hub USB 2.0 4 puertos', 15, 6.75),
(35, 'Cable de red UTP 2m', 40, 2.25),
(36, 'Audífonos con micrófono', 25, 8.50),
(37, 'Mousepad básico', 30, 2.75),
(38, 'Convertidor USB a RJ45', 10, 9.50),
(39, 'Base enfriadora para laptop', 12, 13.00),
(40, 'Limpia pantallas con paño', 18, 3.25),
(41, 'Adaptador Bluetooth USB', 14, 7.90),
(42, 'Cinta doble faz para cables', 20, 1.50),
(43, 'Organizador de cables', 15, 2.10),
(44, 'Soporte de celular para escritorio', 22, 4.25),
(45, 'Cable de carga tipo C 1m', 25, 3.99),
(46, 'Audífonos económicos 3.5mm', 30, 4.75),
(47, 'Alfombrilla ergonómica', 10, 9.99),
(48, 'Funda para laptop 15\"', 8, 11.50),
(49, 'Caja plástica para accesorios', 10, 5.25),
(50, 'Bolsa de aire comprimido (limpieza)', 6, 14.90);

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `clave`, `rol`) VALUES
(1, 'admin1', 'admin123', 'admin'),
(2, 'admin2', 'secureadmin', 'admin'),
(3, 'karla.admin', 'ka2024', 'admin'),
(4, 'hector.super', 'hsuper99', 'admin'),
(5, 'sofia.master', 'smaster01', 'admin'),
(6, 'vendedor1', 'vend123', 'ventas'),
(7, 'vendedor2', 'ventas2024', 'ventas'),
(8, 'maria.ventas', 'mv1234', 'ventas'),
(9, 'roberto.seller', 'rsales55', 'ventas'),
(10, 'camila.shop', 'cshop88', 'ventas'),
(11, 'bodega1', 'bode123', 'bodega'),
(12, 'bodega2', 'almacen2024', 'bodega'),
(13, 'luis.bodega', 'lbod99', 'bodega'),
(14, 'carlos.invent', 'cinv2024', 'bodega'),
(15, 'esteban.store', 'estore11', 'bodega');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
