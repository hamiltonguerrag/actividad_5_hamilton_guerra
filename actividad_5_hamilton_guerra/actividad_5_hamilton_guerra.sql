-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para heladeria_y_pizzeria_la_65
DROP DATABASE IF EXISTS `heladeria_y_pizzeria_la_65`;
CREATE DATABASE IF NOT EXISTS `heladeria_y_pizzeria_la_65` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `heladeria_y_pizzeria_la_65`;

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='esta tabla tendra los clientes';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.customers: ~6 rows (aproximadamente)
DELETE FROM `customers`;
INSERT INTO `customers` (`id`, `name`, `age`) VALUES
	(1, 'Hamilton Guerra', 19),
	(2, 'Vanessa Guerra', 22),
	(3, 'Carlos Patricio', 34),
	(4, 'Sofia Cardona', 45),
	(5, 'Katerine Guerra', 13),
	(6, 'Sandra Sofia Gutierrez', 22);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.discoints
DROP TABLE IF EXISTS `discoints`;
CREATE TABLE IF NOT EXISTS `discoints` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` float(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='esta tabla contendra los descuentos';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.discoints: ~0 rows (aproximadamente)
DELETE FROM `discoints`;
INSERT INTO `discoints` (`id`, `name`, `value`) VALUES
	(1, 'Dia de las Madres', 0.20),
	(2, 'Dia de la Independencia', 0.05),
	(3, 'Cumpleaños ', 0.06),
	(4, 'Viernes 13', 0.10),
	(5, 'Dia del Padre', 0.07);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='esta tabla contendra los productos';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.products: ~0 rows (aproximadamente)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `price`) VALUES
	(1, 'Pizza', 25000.00),
	(2, 'Helado', 15000.00),
	(3, 'Hamburguesa', 7000.00),
	(4, 'Pollo', 4000.00),
	(5, 'Gaseosa', 8000.00);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales
DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` float(12,2) NOT NULL DEFAULT 0.00,
  `costomer_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='esta tabla contendra las ventas realizadas';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales: ~0 rows (aproximadamente)
DELETE FROM `sales`;
INSERT INTO `sales` (`id`, `date`, `value`, `costomer_id`) VALUES
	(1, '2022-06-25', 125000.00, 6),
	(2, '2022-06-26', 21000.00, 4),
	(3, '2022-06-26', 15000.00, 1),
	(4, '2022-06-27', 8000.00, 2),
	(5, '2022-06-28', 40000.00, 3),
	(6, '2022-06-29', 150000.00, 5);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales_discoints
DROP TABLE IF EXISTS `sales_discoints`;
CREATE TABLE IF NOT EXISTS `sales_discoints` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` smallint(5) unsigned NOT NULL,
  `discoint_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Este campo contendra la unión de la tabla ventas y la tabla descuento';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales_discoints: ~0 rows (aproximadamente)
DELETE FROM `sales_discoints`;
INSERT INTO `sales_discoints` (`id`, `sale_id`, `discoint_id`) VALUES
	(1, 1, 3),
	(2, 3, 4),
	(3, 2, 5),
	(4, 4, 2),
	(5, 5, 3),
	(6, 6, 1);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales_produts
DROP TABLE IF EXISTS `sales_produts`;
CREATE TABLE IF NOT EXISTS `sales_produts` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` smallint(5) unsigned NOT NULL,
  `product_id` smallint(5) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  `value` float(12,2) unsigned NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='esta campo contendra la union de las tablas ventas y productos ';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales_produts: ~0 rows (aproximadamente)
DELETE FROM `sales_produts`;
INSERT INTO `sales_produts` (`id`, `sale_id`, `product_id`, `quantity`, `value`) VALUES
	(1, 1, 1, 5, 25000.00),
	(2, 2, 3, 3, 7000.00),
	(3, 3, 2, 1, 15000.00),
	(4, 4, 4, 2, 4000.00),
	(5, 5, 5, 5, 8000.00),
	(6, 6, 1, 6, 25000.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
