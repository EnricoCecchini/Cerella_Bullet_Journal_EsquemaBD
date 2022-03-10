-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2022 at 04:16 AM
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
  `CategoriaID` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `plantilla_categoria`
--

CREATE TABLE `plantilla_categoria` (
  `plantillaID` int(11) NOT NULL,
  `categoriaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `plantilla_journal`
--

CREATE TABLE `plantilla_journal` (
  `PlantillaID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Imagen` longblob NOT NULL,
  `Descripcion` varchar(500) NOT NULL
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
-- Table structure for table `tipo_journal`
--

CREATE TABLE `tipo_journal` (
  `journalID` int(11) NOT NULL,
  `plantillaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `userID` int(11) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD PRIMARY KEY (`CategoriaID`);

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
-- Indexes for table `plantilla_categoria`
--
ALTER TABLE `plantilla_categoria`
  ADD KEY `plantillaID` (`plantillaID`,`categoriaID`),
  ADD KEY `categoriaID` (`categoriaID`);

--
-- Indexes for table `plantilla_journal`
--
ALTER TABLE `plantilla_journal`
  ADD PRIMARY KEY (`PlantillaID`);

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
  ADD KEY `usuarioID` (`usuarioID`,`postID`),
  ADD KEY `postID` (`postID`);

--
-- Indexes for table `texto_journal`
--
ALTER TABLE `texto_journal`
  ADD KEY `journalID` (`journalID`,`modificacionID`),
  ADD KEY `modificacionID` (`modificacionID`);

--
-- Indexes for table `tipo_journal`
--
ALTER TABLE `tipo_journal`
  ADD KEY `journalID` (`journalID`,`plantillaID`),
  ADD KEY `plantillaID` (`plantillaID`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `usuario_tiene_journal`
--
ALTER TABLE `usuario_tiene_journal`
  ADD KEY `usuarioID` (`usuarioID`,`journalID`),
  ADD KEY `journalID` (`journalID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `plantilla_journal`
--
ALTER TABLE `plantilla_journal`
  MODIFY `PlantillaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`JournalID`) REFERENCES `texto_journal` (`journalID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plantilla_categoria`
--
ALTER TABLE `plantilla_categoria`
  ADD CONSTRAINT `plantilla_categoria_ibfk_1` FOREIGN KEY (`categoriaID`) REFERENCES `categoria` (`CategoriaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plantilla_journal`
--
ALTER TABLE `plantilla_journal`
  ADD CONSTRAINT `plantilla_journal_ibfk_1` FOREIGN KEY (`PlantillaID`) REFERENCES `plantilla_categoria` (`plantillaID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `post_por_ibfk_1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_por_ibfk_2` FOREIGN KEY (`postID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `texto_journal`
--
ALTER TABLE `texto_journal`
  ADD CONSTRAINT `texto_journal_ibfk_1` FOREIGN KEY (`modificacionID`) REFERENCES `modificacion_texto` (`ModificacionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tipo_journal`
--
ALTER TABLE `tipo_journal`
  ADD CONSTRAINT `tipo_journal_ibfk_1` FOREIGN KEY (`journalID`) REFERENCES `journal` (`JournalID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tipo_journal_ibfk_2` FOREIGN KEY (`plantillaID`) REFERENCES `plantilla_journal` (`PlantillaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usuario_tiene_journal` (`usuarioID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuario_tiene_journal`
--
ALTER TABLE `usuario_tiene_journal`
  ADD CONSTRAINT `usuario_tiene_journal_ibfk_1` FOREIGN KEY (`journalID`) REFERENCES `journal` (`JournalID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
