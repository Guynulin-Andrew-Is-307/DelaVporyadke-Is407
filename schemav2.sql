-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 23 2020 г., 18:47
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

CREATE TABLE `user` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `RegistrationDate` date NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `пользователь`
--

INSERT INTO `user` (`ID`, `Email`, `Name`, `RegistrationDate`, `Password`) VALUES
(1, 'ladybag2000@gmail.com', 'Константин', '2007-09-16', '1'),
(2, 'ladybag2001@gmail.com', 'Сергей', '2007-09-16', '2');

-- --------------------------------------------------------

--
-- Структура таблицы `проект`
--

CREATE TABLE `project` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Author` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `проект`
--

INSERT INTO `project` (`ID`, `Name`, `Author`) VALUES
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

CREATE TABLE `task` (
  `ID` int(10) UNSIGNED NOT NULL,
  `DateOfCreation` date NOT NULL,
  `Completed` tinyint(1) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `File` varchar(255) DEFAULT NULL,
  `DateOfCompletion` date DEFAULT NULL,
  `Author` int(10) UNSIGNED NOT NULL,
  `Project` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `задача`
--

INSERT INTO `task` (`ID`, `DateOfCreation`, `Completed`, `Name`, `File`, `DateOfCompletion`, `Author`, `Project`) VALUES
(1, '1982-12-03', 0, 'Собеседование в IT компании', NULL, '2020-06-04', 1, 3),
(2, '1982-12-03', 0, 'Выполнить тестовое задание', NULL, '2019-12-25', 1, 3),
(3, '1982-12-03', 1, 'Сделать задание первого раздела', NULL, '2019-12-21', 1, 2),
(4, '1982-12-03', 0, 'Встреча с другом', NULL, '2019-12-22', 1, 1),
(5, '1982-12-03', 0, 'Купить корм для кота', NULL, NULL, 1, 4),
(6, '1982-12-03', 0, 'h1 здесь для проверки инъекции <h1>Заказать пиццу</h1>', NULL, NULL, 1, 4),
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
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Индексы таблицы `проект`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Уникальное название и автор` (`Name`,`Author`) USING BTREE,
  ADD KEY `проект_ibfk_1` (`Author`);

--
-- Индексы таблицы `задача`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Author` (`Author`),
  ADD KEY `project` (`Project`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `пользователь`
--
ALTER TABLE `user`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `проект`
--
ALTER TABLE `project`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `задача`
--
ALTER TABLE `task`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `проект`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `задача`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`Project`) REFERENCES `project` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
