-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2023 a las 14:14:29
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnasio1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `idProfesional` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `Comentarios` time NOT NULL,
  `fechaCreación` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `idProfesional`, `idUsuario`, `fecha`, `Comentarios`, `fechaCreación`) VALUES
(7, 1, 7, '2023-01-20', '17:53:00', '2023-01-12 13:49:24'),
(8, 1, 7, '2023-01-19', '17:11:00', '2023-01-12 14:08:53'),
(9, 1, 7, '2023-01-19', '19:14:00', '2023-01-12 14:14:27'),
(10, 2, 7, '2023-01-19', '19:14:00', '2023-01-12 14:14:36'),
(13, 2, 6, '2023-01-18', '17:49:00', '2023-01-13 13:50:34'),
(15, 1, 6, '2023-01-19', '22:19:00', '2023-01-13 13:51:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `foto` varchar(32) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `ultimaActualizacion` datetime NOT NULL,
  `fechaCreacicion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`id`, `nombre`, `foto`, `estado`, `ultimaActualizacion`, `fechaCreacicion`) VALUES
(1, 'miguel', '[value-3]', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'lord ', '', 1, '0000-00-00 00:00:00', '2023-01-12 13:54:05'),
(5, 'Tom Platz', '', 1, '0000-00-00 00:00:00', '2023-01-19 12:27:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) DEFAULT NULL,
  `pass` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `foto` varchar(32) NOT NULL,
  `administrador` tinyint(1) NOT NULL DEFAULT 0,
  `estado` int(11) NOT NULL DEFAULT 1,
  `ultimaModificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fechaCreacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `pass`, `email`, `foto`, `administrador`, `estado`, `ultimaModificacion`, `fechaCreacion`) VALUES
(1, 'Sergio', '2948', 'sergio@gmail.com', 'user.png', 1, 1, '2023-01-19 13:06:38', '2022-11-03 12:30:39'),
(5, 'jia', '123', 'jiahao@gmail.com', '', 0, 1, '2022-11-25 07:51:30', '2022-11-25 07:51:30'),
(6, 'david', '123', 'david@gmail.com', '', 0, 1, '2022-11-25 08:31:22', '2022-11-25 08:31:22'),
(7, 'hola', '123', 'hola@gmail.com', '', 0, 1, '2023-01-12 11:18:31', '2023-01-12 11:18:31'),
(8, 'administrador', '123', 'administrador@gmail.com', '', 0, 1, '2023-01-13 11:52:26', '2023-01-13 11:52:26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cita_idProfesional` (`idProfesional`),
  ADD KEY `Cita_idUsuario` (`idUsuario`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `Cita_idProfesional` FOREIGN KEY (`idProfesional`) REFERENCES `trabajadores` (`id`),
  ADD CONSTRAINT `Cita_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
