-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Jul 2020 um 10:49
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_sanja_hoebenreich_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_sanja_hoebenreich_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_sanja_hoebenreich_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fk_location_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `fk_location_id`) VALUES
(1, 'John', 'Doe', 'john.doe@gmx.at', 1),
(2, 'Max', 'Mustermann', 'max.mustermann@gmx.at', 2),
(3, 'Sandra', 'Mustermann', 'sandra.mustermann@gmx.at', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dates`
--

CREATE TABLE `dates` (
  `date_id` bigint(20) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `recieve_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `dates`
--

INSERT INTO `dates` (`date_id`, `weight`, `delivery_date`, `recieve_date`) VALUES
(1, 5, '2020-07-15', '2020-07-01'),
(2, 15, '2020-07-27', '2020-07-06'),
(3, 55, '2020-07-31', '2020-07-24');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `employee_id` bigint(20) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `fk_info_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `fk_info_id`) VALUES
(1, 'Kory', 'Dresdner', 1),
(2, 'Merlin', 'Bullard', 2),
(3, 'Hanne', 'Huxley', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee_infos`
--

CREATE TABLE `employee_infos` (
  `info_id` bigint(20) NOT NULL,
  `fk_employee_id` bigint(20) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `departement` varchar(50) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee_infos`
--

INSERT INTO `employee_infos` (`info_id`, `fk_employee_id`, `salary`, `departement`, `from_date`, `to_date`) VALUES
(1, 1, 50000, 'Sales', '2015-07-14', '9999-01-01'),
(2, 2, 90000, 'Marketing', '2020-02-04', '9999-01-01'),
(3, 3, 1000000, 'CEO', '2000-08-05', '9999-01-01');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locations`
--

CREATE TABLE `locations` (
  `location_id` bigint(20) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `ZIP_code` int(11) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL,
  `fk_customer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `locations`
--

INSERT INTO `locations` (`location_id`, `state`, `city`, `street`, `ZIP_code`, `house_number`, `fk_customer_id`) VALUES
(1, 'Belgium', 'Bruessels', 'Rue Royale', 1000, 59, 1),
(2, 'Serbia', 'Belgrade', 'Partizanski Blok Ulica 2', 11060, 31, 2),
(3, 'Austria', 'Graz', 'Jakominiplatz', 8010, 2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `packages`
--

CREATE TABLE `packages` (
  `package_id` bigint(20) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `fk_date_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `packages`
--

INSERT INTO `packages` (`package_id`, `weight`, `price`, `fk_date_id`) VALUES
(1, 50, 16, 1),
(2, 50, 25, NULL),
(3, 5, 0, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payments`
--

CREATE TABLE `payments` (
  `payment_id` bigint(20) NOT NULL,
  `invoice_number` bigint(20) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `fk_customer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_number`, `amount`, `invoice_date`, `fk_customer_id`) VALUES
(1, 100001, 16, '2020-06-09', 1),
(2, 100002, 25, '2020-07-12', 2),
(3, 100003, 0, '2020-07-07', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processing`
--

CREATE TABLE `processing` (
  `process_id` bigint(20) NOT NULL,
  `fk_package_id` bigint(20) DEFAULT NULL,
  `fk_employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `processing`
--

INSERT INTO `processing` (`process_id`, `fk_package_id`, `fk_employee_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recieve_send`
--

CREATE TABLE `recieve_send` (
  `recieve_send_id` bigint(20) NOT NULL,
  `fk_customer_id` bigint(20) DEFAULT NULL,
  `fk_package_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `recieve_send`
--

INSERT INTO `recieve_send` (`recieve_send_id`, `fk_customer_id`, `fk_package_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transports`
--

CREATE TABLE `transports` (
  `transport_id` bigint(20) NOT NULL,
  `fk_package_id` bigint(20) DEFAULT NULL,
  `fk_customer_id` bigint(20) DEFAULT NULL,
  `fk_location_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `transports`
--

INSERT INTO `transports` (`transport_id`, `fk_package_id`, `fk_customer_id`, `fk_location_id`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indizes für die Tabelle `dates`
--
ALTER TABLE `dates`
  ADD PRIMARY KEY (`date_id`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_info_id` (`fk_info_id`);

--
-- Indizes für die Tabelle `employee_infos`
--
ALTER TABLE `employee_infos`
  ADD PRIMARY KEY (`info_id`);

--
-- Indizes für die Tabelle `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indizes für die Tabelle `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_date_id` (`fk_date_id`);

--
-- Indizes für die Tabelle `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `processing`
--
ALTER TABLE `processing`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indizes für die Tabelle `recieve_send`
--
ALTER TABLE `recieve_send`
  ADD PRIMARY KEY (`recieve_send_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `transports`
--
ALTER TABLE `transports`
  ADD PRIMARY KEY (`transport_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints der Tabelle `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`fk_info_id`) REFERENCES `employee_infos` (`info_id`);

--
-- Constraints der Tabelle `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`fk_date_id`) REFERENCES `dates` (`date_id`);

--
-- Constraints der Tabelle `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints der Tabelle `processing`
--
ALTER TABLE `processing`
  ADD CONSTRAINT `processing_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `packages` (`package_id`),
  ADD CONSTRAINT `processing_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints der Tabelle `recieve_send`
--
ALTER TABLE `recieve_send`
  ADD CONSTRAINT `recieve_send_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `recieve_send_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `packages` (`package_id`);

--
-- Constraints der Tabelle `transports`
--
ALTER TABLE `transports`
  ADD CONSTRAINT `transports_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `packages` (`package_id`),
  ADD CONSTRAINT `transports_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `transports_ibfk_3` FOREIGN KEY (`fk_location_id`) REFERENCES `locations` (`location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
