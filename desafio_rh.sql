-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 12, 2025 at 03:48 PM
-- Server version: 8.3.0
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `desafio_rh`
--

-- --------------------------------------------------------

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `idCargo` int NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `descripcionCargo` text NOT NULL,
  `jefatura` tinyint(1) NOT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contrataciones`
--

DROP TABLE IF EXISTS `contrataciones`;
CREATE TABLE IF NOT EXISTS `contrataciones` (
  `idContratacion` int NOT NULL AUTO_INCREMENT,
  `idDepartamento` int NOT NULL,
  `idEmpleado` int NOT NULL,
  `idCargo` int NOT NULL,
  `idTipoContratacion` int NOT NULL,
  `fechaContratacion` varchar(30) NOT NULL,
  `salario` decimal(10,0) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idContratacion`),
  KEY `FkDepartamento` (`idDepartamento`),
  KEY `FkEmpleado` (`idEmpleado`),
  KEY `FkCargo` (`idCargo`),
  KEY `FkTipoContratacion` (`idTipoContratacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `idDepartamento` int NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` varchar(50) NOT NULL,
  `descripcionDepartamento` text NOT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `numeroDui` varchar(9) NOT NULL,
  `nombrePersona` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `numeroTelefono` varchar(9) NOT NULL,
  `correoInstitucional` varchar(50) NOT NULL,
  `fechaNac` varchar(30) NOT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `numeroDui`, `nombrePersona`, `usuario`, `numeroTelefono`, `correoInstitucional`, `fechaNac`) VALUES
(123, '0124553', 'Emiliano', 'Emi123', '74566547', 'emiliano123@udb.edu.sv', '12-10-1999');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_contratacion`
--

DROP TABLE IF EXISTS `tipo_contratacion`;
CREATE TABLE IF NOT EXISTS `tipo_contratacion` (
  `idTipoContratacion` int NOT NULL AUTO_INCREMENT,
  `tipoContratacion` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoContratacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contrataciones`
--
ALTER TABLE `contrataciones`
  ADD CONSTRAINT `contrataciones_ibfk_1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrataciones_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrataciones_ibfk_3` FOREIGN KEY (`idCargo`) REFERENCES `cargos` (`idCargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrataciones_ibfk_4` FOREIGN KEY (`idTipoContratacion`) REFERENCES `tipo_contratacion` (`idTipoContratacion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
