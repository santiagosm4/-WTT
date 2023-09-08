-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Sep 07, 2023 at 05:25 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wtt`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `tdoc_cliente` varchar(10) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`tdoc_cliente`, `id_cliente`) VALUES
('CC', 1),
('CC', 2),
('CE', 4),
('DNI', 10),
('NIT', 3),
('NUIP', 9),
('PA', 5),
('PEP', 8),
('RC', 7),
('TI', 6);

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `tdoc_empleado` varchar(10) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `sueldo_empleado` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`tdoc_empleado`, `id_empleado`, `sueldo_empleado`) VALUES
('CC', 1, 1470000),
('DNI', 10, 1600000),
('NIT', 3, 1400000),
('PEP', 8, 1500000);

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `n_factura` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `subtotal` double NOT NULL,
  `iva` double NOT NULL,
  `total_factura` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`n_factura`, `fecha_factura`, `subtotal`, `iva`, `total_factura`) VALUES
(11, '2023-08-31', 53000, 10070, 63070),
(12, '2023-09-01', 75000, 14250, 89250),
(13, '2023-09-02', 1850000, 351500, 2201500),
(14, '2023-09-03', 22800, 4332, 27132),
(15, '2023-09-04', 616000, 117040, 733040),
(16, '2023-09-05', 40000, 7600, 47600),
(17, '2023-09-06', 56500, 10735, 67235),
(18, '2023-09-07', 42500, 8075, 50575),
(19, '2023-09-08', 2125000, 404750, 2539750),
(20, '2023-09-09', 2600000, 494000, 3094000);

-- --------------------------------------------------------

--
-- Table structure for table `factura_compra_entrada`
--

CREATE TABLE `factura_compra_entrada` (
  `n_factura_comp` int(11) NOT NULL,
  `empleado_tdoc` varchar(10) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `proveedor_tdoc` varchar(10) NOT NULL,
  `proveedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `factura_compra_entrada`
--

INSERT INTO `factura_compra_entrada` (`n_factura_comp`, `empleado_tdoc`, `fecha_entrada`, `empleado_id`, `proveedor_tdoc`, `proveedor_id`) VALUES
(21, 'CC', '2023-09-01', 11, 'NIT', 21),
(22, 'CC', '2023-09-02', 12, 'NIT', 22),
(23, 'CC', '2023-09-03', 13, 'NIT', 21),
(24, 'CC', '2023-09-04', 14, 'NIT', 22),
(25, 'CC', '2023-09-05', 15, 'NIT', 21),
(26, 'CC', '2023-09-06', 16, 'NIT', 22),
(27, 'CC', '2023-09-07', 17, 'NIT', 21),
(28, 'CC', '2023-09-08', 18, 'NIT', 22),
(29, 'CC', '2023-09-09', 19, 'NIT', 21),
(30, 'CC', '2023-09-10', 20, 'NIT', 22);

-- --------------------------------------------------------

--
-- Table structure for table `factura_productos`
--

CREATE TABLE `factura_productos` (
  `fk_pk_n_factura` int(11) NOT NULL,
  `fk_pk_cod_producto` varchar(10) NOT NULL,
  `cantidad_prod` int(11) NOT NULL,
  `valor_prod_cant` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `factura_productos`
--

INSERT INTO `factura_productos` (`fk_pk_n_factura`, `fk_pk_cod_producto`, `cantidad_prod`, `valor_prod_cant`) VALUES
(11, 'DV001', 2, 90000),
(12, 'DV002', 3, 114000),
(13, 'FUJ001', 1, 550000),
(14, 'DV003', 4, 80000),
(15, 'FUJ002', 1, 2500000),
(16, 'DV004', 5, 300000),
(17, 'FUJ003', 1, 450000),
(18, 'DV005', 2, 70000),
(19, 'FUJ004', 1, 300000),
(20, 'DV006', 3, 45000);

-- --------------------------------------------------------

--
-- Table structure for table `factura_venta`
--

CREATE TABLE `factura_venta` (
  `n_factura_vent` int(11) NOT NULL,
  `cliente_tdoc` varchar(10) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `empleado_tdoc_v` varchar(10) NOT NULL,
  `empleado_id_v` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `factura_venta`
--

INSERT INTO `factura_venta` (`n_factura_vent`, `cliente_tdoc`, `cliente_id`, `empleado_tdoc_v`, `empleado_id_v`) VALUES
(11, 'CC', 1, 'CC', 1),
(12, 'CE', 4, 'DNI', 10),
(13, 'NIT', 3, 'PEP', 8),
(14, 'CC', 2, 'NIT', 3),
(15, 'NUIP', 9, 'PEP', 8),
(16, 'RC', 7, 'CC', 1),
(17, 'DNI', 10, 'PEP', 8),
(18, 'CE', 4, 'NIT', 3),
(19, 'RC', 7, 'CC', 1),
(20, 'CC', 1, 'PEP', 8);

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `pk_fk_tdoc` varchar(10) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `nom_persona` varchar(25) NOT NULL,
  `apellido_persona` varchar(25) NOT NULL,
  `direccion_persona` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `contraseña` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`pk_fk_tdoc`, `id_persona`, `nom_persona`, `apellido_persona`, `direccion_persona`, `email`, `estado`, `contraseña`) VALUES
('CC', 1, 'Juan', 'Pérez', 'Calle 123', 'juan@example.com', 1, 'contraseña1'),
('CC', 2, 'María', 'Gómez', 'Avenida 456', 'maria@example.com', 1, 'contraseña2'),
('CE', 4, 'Javier', 'López', 'Calle 789', 'javier@example.com', 1, 'contraseña4'),
('DNI', 10, 'Alejandro', 'Díaz', 'Avenida 666', 'alejandro@example.com', 1, 'contraseña10'),
('NIT', 3, 'Empresas S.A.', 'Proveedor', 'Carrera 789', 'proveedor@example.com', 1, 'contraseña3'),
('NUIP', 9, 'Andrea', 'Hernández', 'Carrera 555', 'andrea@example.com', 1, 'contraseña9'),
('PA', 5, 'Ana', 'Martínez', 'Avenida 101', 'ana@example.com', 1, 'contraseña5'),
('PEP', 8, 'David', 'Ramírez', 'Calle 444', 'david@example.com', 1, 'contraseña8'),
('RC', 7, 'Laura', 'Sánchez', 'Avenida 333', 'laura@example.com', 1, 'contraseña7'),
('TI', 6, 'Carlos', 'Rodríguez', 'Carrera 222', 'carlos@example.com', 1, 'contraseña6');

-- --------------------------------------------------------

--
-- Table structure for table `persona_has_roles`
--

CREATE TABLE `persona_has_roles` (
  `persona_tdoc` varchar(10) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `persona_rol` int(11) NOT NULL,
  `estado_rol` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persona_has_roles`
--

INSERT INTO `persona_has_roles` (`persona_tdoc`, `persona_id`, `persona_rol`, `estado_rol`) VALUES
('CE', 4, 2, 1),
('NIT', 3, 2, 1),
('NUIP', 9, 2, 1),
('PA', 5, 3, 1),
('RC', 7, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `cod_producto` varchar(10) NOT NULL,
  `desc_producto` varchar(45) NOT NULL,
  `Serial_prod` varchar(45) NOT NULL,
  `valor_producto` double NOT NULL,
  `fk_tipo_prod` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`cod_producto`, `desc_producto`, `Serial_prod`, `valor_producto`, `fk_tipo_prod`) VALUES
('DV001', 'Teclado USB Datavan', 'DV-KB001', 45000, 'Electrónico'),
('DV002', 'Mouse Inalámbrico Datavan', 'DV-MS002', 38000, 'Electrónico'),
('DV003', 'Cable HDMI 1.5m Datavan', 'DV-HD003', 20000, 'Cables'),
('DV004', 'Memoria USB 32GB Datavan', 'DV-USB004', 60000, 'Almacenamiento'),
('DV005', 'Ratón con Cable Datavan', 'DV-MS005', 35000, 'Electrónico'),
('DV006', 'Adaptador de Corriente Datavan', 'DV-AC006', 15000, 'Accesorios'),
('FUJ001', 'Monitor LED 24\" Fujitsu', 'FUJ-MN001', 550000, 'Electrónico'),
('FUJ002', 'Laptop Fujitsu LifeBook', 'FUJ-LT002', 2500000, 'Electrónico'),
('FUJ003', 'Impresora Multifuncional Fujitsu', 'FUJ-IM003', 450000, 'Electrónico'),
('FUJ004', 'Escáner de Documentos Fujitsu', 'FUJ-SC004', 300000, 'Electrónico');

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `tdoc_proveedor` varchar(10) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `telefono_sede` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`tdoc_proveedor`, `id_proveedor`, `telefono_sede`) VALUES
('PA', 5, 2345167890),
('TI', 6, 1235467839);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `cod_rol` int(11) NOT NULL,
  `desc_rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`cod_rol`, `desc_rol`) VALUES
(1, 'Administrador'),
(2, 'Vendedor'),
(3, 'Cliente'),
(4, 'Proveedor');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `tdoc` varchar(10) NOT NULL,
  `desc_tdoc` varchar(30) NOT NULL,
  `estado_tdoc` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipo_documento`
--

INSERT INTO `tipo_documento` (`tdoc`, `desc_tdoc`, `estado_tdoc`) VALUES
('CC', 'Cédula de Ciudadanía', 1),
('CE', 'Cédula de Extranjería', 1),
('DNI', 'Documento Nacional de Identida', 1),
('NIT', 'NIT', 1),
('NUIP', 'Número Único de Identificación', 1),
('PA', 'Pasaporte', 1),
('PEP', 'Permiso Especial de Permanenci', 1),
('RC', 'Registro Civil', 1),
('TI', 'Tarjeta de Identidad', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `tipo_prod` varchar(20) NOT NULL,
  `estado_tprod` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipo_producto`
--

INSERT INTO `tipo_producto` (`tipo_prod`, `estado_tprod`) VALUES
('Accesorios', 1),
('Almacenamiento', 1),
('Cables', 1),
('Electrónico', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`tdoc_cliente`,`id_cliente`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`tdoc_empleado`,`id_empleado`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`n_factura`);

--
-- Indexes for table `factura_compra_entrada`
--
ALTER TABLE `factura_compra_entrada`
  ADD PRIMARY KEY (`n_factura_comp`);

--
-- Indexes for table `factura_productos`
--
ALTER TABLE `factura_productos`
  ADD PRIMARY KEY (`fk_pk_n_factura`,`fk_pk_cod_producto`),
  ADD KEY `fk_pk_cod_producto` (`fk_pk_cod_producto`);

--
-- Indexes for table `factura_venta`
--
ALTER TABLE `factura_venta`
  ADD PRIMARY KEY (`n_factura_vent`),
  ADD KEY `empleado_tdoc_v` (`empleado_tdoc_v`,`empleado_id_v`),
  ADD KEY `cliente_tdoc` (`cliente_tdoc`,`cliente_id`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`pk_fk_tdoc`,`id_persona`);

--
-- Indexes for table `persona_has_roles`
--
ALTER TABLE `persona_has_roles`
  ADD PRIMARY KEY (`persona_tdoc`,`persona_id`,`persona_rol`),
  ADD KEY `persona_rol` (`persona_rol`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`cod_producto`),
  ADD KEY `fk_tipo_prod` (`fk_tipo_prod`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`tdoc_proveedor`,`id_proveedor`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`cod_rol`);

--
-- Indexes for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`tdoc`);

--
-- Indexes for table `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`tipo_prod`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`tdoc_cliente`,`id_cliente`) REFERENCES `persona` (`pk_fk_tdoc`, `id_persona`);

--
-- Constraints for table `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`tdoc_empleado`,`id_empleado`) REFERENCES `persona` (`pk_fk_tdoc`, `id_persona`);

--
-- Constraints for table `factura_productos`
--
ALTER TABLE `factura_productos`
  ADD CONSTRAINT `factura_productos_ibfk_1` FOREIGN KEY (`fk_pk_n_factura`) REFERENCES `factura` (`n_factura`),
  ADD CONSTRAINT `factura_productos_ibfk_2` FOREIGN KEY (`fk_pk_cod_producto`) REFERENCES `productos` (`cod_producto`);

--
-- Constraints for table `factura_venta`
--
ALTER TABLE `factura_venta`
  ADD CONSTRAINT `factura_venta_ibfk_1` FOREIGN KEY (`empleado_tdoc_v`,`empleado_id_v`) REFERENCES `empleado` (`tdoc_empleado`, `id_empleado`),
  ADD CONSTRAINT `factura_venta_ibfk_2` FOREIGN KEY (`cliente_tdoc`,`cliente_id`) REFERENCES `cliente` (`tdoc_cliente`, `id_cliente`),
  ADD CONSTRAINT `factura_venta_ibfk_3` FOREIGN KEY (`n_factura_vent`) REFERENCES `factura` (`n_factura`);

--
-- Constraints for table `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`pk_fk_tdoc`) REFERENCES `tipo_documento` (`tdoc`);

--
-- Constraints for table `persona_has_roles`
--
ALTER TABLE `persona_has_roles`
  ADD CONSTRAINT `persona_has_roles_ibfk_1` FOREIGN KEY (`persona_rol`) REFERENCES `roles` (`cod_rol`),
  ADD CONSTRAINT `persona_has_roles_ibfk_2` FOREIGN KEY (`persona_tdoc`,`persona_id`) REFERENCES `persona` (`pk_fk_tdoc`, `id_persona`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`fk_tipo_prod`) REFERENCES `tipo_producto` (`tipo_prod`);

--
-- Constraints for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`tdoc_proveedor`,`id_proveedor`) REFERENCES `persona` (`pk_fk_tdoc`, `id_persona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
