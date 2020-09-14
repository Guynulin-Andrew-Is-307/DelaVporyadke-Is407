-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 14 2020 г., 14:34
-- Версия сервера: 5.7.25
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `schema`
--

-- --------------------------------------------------------

--
-- Структура таблицы `пользователь`
--

CREATE TABLE `пользователь` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Имя` varchar(255) NOT NULL,
  `Дата регистрации` date NOT NULL,
  `Пароль` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `пользователь`
--

INSERT INTO `пользователь` (`ID`, `Email`, `Имя`, `Дата регистрации`, `Пароль`) VALUES
(1, 'ladybag2000@gmail.com', 'Константин', '2007-09-16', '1'),
(2, 'ladybag2001@gmail.com', 'Сергей', '2007-09-16', '2');

-- --------------------------------------------------------

--
-- Структура таблицы `проект`
--

CREATE TABLE `проект` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Название` varchar(255) NOT NULL,
  `Автор` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `проект`
--

INSERT INTO `проект` (`ID`, `Название`, `Автор`) VALUES
(5, 'Авто', 1),
(10, 'Авто', 2),
(1, 'Входящие', 1),
(6, 'Входящие', 2),
(4, 'Домашние дела', 1),
(9, 'Домашние дела', 2),
(11, 'Друзья', 1),
(12, 'Игры', 1),
(3, 'Работа', 1),
(8, 'Работа', 2),
(2, 'Учеба', 1),
(7, 'Учеба', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `задача`
--

CREATE TABLE `задача` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Дата создания` date NOT NULL,
  `Выполнен` tinyint(1) NOT NULL,
  `Задача` varchar(255) NOT NULL,
  `Файл` varchar(255) DEFAULT NULL,
  `Дата выполнения` date DEFAULT NULL,
  `Автор` int(10) UNSIGNED NOT NULL,
  `Категория` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `задача`
--

INSERT INTO `задача` (`ID`, `Дата создания`, `Выполнен`, `Задача`, `Файл`, `Дата выполнения`, `Автор`, `Категория`) VALUES
(1, '1982-12-03', 0, 'Собеседование в IT компании', NULL, '2020-06-04', 1, 3),
(2, '1982-12-03', 0, 'Выполнить тестовое задание', NULL, '2019-12-25', 1, 3),
(3, '1982-12-03', 1, 'Сделать задание первого раздела', NULL, '2019-12-21', 1, 2),
(4, '1982-12-03', 0, 'Встреча с другом', NULL, '2019-12-22', 1, 1),
(5, '1982-12-03', 0, 'Купить корм для кота', NULL, NULL, 1, 4),
(6, '1982-12-03', 0, '<h1>Заказать пиццу</h1> h1 здесь для проверки фильтрации', NULL, NULL, 1, 4),
(7, '1982-12-03', 0, 'Собеседование в IT компании', NULL, '2020-06-04', 2, 8),
(8, '1982-12-03', 0, 'Выполнить тестовое задание', NULL, '2019-12-25', 2, 8),
(9, '1982-12-03', 1, 'Сделать задание первого раздела', NULL, '2019-12-21', 2, 7),
(10, '1982-12-03', 0, 'Встреча с другом', NULL, '2019-12-22', 2, 6),
(11, '1982-12-03', 0, 'Купить корм для кота', NULL, NULL, 2, 9),
(12, '1982-12-03', 1, 'Заказать суши', NULL, NULL, 2, 9),
(13, '2020-09-08', 0, 'Помочь Серому в отношениях', NULL, NULL, 1, 11),
(14, '2020-09-13', 1, 'Обойти Серого в КС', NULL, NULL, 1, 12);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `пользователь`
--
ALTER TABLE `пользователь`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Индексы таблицы `проект`
--
ALTER TABLE `проект`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Уникальное название и автор` (`Название`,`Автор`) USING BTREE,
  ADD KEY `проект_ibfk_1` (`Автор`);

--
-- Индексы таблицы `задача`
--
ALTER TABLE `задача`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Автор` (`Автор`),
  ADD KEY `Проект` (`Категория`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `пользователь`
--
ALTER TABLE `пользователь`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `проект`
--
ALTER TABLE `проект`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `задача`
--
ALTER TABLE `задача`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `проект`
--
ALTER TABLE `проект`
  ADD CONSTRAINT `проект_ibfk_1` FOREIGN KEY (`Автор`) REFERENCES `пользователь` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `задача`
--
ALTER TABLE `задача`
  ADD CONSTRAINT `задача_ibfk_1` FOREIGN KEY (`Автор`) REFERENCES `пользователь` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `задача_ibfk_2` FOREIGN KEY (`Категория`) REFERENCES `проект` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
