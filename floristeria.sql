-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-09-2024 a las 07:39:23
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
-- Base de datos: `floristeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos_producto`
--

CREATE TABLE `fotos_producto` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `url_foto` varchar(255) NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fotos_producto`
--

INSERT INTO `fotos_producto` (`id`, `id_producto`, `url_foto`, `fecha_publicacion`) VALUES
(1, 1, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.es%2Ffotos-vectores-gratis%2Fespacio-4k&psig=AOvVaw2TEftukcmWrwSLURm5VsDG&ust=1726032178866000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLjLyYnRt4gDFQAAAAAdAAAAABAE', '2024-09-10 05:22:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_historial`
--

CREATE TABLE `inventario_historial` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `tipo_movimiento` enum('entrada','salida') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario_historial`
--

INSERT INTO `inventario_historial` (`id`, `id_producto`, `tipo_movimiento`, `cantidad`, `fecha_movimiento`) VALUES
(1, 1, 'entrada', 30, '2024-09-10 05:21:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `stock_actual` int(11) NOT NULL,
  `stock_minimo` int(11) NOT NULL DEFAULT 0,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_actual`, `stock_minimo`, `fecha_actualizacion`) VALUES
(1, 'rosa', 'es de color rojo', 20.00, 'flores', 30, 10, '2024-09-10 05:16:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_eventos`
--

CREATE TABLE `ventas_eventos` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad_vendida` int(11) NOT NULL,
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp(),
  `cliente_nombre` varchar(100) DEFAULT NULL,
  `evento_descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas_eventos`
--

INSERT INTO `ventas_eventos` (`id`, `id_producto`, `cantidad_vendida`, `fecha_venta`, `cliente_nombre`, `evento_descripcion`) VALUES
(1, 1, 20, '2024-09-10 05:34:56', 'pedro', 'entregado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fotos_producto`
--
ALTER TABLE `fotos_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `inventario_historial`
--
ALTER TABLE `inventario_historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas_eventos`
--
ALTER TABLE `ventas_eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fotos_producto`
--
ALTER TABLE `fotos_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inventario_historial`
--
ALTER TABLE `inventario_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas_eventos`
--
ALTER TABLE `ventas_eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fotos_producto`
--
ALTER TABLE `fotos_producto`
  ADD CONSTRAINT `fotos_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `inventario_historial`
--
ALTER TABLE `inventario_historial`
  ADD CONSTRAINT `inventario_historial_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `ventas_eventos`
--
ALTER TABLE `ventas_eventos`
  ADD CONSTRAINT `ventas_eventos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
