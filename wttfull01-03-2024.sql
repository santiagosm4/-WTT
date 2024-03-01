-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2024 a las 17:15:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wtt`
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
-- Estructura de tabla para la tabla `equipos_has_estado`
--

CREATE TABLE `equipos_has_estado` (
  `eq_es_cod_equip` varchar(10) NOT NULL,
  `eq_es_id_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos_has_estado`
--

INSERT INTO `equipos_has_estado` (`eq_es_cod_equip`, `eq_es_id_estado`) VALUES
('EQ001', 1),
('EQ002', 1),
('EQ003', 1),
('EQ004', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` tinyint(1) NOT NULL,
  `desc_estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `desc_estado`) VALUES
(0, 'Inactivo'),
(1, 'activo');

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
-- Estructura de tabla para la tabla `logear`
--

CREATE TABLE `logear` (
  `pk_id_us` int(11) NOT NULL,
  `fk_correo_us` varchar(60) NOT NULL,
  `usuario_us` varchar(30) NOT NULL,
  `clave` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `logear`
--

INSERT INTO `logear` (`pk_id_us`, `fk_correo_us`, `usuario_us`, `clave`) VALUES
(1, 'juan@gmail.com', 'juanq99', 'ÅkØ\Z©¨}/c '),
(2, 'maria@gmail.com', 'mari123', 'µ·•\\-3©¸¶'),
(3, 'mcarlos@gmail.com', 'carey', '¥Í%?,\"Bë¸');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `cod_rol` int(11) NOT NULL,
  `desc_rol` varchar(40) DEFAULT NULL,
  `estado_rol` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`cod_rol`, `desc_rol`, `estado_rol`) VALUES
(1, 'admin', 1),
(2, 'proveedor', 1),
(3, 'trabajador', 1),
(4, 'gerente', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_has_estado`
--

CREATE TABLE `roles_has_estado` (
  `roes_cod_rol` int(11) NOT NULL,
  `roes_id_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles_has_estado`
--

INSERT INTO `roles_has_estado` (`roes_cod_rol`, `roes_id_estado`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `tip_doc` varchar(15) NOT NULL,
  `desc_tdoc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`tip_doc`, `desc_tdoc`) VALUES
('CC', 'Cedula de Ciudadania'),
('CE', 'Cedula de Extranjeria'),
('TI', 'Documento de Identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_equipo`
--

CREATE TABLE `tipo_equipo` (
  `id_tipo_equip` varchar(10) NOT NULL,
  `desc_tipo_equip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_equipo`
--

INSERT INTO `tipo_equipo` (`id_tipo_equip`, `desc_tipo_equip`) VALUES
('101', 'Laptop'),
('201', 'Desktop'),
('301', 'Impresora'),
('401', 'Laptop');

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
('CC', 7),
('CC', 13),
('CE', 2),
('TI', 15);

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
  `id_estado_us` varchar(30) NOT NULL,
  `pk_fk_tdoc` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_us`, `nom1_us`, `nom2_us`, `ape1_us`, `ape2_us`, `tel_us`, `correo_us`, `id_estado_us`, `pk_fk_tdoc`) VALUES
(1, 'Juan', 'Carlos', 'Pérez', 'González', 123456789, 'juan@gmail.com', '1', 'CC'),
(2, 'María', 'Luisa', 'Gómez', 'Rodríguez', 987654321, 'maria@gmail.com', '1', 'CE'),
(3, 'Carlos', 'José', 'Fernández', 'López', 555555555, 'carlos@gmail.com', '1', 'TI'),
(4, 'Ana', 'Isabel', 'Martínez', 'Pérez', 111111111, 'ana@gmail.com', '1', 'CC'),
(5, 'Luis', 'Miguel', 'Ramírez', 'García', 999999999, 'luis@gmail.com', '1', 'CE'),
(6, 'Laura', NULL, 'González', 'Martínez', 777777777, 'laura@gmail.com', '1', 'TI'),
(7, 'David', 'Andrés', 'Pérez', 'López', 888888888, 'david@gmail.com', '1', 'CC'),
(8, 'Sofía', 'Camila', 'Sánchez', 'Fernández', 222222222, 'sofia@gmail.com', '1', 'CE'),
(9, 'Miguel', 'Ángel', 'García', 'Fernández', 333333333, 'miguel@gmail.com', '1', 'TI'),
(10, 'Elena', 'Isabel', 'Martínez', 'Sánchez', 444444444, 'elena@gmail.com', '0', 'CC'),
(11, 'Pedro', NULL, 'Ramírez', 'Gómez', 666666666, 'pedro@gmail.com', '1', 'CE'),
(12, 'Carmen', 'Luz', 'Fernández', 'García', 777777777, 'carmen@gmail.com', '0', 'TI'),
(13, 'Daniel', 'Antonio', 'Pérez', 'Sánchez', 555555555, 'daniel@gmail.com', '1', 'CC'),
(14, 'Raquel', 'María', 'Sánchez', 'Fernández', 999999999, 'raquel@gmail.com', '1', 'CE'),
(15, 'Javier', NULL, 'Gómez', 'Martínez', 123123123, 'javier@gmail.com', '1', 'TI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_has_roles`
--

CREATE TABLE `usuarios_has_roles` (
  `us_tdoc` varchar(15) NOT NULL,
  `us_id` int(11) NOT NULL,
  `us_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios_has_roles`
--

INSERT INTO `usuarios_has_roles` (`us_tdoc`, `us_id`, `us_rol`) VALUES
('CC', 1, 2),
('CC', 2, 1),
('CC', 4, 4),
('CC', 7, 3),
('CC', 13, 1),
('CC', 13, 3),
('CE', 2, 3),
('CE', 8, 2),
('TI', 9, 2),
('TI', 12, 4),
('TI', 15, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_has_estado`
--

CREATE TABLE `usuario_has_estado` (
  `ues_tdoc_us` varchar(15) NOT NULL,
  `ues_id_us` int(11) NOT NULL,
  `ues_id_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_has_estado`
--

INSERT INTO `usuario_has_estado` (`ues_tdoc_us`, `ues_id_us`, `ues_id_estado`) VALUES
('CC', 1, 1),
('TI', 9, 1),
('CE', 8, 1);

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
-- Indices de la tabla `equipos_has_estado`
--
ALTER TABLE `equipos_has_estado`
  ADD PRIMARY KEY (`eq_es_cod_equip`,`eq_es_id_estado`),
  ADD KEY `eq_es_id_estado` (`eq_es_id_estado`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`tdoc_geren`,`id_geren`);

--
-- Indices de la tabla `logear`
--
ALTER TABLE `logear`
  ADD UNIQUE KEY `fk_correo_us` (`fk_correo_us`),
  ADD KEY `pk_id_us` (`pk_id_us`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`cod_rol`);

--
-- Indices de la tabla `roles_has_estado`
--
ALTER TABLE `roles_has_estado`
  ADD PRIMARY KEY (`roes_cod_rol`,`roes_id_estado`),
  ADD KEY `roes_id_estado` (`roes_id_estado`);

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

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`tdoc_trab`,`id_trab`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_us`,`pk_fk_tdoc`),
  ADD UNIQUE KEY `correo_us` (`correo_us`),
  ADD KEY `pk_fk_tdoc` (`pk_fk_tdoc`);

--
-- Indices de la tabla `usuarios_has_roles`
--
ALTER TABLE `usuarios_has_roles`
  ADD PRIMARY KEY (`us_tdoc`,`us_id`,`us_rol`),
  ADD KEY `us_rol` (`us_rol`);

--
-- Indices de la tabla `usuario_has_estado`
--
ALTER TABLE `usuario_has_estado`
  ADD KEY `ues_id_us` (`ues_id_us`,`ues_tdoc_us`),
  ADD KEY `ues_id_estado` (`ues_id_estado`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`tdoc_admin`,`id_admin`) REFERENCES `usuarios` (`pk_fk_tdoc`, `id_us`);

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`fk_tipo_equip`) REFERENCES `tipo_equipo` (`id_tipo_equip`);

--
-- Filtros para la tabla `equipos_has_estado`
--
ALTER TABLE `equipos_has_estado`
  ADD CONSTRAINT `equipos_has_estado_ibfk_1` FOREIGN KEY (`eq_es_cod_equip`) REFERENCES `equipos` (`cod_equip`),
  ADD CONSTRAINT `equipos_has_estado_ibfk_2` FOREIGN KEY (`eq_es_id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD CONSTRAINT `gerente_ibfk_1` FOREIGN KEY (`tdoc_geren`,`id_geren`) REFERENCES `usuarios` (`pk_fk_tdoc`, `id_us`);

--
-- Filtros para la tabla `logear`
--
ALTER TABLE `logear`
  ADD CONSTRAINT `logear_ibfk_1` FOREIGN KEY (`pk_id_us`) REFERENCES `usuarios` (`id_us`);

--
-- Filtros para la tabla `roles_has_estado`
--
ALTER TABLE `roles_has_estado`
  ADD CONSTRAINT `roles_has_estado_ibfk_1` FOREIGN KEY (`roes_cod_rol`) REFERENCES `roles` (`cod_rol`),
  ADD CONSTRAINT `roles_has_estado_ibfk_2` FOREIGN KEY (`roes_id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `trabajador_ibfk_1` FOREIGN KEY (`tdoc_trab`,`id_trab`) REFERENCES `usuarios` (`pk_fk_tdoc`, `id_us`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`pk_fk_tdoc`) REFERENCES `tipo_documento` (`tip_doc`);

--
-- Filtros para la tabla `usuarios_has_roles`
--
ALTER TABLE `usuarios_has_roles`
  ADD CONSTRAINT `usuarios_has_roles_ibfk_1` FOREIGN KEY (`us_rol`) REFERENCES `roles` (`cod_rol`);

--
-- Filtros para la tabla `usuario_has_estado`
--
ALTER TABLE `usuario_has_estado`
  ADD CONSTRAINT `usuario_has_estado_ibfk_1` FOREIGN KEY (`ues_id_us`,`ues_tdoc_us`) REFERENCES `usuarios` (`id_us`, `pk_fk_tdoc`),
  ADD CONSTRAINT `usuario_has_estado_ibfk_2` FOREIGN KEY (`ues_id_estado`) REFERENCES `estado` (`id_estado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
