-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 20-10-09 00:20
-- 서버 버전: 10.4.14-MariaDB
-- PHP 버전: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `culodebotella`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL,
  `cliente_nombre` varchar(45) DEFAULT NULL,
  `cliente_direccion` varchar(45) DEFAULT NULL,
  `cliente_telefono` varchar(45) DEFAULT NULL,
  `cliente_email` varchar(45) DEFAULT NULL,
  `cliente_fecha_registro` varchar(45) DEFAULT NULL,
  `cliente_recomendacion` varchar(45) DEFAULT NULL,
  `cliente_col` varchar(45) DEFAULT NULL,
  `vendedor_vendedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `gafa`
--

CREATE TABLE `gafa` (
  `gafa_id` int(11) NOT NULL,
  `gafa_marca` varchar(45) DEFAULT NULL,
  `gafa_graduacion` varchar(45) DEFAULT NULL,
  `gafa_tipo_montura` varchar(45) DEFAULT NULL,
  `gafa_color_montura` varchar(45) DEFAULT NULL,
  `gafa_color_cristal` varchar(45) DEFAULT NULL,
  `gafa_precio` int(11) DEFAULT NULL,
  `vendedor_vendedor_id` int(11) NOT NULL,
  `cliente_cliente_id` int(11) NOT NULL,
  `cliente_vendedor_vendedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `marca`
--

CREATE TABLE `marca` (
  `marca_id` int(11) NOT NULL,
  `marca_nombre` varchar(45) DEFAULT NULL,
  `proveedor_proveedor_id` int(11) NOT NULL,
  `proveedor_gafa_gafa_id` int(11) NOT NULL,
  `proveedor_gafa_vendedor_vendedor_id` int(11) NOT NULL,
  `proveedor_gafa_gafa_id1` int(11) NOT NULL,
  `proveedor_gafa_vendedor_vendedor_id1` int(11) NOT NULL,
  `gafa_gafa_id` int(11) NOT NULL,
  `gafa_vendedor_vendedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `proveedor`
--

CREATE TABLE `proveedor` (
  `proveedor_id` int(11) NOT NULL,
  `proveedor_nombre` varchar(45) DEFAULT NULL,
  `proveedor_direccion` varchar(45) DEFAULT NULL,
  `proveedor_telefono` varchar(45) DEFAULT NULL,
  `proveedor_fax` varchar(45) DEFAULT NULL,
  `proveedor_nif` varchar(45) DEFAULT NULL,
  `proveedor_marca` varchar(45) DEFAULT NULL,
  `gafa_gafa_id` int(11) NOT NULL,
  `gafa_vendedor_vendedor_id` int(11) NOT NULL,
  `gafa_gafa_id1` int(11) NOT NULL,
  `gafa_vendedor_vendedor_id1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `vendedor`
--

CREATE TABLE `vendedor` (
  `vendedor_id` int(11) NOT NULL,
  `vendedor_nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`,`vendedor_vendedor_id`),
  ADD KEY `fk_cliente_vendedor_idx` (`vendedor_vendedor_id`);

--
-- 테이블의 인덱스 `gafa`
--
ALTER TABLE `gafa`
  ADD PRIMARY KEY (`gafa_id`,`vendedor_vendedor_id`,`cliente_cliente_id`,`cliente_vendedor_vendedor_id`),
  ADD KEY `fk_gafa_vendedor1_idx` (`vendedor_vendedor_id`),
  ADD KEY `fk_gafa_cliente1_idx` (`cliente_cliente_id`,`cliente_vendedor_vendedor_id`);

--
-- 테이블의 인덱스 `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`marca_id`,`proveedor_proveedor_id`,`proveedor_gafa_gafa_id`,`proveedor_gafa_vendedor_vendedor_id`,`proveedor_gafa_gafa_id1`,`proveedor_gafa_vendedor_vendedor_id1`,`gafa_gafa_id`,`gafa_vendedor_vendedor_id`),
  ADD KEY `fk_marca_proveedor1_idx` (`proveedor_proveedor_id`,`proveedor_gafa_gafa_id`,`proveedor_gafa_vendedor_vendedor_id`,`proveedor_gafa_gafa_id1`,`proveedor_gafa_vendedor_vendedor_id1`),
  ADD KEY `fk_marca_gafa1_idx` (`gafa_gafa_id`,`gafa_vendedor_vendedor_id`);

--
-- 테이블의 인덱스 `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`proveedor_id`,`gafa_gafa_id`,`gafa_vendedor_vendedor_id`,`gafa_gafa_id1`,`gafa_vendedor_vendedor_id1`),
  ADD KEY `fk_proveedor_gafa1_idx` (`gafa_gafa_id1`,`gafa_vendedor_vendedor_id1`);

--
-- 테이블의 인덱스 `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`vendedor_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `gafa`
--
ALTER TABLE `gafa`
  MODIFY `gafa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `marca`
--
ALTER TABLE `marca`
  MODIFY `marca_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `proveedor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `vendedor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_vendedor` FOREIGN KEY (`vendedor_vendedor_id`) REFERENCES `vendedor` (`vendedor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 테이블의 제약사항 `gafa`
--
ALTER TABLE `gafa`
  ADD CONSTRAINT `fk_gafa_cliente1` FOREIGN KEY (`cliente_cliente_id`,`cliente_vendedor_vendedor_id`) REFERENCES `cliente` (`cliente_id`, `vendedor_vendedor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gafa_vendedor1` FOREIGN KEY (`vendedor_vendedor_id`) REFERENCES `vendedor` (`vendedor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 테이블의 제약사항 `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `fk_marca_gafa1` FOREIGN KEY (`gafa_gafa_id`,`gafa_vendedor_vendedor_id`) REFERENCES `gafa` (`gafa_id`, `vendedor_vendedor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_marca_proveedor1` FOREIGN KEY (`proveedor_proveedor_id`,`proveedor_gafa_gafa_id`,`proveedor_gafa_vendedor_vendedor_id`,`proveedor_gafa_gafa_id1`,`proveedor_gafa_vendedor_vendedor_id1`) REFERENCES `proveedor` (`proveedor_id`, `gafa_gafa_id`, `gafa_vendedor_vendedor_id`, `gafa_gafa_id1`, `gafa_vendedor_vendedor_id1`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 테이블의 제약사항 `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedor_gafa1` FOREIGN KEY (`gafa_gafa_id1`,`gafa_vendedor_vendedor_id1`) REFERENCES `gafa` (`gafa_id`, `vendedor_vendedor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
