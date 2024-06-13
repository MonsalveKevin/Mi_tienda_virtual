-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-06-2024 a las 06:50:07
-- Versión del servidor: 8.0.31
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tiendavirtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `categoria_id` bigint NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `categoria_descripcion` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `categoria_dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoria_estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `dePedido_id` bigint NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint NOT NULL,
  `producto_id` bigint NOT NULL,
  `dePedido_precio` decimal(10,2) NOT NULL,
  `dePedido_cantidad` int NOT NULL,
  PRIMARY KEY (`dePedido_id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `producto_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temporal`
--

DROP TABLE IF EXISTS `detalle_temporal`;
CREATE TABLE IF NOT EXISTS `detalle_temporal` (
  `deTemporal_id` bigint NOT NULL AUTO_INCREMENT,
  `producto_id` bigint NOT NULL,
  `deTemporal_precio` decimal(10,2) NOT NULL,
  `deTemporal_cantidad` int NOT NULL,
  `deTemporal_token` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`deTemporal_id`),
  KEY `producto_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

DROP TABLE IF EXISTS `modulo`;
CREATE TABLE IF NOT EXISTS `modulo` (
  `modulo_id` bigint NOT NULL AUTO_INCREMENT,
  `modulo_titulo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `modulo_descripcion` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `modulo_estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`modulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `pedido_id` bigint NOT NULL AUTO_INCREMENT,
  `persona_id` bigint NOT NULL,
  `pedido_fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pedido_monto` decimal(10,2) NOT NULL,
  `tipoPago_id` bigint NOT NULL,
  `pedido_estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`pedido_id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

DROP TABLE IF EXISTS `permiso`;
CREATE TABLE IF NOT EXISTS `permiso` (
  `permiso_id` bigint NOT NULL AUTO_INCREMENT,
  `rol_id` bigint NOT NULL,
  `modulo_id` bigint NOT NULL,
  `permiso_r` int NOT NULL DEFAULT '0',
  `permiso_w` int NOT NULL DEFAULT '0',
  `permiso_u` int NOT NULL DEFAULT '0',
  `permiso_d` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`permiso_id`),
  KEY `rol_id` (`rol_id`),
  KEY `modulo_id` (`modulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `persona_id` bigint NOT NULL AUTO_INCREMENT,
  `persona_identificacion` int NOT NULL,
  `persona_nombres` varchar(80) COLLATE utf8mb4_spanish_ci NOT NULL,
  `persona_apellidos` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `persona_telefono` bigint NOT NULL,
  `persona_email` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `persona_password` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `persona_nit` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `persona_direccion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `persona_token` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `rol_id` bigint NOT NULL,
  `persona_dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `persona_estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`persona_id`),
  KEY `rol_id` (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `producto_id` bigint NOT NULL AUTO_INCREMENT,
  `categoria_id` bigint NOT NULL,
  `producto_codigo` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `producto_nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `producto_descripcion` date NOT NULL,
  `producto_precio` decimal(10,2) NOT NULL,
  `producto_stock` int NOT NULL,
  `producto_imagen` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `producto_dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `producto_estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`producto_id`),
  KEY `categoria_id` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `rol_id` bigint NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `rol_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `rol_estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`pedido_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temporal`
--
ALTER TABLE `detalle_temporal`
  ADD CONSTRAINT `detalle_temporal_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD CONSTRAINT `permiso_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permiso_ibfk_2` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`modulo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
