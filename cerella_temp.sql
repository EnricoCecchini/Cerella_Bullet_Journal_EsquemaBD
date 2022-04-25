-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2022 at 06:01 AM
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
-- Database: `cerella_temp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `categoriaID` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`categoriaID`, `descripcion`) VALUES
(1, 'Reflexion'),
(2, 'Cuidado Personal');

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `codigo` varchar(16) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` int(150) NOT NULL,
  `portada` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `journal`
--

INSERT INTO `journal` (`codigo`, `titulo`, `descripcion`, `portada`) VALUES
('H6MUIAzomdf7g3JW', 'Prueba 69', 0, 'prueba_3/pg1.jpg'),
('zAQQfbjPi37ITZn6', 'Prueba pp', 0, 'prueba_1/pg1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `modificacion`
--

CREATE TABLE `modificacion` (
  `modificacionID` int(11) NOT NULL,
  `texto` varchar(500) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `modificacion_journal`
--

CREATE TABLE `modificacion_journal` (
  `modificacionID` int(11) NOT NULL,
  `codigo` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pagina`
--

CREATE TABLE `pagina` (
  `paginaID` int(11) NOT NULL,
  `numPagina` int(11) NOT NULL,
  `urlPagina` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pagina`
--

INSERT INTO `pagina` (`paginaID`, `numPagina`, `urlPagina`) VALUES
(1, 1, 'prueba_1/pg1.jpg'),
(2, 1, 'prueba_2/pg1.jpg'),
(3, 1, 'prueba_3/pg1.jpg'),
(4, 2, 'prueba_1/pg2.jpg'),
(5, 3, 'prueba_1/pg3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `plantilla`
--

CREATE TABLE `plantilla` (
  `plantillaID` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `portada` varchar(255) NOT NULL,
  `precio` float NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plantilla`
--

INSERT INTO `plantilla` (`plantillaID`, `nombre`, `portada`, `precio`, `descripcion`) VALUES
(1, 'Prueba 1', 'prueba_1/pg1.jpg', 69.99, 'Prueba 1'),
(2, 'Prueba 2', 'prueba_2/pg1.jpg', 42, 'Prueba 2'),
(3, 'Prueba 3', 'prueba_3/pg1.jpg', 69.42, 'Prueba 3');

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
(1, 2),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plantilla_journal`
--

CREATE TABLE `plantilla_journal` (
  `codigo` varchar(16) NOT NULL,
  `plantillaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plantilla_journal`
--

INSERT INTO `plantilla_journal` (`codigo`, `plantillaID`) VALUES
('H6MUIAzomdf7g3JW', 3),
('zAQQfbjPi37ITZn6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plantilla_pagina`
--

CREATE TABLE `plantilla_pagina` (
  `plantillaID` int(11) NOT NULL,
  `paginaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plantilla_pagina`
--

INSERT INTO `plantilla_pagina` (`plantillaID`, `paginaID`) VALUES
(1, 1),
(1, 4),
(1, 5),
(2, 2),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `usuarioID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`usuarioID`, `username`, `correo`, `password`) VALUES
(1, 'lisi6', 'lisi@lisimail.com', 'Mipassw0rd.'),
(2, 'desli', 'deslizabet@caida.com', 'Mipassw0rd.');

-- --------------------------------------------------------

--
-- Table structure for table `usuario_journal`
--

CREATE TABLE `usuario_journal` (
  `usuarioID` int(11) NOT NULL,
  `codigo` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuario_journal`
--

INSERT INTO `usuario_journal` (`usuarioID`, `codigo`) VALUES
(1, 'H6MUIAzomdf7g3JW'),
(1, 'zAQQfbjPi37ITZn6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoriaID`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `modificacion`
--
ALTER TABLE `modificacion`
  ADD PRIMARY KEY (`modificacionID`);

--
-- Indexes for table `modificacion_journal`
--
ALTER TABLE `modificacion_journal`
  ADD KEY `modificacionID` (`modificacionID`,`codigo`),
  ADD KEY `codigo` (`codigo`);

--
-- Indexes for table `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`paginaID`);

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
  ADD KEY `codigo` (`codigo`,`plantillaID`),
  ADD KEY `plantillaID` (`plantillaID`);

--
-- Indexes for table `plantilla_pagina`
--
ALTER TABLE `plantilla_pagina`
  ADD KEY `plantillaID` (`plantillaID`,`paginaID`),
  ADD KEY `paginaID` (`paginaID`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuarioID`);

--
-- Indexes for table `usuario_journal`
--
ALTER TABLE `usuario_journal`
  ADD KEY `usuarioID` (`usuarioID`,`codigo`),
  ADD KEY `codigo` (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modificacion`
--
ALTER TABLE `modificacion`
  MODIFY `modificacionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagina`
--
ALTER TABLE `pagina`
  MODIFY `paginaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `plantilla`
--
ALTER TABLE `plantilla`
  MODIFY `plantillaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `modificacion_journal`
--
ALTER TABLE `modificacion_journal`
  ADD CONSTRAINT `modificacion_journal_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `journal` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modificacion_journal_ibfk_2` FOREIGN KEY (`modificacionID`) REFERENCES `modificacion` (`modificacionID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `plantilla_journal_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `journal` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plantilla_journal_ibfk_2` FOREIGN KEY (`plantillaID`) REFERENCES `plantilla` (`plantillaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plantilla_pagina`
--
ALTER TABLE `plantilla_pagina`
  ADD CONSTRAINT `plantilla_pagina_ibfk_1` FOREIGN KEY (`plantillaID`) REFERENCES `plantilla` (`plantillaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plantilla_pagina_ibfk_2` FOREIGN KEY (`paginaID`) REFERENCES `pagina` (`paginaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuario_journal`
--
ALTER TABLE `usuario_journal`
  ADD CONSTRAINT `usuario_journal_ibfk_2` FOREIGN KEY (`codigo`) REFERENCES `journal` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_journal_ibfk_3` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
