-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-09-2023 a las 05:21:10
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_wtt t`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `tdoc_admin` varchar(15) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`tdoc_admin`, `id_admin`) VALUES
('CC', 13),
('CE', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `cod_equip` varchar(10) NOT NULL,
  `nom_equip` varchar(60) NOT NULL,
  `valor_equip` double NOT NULL,
  `num_serie` int(11) NOT NULL,
  `marca_equip` varchar(60) NOT NULL,
  `modelo_equip` varchar(30) NOT NULL,
  `fk_tipo_equip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`cod_equip`, `nom_equip`, `valor_equip`, `num_serie`, `marca_equip`, `modelo_equip`, `fk_tipo_equip`) VALUES
('EQ001', 'Computadora de escritorio', 800, 123456789, 'HP', 'ProDesk 600', '101'),
('EQ002', 'Laptop', 1200, 987654321, 'Dell', 'Latitude E7450', '201'),
('EQ003', 'Monitor', 200, 567890123, 'Samsung', 'S24F350', '301'),
('EQ004', 'Impresora', 300, 456789012, 'Epson', 'EcoTank L3150', '401');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `num_fact` int(11) NOT NULL,
  `fecha_fact` date NOT NULL,
  `subtotal` double NOT NULL,
  `iva` double NOT NULL,
  `total_fact` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`num_fact`, `fecha_fact`, `subtotal`, `iva`, `total_fact`) VALUES
(23456, '2023-09-05', 1200000, 250000, 1450000),
(44532, '2023-07-26', 3000000, 1000000, 4000000),
(56321, '2023-08-03', 2000000, 250000, 2250000),
(88832, '2023-07-12', 1500000, 250000, 1750000),
(134256, '2023-07-05', 600000, 250000, 850000),
(246666, '2022-11-17', 5000000, 2500000, 7500000),
(451124, '2023-05-17', 4000000, 250000, 4250000),
(876887, '2023-03-01', 600000, 250000, 850000),
(8765575, '2022-07-12', 750000, 250000, 1000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_alquiler`
--

CREATE TABLE `factura_alquiler` (
  `num_fact_alquil` int(11) NOT NULL,
  `tienda_id` varchar(10) NOT NULL,
  `trab_fac_tdoc` varchar(15) NOT NULL,
  `trab_fac_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_alquiler`
--

INSERT INTO `factura_alquiler` (`num_fact_alquil`, `tienda_id`, `trab_fac_tdoc`, `trab_fac_id`) VALUES
(23456, '998', 'CC', 1),
(44532, '1231', 'CE', 8),
(56321, '4321', 'TI', 9),
(88832, '8823', 'CC', 1),
(134256, '12345', 'CE', 8),
(246666, '33124', 'TI', 9),
(876887, '33124', 'CE', 8),
(8765575, '876803', 'CC', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_compra`
--

CREATE TABLE `factura_compra` (
  `num_fact_comp` int(11) NOT NULL,
  `trab_tdoc` varchar(15) NOT NULL,
  `trab_id` int(11) NOT NULL,
  `prov_tdoc` varchar(15) NOT NULL,
  `prov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_compra`
--

INSERT INTO `factura_compra` (`num_fact_comp`, `trab_tdoc`, `trab_id`, `prov_tdoc`, `prov_id`) VALUES
(23456, 'CE', 2, 'TI', 9),
(44532, 'CC', 13, 'CC', 1),
(88832, 'CC', 13, 'CE', 8),
(134256, 'CE', 2, 'TI', 9),
(246666, 'CC', 13, 'CC', 1),
(8765575, 'CE', 2, 'TI', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_equipos`
--

CREATE TABLE `factura_equipos` (
  `fk_pk_num_fact` int(11) NOT NULL,
  `fk_pk_cod_equip` varchar(10) NOT NULL,
  `cantidad_equip` int(11) NOT NULL,
  `valor_prod_cant` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_equipos`
--

INSERT INTO `factura_equipos` (`fk_pk_num_fact`, `fk_pk_cod_equip`, `cantidad_equip`, `valor_prod_cant`) VALUES
(23456, 'EQ001', 1, 800),
(56321, 'EQ003', 3, 600),
(88832, 'EQ002', 2, 2400),
(246666, 'EQ004', 4, 1200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerente`
--

CREATE TABLE `gerente` (
  `tdoc_geren` varchar(15) NOT NULL,
  `id_geren` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gerente`
--

INSERT INTO `gerente` (`tdoc_geren`, `id_geren`) VALUES
('CC', 4),
('TI', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `fk_pk_id_us` int(11) NOT NULL,
  `fk_pk_correo_us` varchar(60) NOT NULL,
  `clave` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `tdoc_prov` varchar(15) NOT NULL,
  `id_prov` int(11) NOT NULL,
  `nom_prod` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`tdoc_prov`, `id_prov`, `nom_prod`) VALUES
('CC', 1, 'Juan'),
('CE', 8, 'Sofia'),
('TI', 9, 'MIguel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `cod_rol` int(11) NOT NULL,
  `desc_rol` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`cod_rol`, `desc_rol`) VALUES
(1, 'Admin'),
(2, 'proveedor'),
(3, 'trabajador'),
(4, 'gerente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id_tienda` varchar(10) NOT NULL,
  `ciud_tienda` varchar(40) NOT NULL,
  `dir_tienda` varchar(100) NOT NULL,
  `estado_tienda` tinyint(1) NOT NULL,
  `tel_tienda` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id_tienda`, `ciud_tienda`, `dir_tienda`, `estado_tienda`, `tel_tienda`) VALUES
('1231', 'Bogota', 'Avenida chile #22-29', 1, 8590231),
('12345', 'Bogotá', 'Carrera 6 #89-78', 1, 234456677),
('2222145', 'Bogotá', 'Avenida 11 #23-11', 1, 2314444),
('234422', 'Bogotá', 'Carrera 90 #78-15', 0, 60190002234),
('33124', 'Bogotá', 'Calle 10 #45-12', 1, 555463),
('4321', 'Bogotá', 'Calle 4 #23-66', 1, 60157022),
('432324', 'Bogotá', 'Calle 1 #123', 1, 7777231),
('667546', 'Bogotá', 'Calle 90 #75a-23', 1, 2314455),
('777867', 'Bogota', 'Avenida 2 #456', 1, 973818123),
('78481', 'Bogota', 'Transversal 30#12-9', 1, 234451),
('876803', 'Bogotá', 'Avenida 8 #678', 1, 554221),
('8823', 'Bogotá', 'Carrera 90#28-23', 1, 31567281),
('98702', 'Bogotá', 'Calle 7 #34-90', 1, 1456209),
('98783', 'Bogotá', 'Carrera 9 #90-7', 1, 223145),
('998', 'Bogotá', 'Avenida 5 #56-91', 1, 601893);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `tip_doc` varchar(15) NOT NULL,
  `desc_tdoc` varchar(30) NOT NULL,
  `estado_tdoc` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`tip_doc`, `desc_tdoc`, `estado_tdoc`) VALUES
('CC', 'Cedula de Ciudadania', 1),
('CE', 'Cedula de Extranjeria', 1),
('TI', 'Documento de Identidad', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_equipo`
--

CREATE TABLE `tipo_equipo` (
  `id_tipo_equip` varchar(10) NOT NULL,
  `desc_tipo_equip` varchar(20) NOT NULL,
  `estado_equip` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_equipo`
--

INSERT INTO `tipo_equipo` (`id_tipo_equip`, `desc_tipo_equip`, `estado_equip`) VALUES
('101', 'Laptop', 1),
('201', 'Desktop', 1),
('301', 'Impresora', 1),
('401', 'Laptop', 1),
('501', 'Desktop', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `tdoc_trab` varchar(15) NOT NULL,
  `id_trab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`tdoc_trab`, `id_trab`) VALUES
('CC', 1),
('CE', 8),
('TI', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_us` int(11) NOT NULL,
  `nom1_us` varchar(30) NOT NULL,
  `nom2_us` varchar(30) DEFAULT NULL,
  `ape1_us` varchar(30) NOT NULL,
  `ape2_us` varchar(30) DEFAULT NULL,
  `tel_us` bigint(20) NOT NULL,
  `correo_us` varchar(60) NOT NULL,
  `estado_us` tinyint(1) NOT NULL,
  `pk_fk_tdoc` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_us`, `nom1_us`, `nom2_us`, `ape1_us`, `ape2_us`, `tel_us`, `correo_us`, `estado_us`, `pk_fk_tdoc`) VALUES
(1, 'Juan', 'Carlos', 'Pérez', 'González', 123456789, 'juan@gmail.com', 1, 'CC'),
(2, 'María', 'Luisa', 'Gómez', 'Rodríguez', 987654321, 'maria@gmail.com', 1, 'CE'),
(3, 'Carlos', 'José', 'Fernández', 'López', 555555555, 'carlos@gmail.com', 1, 'TI'),
(4, 'Ana', 'Isabel', 'Martínez', 'Pérez', 111111111, 'ana@gmail.com', 1, 'CC'),
(5, 'Luis', 'Miguel', 'Ramírez', 'García', 999999999, 'luis@gmail.com', 1, 'CE'),
(6, 'Laura', NULL, 'González', 'Martínez', 777777777, 'laura@gmail.com', 1, 'TI'),
(7, 'David', 'Andrés', 'Pérez', 'López', 888888888, 'david@gmail.com', 1, 'CC'),
(8, 'Sofía', 'Camila', 'Sánchez', 'Fernández', 222222222, 'sofia@gmail.com', 1, 'CE'),
(9, 'Miguel', 'Ángel', 'García', 'Fernández', 333333333, 'miguel@gmail.com', 1, 'TI'),
(10, 'Elena', 'Isabel', 'Martínez', 'Sánchez', 444444444, 'elena@gmail.com', 0, 'CC'),
(11, 'Pedro', NULL, 'Ramírez', 'Gómez', 666666666, 'pedro@gmail.com', 1, 'CE'),
(12, 'Carmen', 'Luz', 'Fernández', 'García', 777777777, 'carmen@gmail.com', 0, 'TI'),
(13, 'Daniel', 'Antonio', 'Pérez', 'Sánchez', 555555555, 'daniel@gmail.com', 1, 'CC'),
(14, 'Raquel', 'María', 'Sánchez', 'Fernández', 999999999, 'raquel@gmail.com', 1, 'CE'),
(15, 'Javier', NULL, 'Gómez', 'Martínez', 123123123, 'javier@gmail.com', 1, 'TI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_has_roles`
--

CREATE TABLE `usuarios_has_roles` (
  `us_tdoc` varchar(15) NOT NULL,
  `us_id` int(11) NOT NULL,
  `us_rol` int(11) NOT NULL,
  `estado_rol` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios_has_roles`
--

INSERT INTO `usuarios_has_roles` (`us_tdoc`, `us_id`, `us_rol`, `estado_rol`) VALUES
('CC', 1, 3, 1),
('CE', 8, 3, 1),
('TI', 9, 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`tdoc_admin`,`id_admin`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`cod_equip`),
  ADD KEY `fk_tipo_equip` (`fk_tipo_equip`);

--
-- Indices de la tabla `factura_alquiler`
--
ALTER TABLE `factura_alquiler`
  ADD PRIMARY KEY (`num_fact_alquil`),
  ADD KEY `trab_fac_tdoc` (`trab_fac_tdoc`,`trab_fac_id`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `factura_compra`
--
ALTER TABLE `factura_compra`
  ADD PRIMARY KEY (`num_fact_comp`),
  ADD KEY `trab_tdoc` (`trab_tdoc`,`trab_id`),
  ADD KEY `prov_tdoc` (`prov_tdoc`,`prov_id`);

--
-- Indices de la tabla `factura_equipos`
--
ALTER TABLE `factura_equipos`
  ADD PRIMARY KEY (`fk_pk_num_fact`,`fk_pk_cod_equip`),
  ADD KEY `fk_pk_cod_equip` (`fk_pk_cod_equip`);

--
-- Indices de la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`tdoc_geren`,`id_geren`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`fk_pk_id_us`,`fk_pk_correo_us`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`tdoc_prov`,`id_prov`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`cod_rol`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id_tienda`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`tip_doc`);

--
-- Indices de la tabla `tipo_equipo`
--
ALTER TABLE `tipo_equipo`
  ADD PRIMARY KEY (`id_tipo_equip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
