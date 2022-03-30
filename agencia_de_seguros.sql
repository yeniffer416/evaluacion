-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-03-2022 a las 16:21:48
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agencia_de_seguros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accidente`
--

CREATE TABLE `accidente` (
  `cod_accidente` int(11) NOT NULL,
  `fecha_accidente` date NOT NULL,
  `lugar_accidente` varchar(30) NOT NULL,
  `hora_accidente` time NOT NULL,
  `vehiculo_persona_id_vehiculo_persona` int(11) NOT NULL,
  `multa_id_multa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `accidente`
--

INSERT INTO `accidente` (`cod_accidente`, `fecha_accidente`, `lugar_accidente`, `hora_accidente`, `vehiculo_persona_id_vehiculo_persona`, `multa_id_multa`) VALUES
(5432, '2022-03-02', 'centro', '15:18:50', 145653, 6584),
(6543, '2022-03-07', 'parque santander', '01:18:50', 145633, 6547);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multa`
--

CREATE TABLE `multa` (
  `id_multa` int(11) NOT NULL,
  `fecha_multa` date NOT NULL,
  `hora_multa` time NOT NULL,
  `lugar_multa` varchar(30) NOT NULL,
  `valor_multa` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `multa`
--

INSERT INTO `multa` (`id_multa`, `fecha_multa`, `hora_multa`, `lugar_multa`, `valor_multa`) VALUES
(6547, '2022-03-10', '11:09:34', 'tolima', '43000'),
(6584, '2022-03-09', '03:13:47', 'pereira', '45000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nom_apel` varchar(30) NOT NULL,
  `Ciudad_persona` varchar(30) NOT NULL,
  `munici_persona` varchar(30) NOT NULL,
  `direc_persona` varchar(30) NOT NULL,
  `celu_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nom_apel`, `Ciudad_persona`, `munici_persona`, `direc_persona`, `celu_persona`) VALUES
(6543, 'fabian', 'ibague', 'espinal', 'cra3 mz15', 342567),
(54362, 'mya', 'neiva', 'huila', 'cs16mz3', 3425);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int(11) NOT NULL,
  `matricula_vehiculo` varchar(30) NOT NULL,
  `marca_vehiculo` varchar(30) NOT NULL,
  `modelo_vehiculo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `matricula_vehiculo`, `marca_vehiculo`, `modelo_vehiculo`) VALUES
(7654, '9433', '543', 'honda7'),
(7865, '3254', '876', 'toyota15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_persona`
--

CREATE TABLE `vehiculo_persona` (
  `id_vehiculo_persona` int(11) NOT NULL,
  `vehiculo_id_vehiculo` int(11) NOT NULL,
  `persona_id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculo_persona`
--

INSERT INTO `vehiculo_persona` (`id_vehiculo_persona`, `vehiculo_id_vehiculo`, `persona_id_persona`) VALUES
(145653, 7865, 6543),
(145633, 7654, 54362);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accidente`
--
ALTER TABLE `accidente`
  ADD PRIMARY KEY (`cod_accidente`,`vehiculo_persona_id_vehiculo_persona`,`multa_id_multa`),
  ADD KEY `fk_accidente_vehiculo_persona1_idx` (`vehiculo_persona_id_vehiculo_persona`),
  ADD KEY `fk_accidente_multa1_idx` (`multa_id_multa`);

--
-- Indices de la tabla `multa`
--
ALTER TABLE `multa`
  ADD PRIMARY KEY (`id_multa`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- Indices de la tabla `vehiculo_persona`
--
ALTER TABLE `vehiculo_persona`
  ADD PRIMARY KEY (`id_vehiculo_persona`,`vehiculo_id_vehiculo`,`persona_id_persona`),
  ADD KEY `fk_vehiculo_has_persona_persona1_idx` (`persona_id_persona`),
  ADD KEY `fk_vehiculo_has_persona_vehiculo_idx` (`vehiculo_id_vehiculo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accidente`
--
ALTER TABLE `accidente`
  ADD CONSTRAINT `fk_accidente_multa1` FOREIGN KEY (`multa_id_multa`) REFERENCES `multa` (`id_multa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_accidente_vehiculo_persona1` FOREIGN KEY (`vehiculo_persona_id_vehiculo_persona`) REFERENCES `vehiculo_persona` (`id_vehiculo_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculo_persona`
--
ALTER TABLE `vehiculo_persona`
  ADD CONSTRAINT `fk_vehiculo_has_persona_persona1` FOREIGN KEY (`persona_id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vehiculo_has_persona_vehiculo` FOREIGN KEY (`vehiculo_id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
