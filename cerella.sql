-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2022 at 06:05 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cerella`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `categoriaID` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`categoriaID`, `descripcion`) VALUES
(1, 'Reflexion'),
(2, 'Cuidado Personal');

-- --------------------------------------------------------

--
-- Table structure for table `codigo`
--

CREATE TABLE `codigo` (
  `codigo` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `codigo`
--

INSERT INTO `codigo` (`codigo`) VALUES
('8wXHwqJRXrHBdoIu'),
('HUsfotlWv6AqBjhu'),
('LsNKpPKKEI9oOuIv'),
('PnnkkAHvrzAtoFOZ'),
('xo7K2IT24jAHS8dt');

-- --------------------------------------------------------

--
-- Table structure for table `codigo_plantilla`
--

CREATE TABLE `codigo_plantilla` (
  `codigo` varchar(16) NOT NULL,
  `plantillaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `codigo_plantilla`
--

INSERT INTO `codigo_plantilla` (`codigo`, `plantillaID`) VALUES
('8wXHwqJRXrHBdoIu', 2);

-- --------------------------------------------------------

--
-- Table structure for table `foro`
--

CREATE TABLE `foro` (
  `ForoID` int(11) NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `modificacion` longblob NOT NULL,
  `JournalID` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `modificacion_texto`
--

CREATE TABLE `modificacion_texto` (
  `ModificacionID` int(11) NOT NULL,
  `texto` varchar(500) NOT NULL,
  `posX` int(11) NOT NULL,
  `posY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pagina`
--

CREATE TABLE `pagina` (
  `IDPagina` int(11) NOT NULL,
  `liga` varchar(300) NOT NULL,
  `numPagina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pagina`
--

INSERT INTO `pagina` (`IDPagina`, `liga`, `numPagina`) VALUES
(1, 'https://sportshub.cbsistatic.com/i/2021/08/09/b5066a42-3bef-414c-b5ce-8022c6e33a5b/moon-knight-4-cover-header-1276285.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagina_plantilla`
--

CREATE TABLE `pagina_plantilla` (
  `plantillaID` int(11) NOT NULL,
  `IDPagina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pagina_plantilla`
--

INSERT INTO `pagina_plantilla` (`plantillaID`, `IDPagina`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plantilla`
--

CREATE TABLE `plantilla` (
  `plantillaID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Imagen` varchar(300) NOT NULL,
  `Descripcion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plantilla`
--

INSERT INTO `plantilla` (`plantillaID`, `Nombre`, `Imagen`, `Descripcion`) VALUES
(2, 'Prueba 1', 'https://sportshub.cbsistatic.com/i/2021/08/09/b5066a42-3bef-414c-b5ce-8022c6e33a5b/moon-knight-4-cover-header-1276285.jpg', 'Prueba 1');

-- --------------------------------------------------------

--
-- Table structure for table `plantilla_categoria`
--

CREATE TABLE `plantilla_categoria` (
  `plantillaID` int(11) NOT NULL,
  `categoriaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plantilla_categoria`
--

INSERT INTO `plantilla_categoria` (`plantillaID`, `categoriaID`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plantilla_journal`
--

CREATE TABLE `plantilla_journal` (
  `journalID` int(11) NOT NULL,
  `plantillaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `PostID` int(11) NOT NULL,
  `Texto` varchar(500) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_en_foro`
--

CREATE TABLE `post_en_foro` (
  `postID` int(11) NOT NULL,
  `foroID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_por`
--

CREATE TABLE `post_por` (
  `usuarioID` int(11) NOT NULL,
  `postID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `texto_journal`
--

CREATE TABLE `texto_journal` (
  `journalID` int(11) NOT NULL,
  `modificacionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `usuarioID` int(11) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`usuarioID`, `Correo`, `password`, `username`) VALUES
(1, 'coreo@correo.com', '123456', 'user1'),
(2, 'correo2@correo.com', '654321', 'usuario2'),
(3, 'correo3@correo.com', '9876543210', 'user3'),
(6, 'lisi@lisimail.com', '987654321', 'lisi6'),
(8, 'usuario123@mail.com', 'mipassw0rd', 'usuario123');

-- --------------------------------------------------------

--
-- Table structure for table `usuario_tiene_journal`
--

CREATE TABLE `usuario_tiene_journal` (
  `usuarioID` int(11) NOT NULL,
  `journalID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoriaID`);

--
-- Indexes for table `codigo`
--
ALTER TABLE `codigo`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo` (`codigo`),
  ADD KEY `codigo_2` (`codigo`);

--
-- Indexes for table `codigo_plantilla`
--
ALTER TABLE `codigo_plantilla`
  ADD KEY `codigo` (`codigo`,`plantillaID`),
  ADD KEY `plantillaID` (`plantillaID`);

--
-- Indexes for table `foro`
--
ALTER TABLE `foro`
  ADD PRIMARY KEY (`ForoID`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`JournalID`);

--
-- Indexes for table `modificacion_texto`
--
ALTER TABLE `modificacion_texto`
  ADD PRIMARY KEY (`ModificacionID`);

--
-- Indexes for table `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`IDPagina`);

--
-- Indexes for table `pagina_plantilla`
--
ALTER TABLE `pagina_plantilla`
  ADD KEY `IDPlantilla` (`plantillaID`,`IDPagina`),
  ADD KEY `IDPagina` (`IDPagina`);

--
-- Indexes for table `plantilla`
--
ALTER TABLE `plantilla`
  ADD PRIMARY KEY (`plantillaID`);

--
-- Indexes for table `plantilla_categoria`
--
ALTER TABLE `plantilla_categoria`
  ADD KEY `plantillaID` (`plantillaID`,`categoriaID`),
  ADD KEY `categoriaID` (`categoriaID`);

--
-- Indexes for table `plantilla_journal`
--
ALTER TABLE `plantilla_journal`
  ADD KEY `journalID` (`journalID`,`plantillaID`),
  ADD KEY `plantillaID` (`plantillaID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostID`);

--
-- Indexes for table `post_en_foro`
--
ALTER TABLE `post_en_foro`
  ADD KEY `postID` (`postID`,`foroID`),
  ADD KEY `foroID` (`foroID`);

--
-- Indexes for table `post_por`
--
ALTER TABLE `post_por`
  ADD KEY `postID` (`postID`),
  ADD KEY `usuarioID` (`usuarioID`);

--
-- Indexes for table `texto_journal`
--
ALTER TABLE `texto_journal`
  ADD KEY `journalID` (`journalID`,`modificacionID`),
  ADD KEY `modificacionID` (`modificacionID`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuarioID`);

--
-- Indexes for table `usuario_tiene_journal`
--
ALTER TABLE `usuario_tiene_journal`
  ADD KEY `journalID` (`journalID`),
  ADD KEY `usuarioID` (`usuarioID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `foro`
--
ALTER TABLE `foro`
  MODIFY `ForoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `JournalID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modificacion_texto`
--
ALTER TABLE `modificacion_texto`
  MODIFY `ModificacionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagina`
--
ALTER TABLE `pagina`
  MODIFY `IDPagina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `plantilla`
--
ALTER TABLE `plantilla`
  MODIFY `plantillaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `codigo_plantilla`
--
ALTER TABLE `codigo_plantilla`
  ADD CONSTRAINT `codigo_plantilla_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `codigo` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `codigo_plantilla_ibfk_2` FOREIGN KEY (`plantillaID`) REFERENCES `plantilla` (`plantillaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`JournalID`) REFERENCES `texto_journal` (`journalID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pagina_plantilla`
--
ALTER TABLE `pagina_plantilla`
  ADD CONSTRAINT `pagina_plantilla_ibfk_2` FOREIGN KEY (`IDPagina`) REFERENCES `pagina` (`IDPagina`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pagina_plantilla_ibfk_3` FOREIGN KEY (`plantillaID`) REFERENCES `plantilla` (`plantillaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plantilla_categoria`
--
ALTER TABLE `plantilla_categoria`
  ADD CONSTRAINT `plantilla_categoria_ibfk_1` FOREIGN KEY (`plantillaID`) REFERENCES `plantilla` (`plantillaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plantilla_categoria_ibfk_2` FOREIGN KEY (`categoriaID`) REFERENCES `categoria` (`categoriaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plantilla_journal`
--
ALTER TABLE `plantilla_journal`
  ADD CONSTRAINT `plantilla_journal_ibfk_1` FOREIGN KEY (`journalID`) REFERENCES `journal` (`JournalID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plantilla_journal_ibfk_2` FOREIGN KEY (`plantillaID`) REFERENCES `plantilla` (`PlantillaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_en_foro`
--
ALTER TABLE `post_en_foro`
  ADD CONSTRAINT `post_en_foro_ibfk_1` FOREIGN KEY (`foroID`) REFERENCES `foro` (`ForoID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_en_foro_ibfk_2` FOREIGN KEY (`postID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_por`
--
ALTER TABLE `post_por`
  ADD CONSTRAINT `post_por_ibfk_2` FOREIGN KEY (`postID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_por_ibfk_3` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `texto_journal`
--
ALTER TABLE `texto_journal`
  ADD CONSTRAINT `texto_journal_ibfk_1` FOREIGN KEY (`modificacionID`) REFERENCES `modificacion_texto` (`ModificacionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuario_tiene_journal`
--
ALTER TABLE `usuario_tiene_journal`
  ADD CONSTRAINT `usuario_tiene_journal_ibfk_1` FOREIGN KEY (`journalID`) REFERENCES `journal` (`JournalID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_tiene_journal_ibfk_2` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
