-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-03-2022 a las 22:01:32
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cerella`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CategoriaID` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CategoriaID`, `Descripcion`) VALUES
(1, 'Cuidado Personal'),
(2, 'Reflexión');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foro`
--

CREATE TABLE `foro` (
  `ForoID` int(11) NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `journal`
--

CREATE TABLE `journal` (
  `modificacion` longblob NOT NULL,
  `JournalID` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modificacion_texto`
--

CREATE TABLE `modificacion_texto` (
  `ModificacionID` int(11) NOT NULL,
  `texto` varchar(500) NOT NULL,
  `posX` int(11) NOT NULL,
  `posY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina`
--

CREATE TABLE `pagina` (
  `IDPagina` int(11) NOT NULL,
  `liga` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina_plantilla`
--

CREATE TABLE `pagina_plantilla` (
  `IDPlantilla` int(11) NOT NULL,
  `IDPagina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_categoria`
--

CREATE TABLE `plantilla_categoria` (
  `plantillaID` int(11) NOT NULL,
  `categoriaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_journal`
--

CREATE TABLE `plantilla_journal` (
  `PlantillaID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Imagen` longblob NOT NULL,
  `Descripcion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `PostID` int(11) NOT NULL,
  `Texto` varchar(500) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_en_foro`
--

CREATE TABLE `post_en_foro` (
  `postID` int(11) NOT NULL,
  `foroID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_por`
--

CREATE TABLE `post_por` (
  `usuarioID` int(11) NOT NULL,
  `postID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `texto_journal`
--

CREATE TABLE `texto_journal` (
  `journalID` int(11) NOT NULL,
  `modificacionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_journal`
--

CREATE TABLE `tipo_journal` (
  `journalID` int(11) NOT NULL,
  `plantillaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuarioID` int(11) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuarioID`, `Correo`, `password`, `username`) VALUES
(1, 'coreo@correo.com', '123456', 'user1'),
(2, 'local@prueba.com', '12345667', 'user2'),
(3, 'consuelo.jimenez@udem.edu', '1234567!A', 'usuariodeprueba'),
(4, 'jemdelag@hotmail.com', 'ejemploPRUEBA2.', 'P1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tiene_journal`
--

CREATE TABLE `usuario_tiene_journal` (
  `usuarioID` int(11) NOT NULL,
  `journalID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CategoriaID`);

--
-- Indices de la tabla `foro`
--
ALTER TABLE `foro`
  ADD PRIMARY KEY (`ForoID`);

--
-- Indices de la tabla `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`JournalID`);

--
-- Indices de la tabla `modificacion_texto`
--
ALTER TABLE `modificacion_texto`
  ADD PRIMARY KEY (`ModificacionID`);

--
-- Indices de la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`IDPagina`);

--
-- Indices de la tabla `pagina_plantilla`
--
ALTER TABLE `pagina_plantilla`
  ADD KEY `IDPlantilla` (`IDPlantilla`,`IDPagina`),
  ADD KEY `IDPagina` (`IDPagina`);

--
-- Indices de la tabla `plantilla_categoria`
--
ALTER TABLE `plantilla_categoria`
  ADD KEY `plantillaID` (`plantillaID`,`categoriaID`),
  ADD KEY `categoriaID` (`categoriaID`);

--
-- Indices de la tabla `plantilla_journal`
--
ALTER TABLE `plantilla_journal`
  ADD PRIMARY KEY (`PlantillaID`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostID`);

--
-- Indices de la tabla `post_en_foro`
--
ALTER TABLE `post_en_foro`
  ADD KEY `postID` (`postID`,`foroID`),
  ADD KEY `foroID` (`foroID`);

--
-- Indices de la tabla `post_por`
--
ALTER TABLE `post_por`
  ADD KEY `postID` (`postID`),
  ADD KEY `usuarioID` (`usuarioID`);

--
-- Indices de la tabla `texto_journal`
--
ALTER TABLE `texto_journal`
  ADD KEY `journalID` (`journalID`,`modificacionID`),
  ADD KEY `modificacionID` (`modificacionID`);

--
-- Indices de la tabla `tipo_journal`
--
ALTER TABLE `tipo_journal`
  ADD KEY `journalID` (`journalID`,`plantillaID`),
  ADD KEY `plantillaID` (`plantillaID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuarioID`);

--
-- Indices de la tabla `usuario_tiene_journal`
--
ALTER TABLE `usuario_tiene_journal`
  ADD KEY `journalID` (`journalID`),
  ADD KEY `usuarioID` (`usuarioID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `foro`
--
ALTER TABLE `foro`
  MODIFY `ForoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `journal`
--
ALTER TABLE `journal`
  MODIFY `JournalID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modificacion_texto`
--
ALTER TABLE `modificacion_texto`
  MODIFY `ModificacionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagina`
--
ALTER TABLE `pagina`
  MODIFY `IDPagina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plantilla_journal`
--
ALTER TABLE `plantilla_journal`
  MODIFY `PlantillaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`JournalID`) REFERENCES `texto_journal` (`journalID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagina_plantilla`
--
ALTER TABLE `pagina_plantilla`
  ADD CONSTRAINT `pagina_plantilla_ibfk_1` FOREIGN KEY (`IDPlantilla`) REFERENCES `plantilla_journal` (`PlantillaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pagina_plantilla_ibfk_2` FOREIGN KEY (`IDPagina`) REFERENCES `pagina` (`IDPagina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `plantilla_categoria`
--
ALTER TABLE `plantilla_categoria`
  ADD CONSTRAINT `plantilla_categoria_ibfk_1` FOREIGN KEY (`categoriaID`) REFERENCES `categoria` (`CategoriaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `plantilla_journal`
--
ALTER TABLE `plantilla_journal`
  ADD CONSTRAINT `plantilla_journal_ibfk_1` FOREIGN KEY (`PlantillaID`) REFERENCES `plantilla_categoria` (`plantillaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `post_en_foro`
--
ALTER TABLE `post_en_foro`
  ADD CONSTRAINT `post_en_foro_ibfk_1` FOREIGN KEY (`foroID`) REFERENCES `foro` (`ForoID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_en_foro_ibfk_2` FOREIGN KEY (`postID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `post_por`
--
ALTER TABLE `post_por`
  ADD CONSTRAINT `post_por_ibfk_2` FOREIGN KEY (`postID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_por_ibfk_3` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `texto_journal`
--
ALTER TABLE `texto_journal`
  ADD CONSTRAINT `texto_journal_ibfk_1` FOREIGN KEY (`modificacionID`) REFERENCES `modificacion_texto` (`ModificacionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipo_journal`
--
ALTER TABLE `tipo_journal`
  ADD CONSTRAINT `tipo_journal_ibfk_1` FOREIGN KEY (`journalID`) REFERENCES `journal` (`JournalID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tipo_journal_ibfk_2` FOREIGN KEY (`plantillaID`) REFERENCES `plantilla_journal` (`PlantillaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_tiene_journal`
--
ALTER TABLE `usuario_tiene_journal`
  ADD CONSTRAINT `usuario_tiene_journal_ibfk_1` FOREIGN KEY (`journalID`) REFERENCES `journal` (`JournalID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_tiene_journal_ibfk_2` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
