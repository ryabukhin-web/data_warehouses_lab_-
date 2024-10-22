-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 21 2024 г., 14:42
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `customershub`
--

CREATE TABLE `customershub` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `LoadDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `customerssatellite`
--

CREATE TABLE `customerssatellite` (
  `CustomerID` int DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `LoadDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `movieshub`
--

CREATE TABLE `movieshub` (
  `MovieID` int NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Genre` varchar(100) DEFAULT NULL,
  `ReleaseYear` int DEFAULT NULL,
  `LoadDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `moviessatellite`
--

CREATE TABLE `moviessatellite` (
  `MovieID` int DEFAULT NULL,
  `Director` varchar(255) DEFAULT NULL,
  `LoadDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rentalslink`
--

CREATE TABLE `rentalslink` (
  `RentalID` int NOT NULL,
  `MovieID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `RentalDate` datetime NOT NULL,
  `ReturnDate` datetime DEFAULT NULL,
  `LoadDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `customershub`
--
ALTER TABLE `customershub`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Индексы таблицы `customerssatellite`
--
ALTER TABLE `customerssatellite`
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Индексы таблицы `movieshub`
--
ALTER TABLE `movieshub`
  ADD PRIMARY KEY (`MovieID`);

--
-- Индексы таблицы `moviessatellite`
--
ALTER TABLE `moviessatellite`
  ADD KEY `MovieID` (`MovieID`);

--
-- Индексы таблицы `rentalslink`
--
ALTER TABLE `rentalslink`
  ADD PRIMARY KEY (`RentalID`),
  ADD KEY `MovieID` (`MovieID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `customershub`
--
ALTER TABLE `customershub`
  MODIFY `CustomerID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `movieshub`
--
ALTER TABLE `movieshub`
  MODIFY `MovieID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rentalslink`
--
ALTER TABLE `rentalslink`
  MODIFY `RentalID` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `customerssatellite`
--
ALTER TABLE `customerssatellite`
  ADD CONSTRAINT `customerssatellite_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customershub` (`CustomerID`);

--
-- Ограничения внешнего ключа таблицы `moviessatellite`
--
ALTER TABLE `moviessatellite`
  ADD CONSTRAINT `moviessatellite_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movieshub` (`MovieID`);

--
-- Ограничения внешнего ключа таблицы `rentalslink`
--
ALTER TABLE `rentalslink`
  ADD CONSTRAINT `rentalslink_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movieshub` (`MovieID`),
  ADD CONSTRAINT `rentalslink_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customershub` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
