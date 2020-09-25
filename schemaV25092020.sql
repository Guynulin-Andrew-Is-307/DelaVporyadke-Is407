-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 25 2020 г., 13:59
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `doisgone`
--

-- --------------------------------------------------------

--
-- Структура таблицы `project`
--

CREATE TABLE `project` (
  `ID` int UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Author` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `project`
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
-- Структура таблицы `task`
--

CREATE TABLE `task` (
  `ID` int UNSIGNED NOT NULL,
  `DateOfCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Completed` tinyint(1) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `File` varchar(255) DEFAULT NULL,
  `DateOfCompletion` date DEFAULT NULL,
  `Author` int UNSIGNED NOT NULL,
  `Project` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `task`
--

INSERT INTO `task` (`ID`, `DateOfCreation`, `Completed`, `Name`, `File`, `DateOfCompletion`, `Author`, `Project`) VALUES
(1, '1982-12-03 00:00:00', 0, 'Собеседование в IT компании', NULL, '2020-06-04', 1, 3),
(2, '1982-12-03 00:00:00', 0, 'Выполнить тестовое задание', NULL, '2019-12-25', 1, 3),
(3, '1982-12-03 00:00:00', 1, 'Сделать задание первого раздела', NULL, '2019-12-21', 1, 2),
(4, '1982-12-03 00:00:00', 0, 'Встреча с другом', NULL, '2019-12-22', 1, 1),
(5, '1982-12-03 00:00:00', 0, 'Купить корм для кота', NULL, NULL, 1, 4),
(6, '1982-12-03 00:00:00', 0, 'h1 здесь для проверки инъекции <h1>Заказать пиццу</h1>', NULL, NULL, 1, 4),
(7, '1982-12-03 00:00:00', 0, 'Собеседование в IT компании', NULL, '2020-06-04', 2, 8),
(8, '1982-12-03 00:00:00', 0, 'Выполнить тестовое задание', NULL, '2019-12-25', 2, 8),
(9, '1982-12-03 00:00:00', 1, 'Сделать задание первого раздела', NULL, '2019-12-21', 2, 7),
(10, '1982-12-03 00:00:00', 0, 'Встреча с другом', NULL, '2019-12-22', 2, 6),
(11, '1982-12-03 00:00:00', 0, 'Купить корм для кота', NULL, NULL, 2, 9),
(12, '1982-12-03 00:00:00', 1, 'Заказать суши', NULL, NULL, 2, 9),
(13, '2020-09-08 00:00:00', 0, 'Помочь Серому в отношениях', NULL, NULL, 1, 11),
(14, '2020-09-13 00:00:00', 1, 'Обойти Серого в КС', NULL, NULL, 1, 12),
(53, '2020-09-23 00:00:00', 0, 'asa', 'uploads/user1/Резервные копии от чего-то.TXT', '2020-09-24', 1, 3),
(54, '2020-09-23 00:00:00', 0, 'bbb', 'uploads/user1/Снимок.PNG', '2020-09-24', 1, 12),
(55, '2020-09-24 00:00:00', 0, 'Игра на опережение кристины', 'uploads/user1/Расписание.jpg', '2020-09-30', 1, 11),
(56, '2020-09-24 00:00:00', 0, 'Кто такая хрестина', NULL, NULL, 1, 11),
(103, '2020-09-24 21:06:59', 0, 'Я пажилой программист.', NULL, '2022-03-13', 1, 12),
(104, '2020-09-24 21:08:01', 0, 'Даб-Даб Я...', 'uploads/user1/Снимок.PNG', NULL, 1, 12),
(105, '2020-09-24 21:11:39', 0, 'Да что ты мелишь!', 'uploads/user1/Расписание.jpg', '2020-09-30', 1, 12),
(106, '2020-09-24 21:15:14', 0, 'as', 'uploads/user1/Снимок.PNG', NULL, 1, 2),
(108, '2020-09-25 11:56:13', 0, 'qwa', NULL, NULL, 1, 3),
(109, '2020-09-25 11:56:13', 0, 'qwa', NULL, NULL, 1, 3),
(110, '2020-09-25 12:14:42', 0, '5', NULL, NULL, 1, 2),
(111, '2020-09-25 12:15:10', 0, 's', NULL, NULL, 1, 2),
(112, '2020-09-25 12:31:20', 0, 'qw', NULL, NULL, 1, 3),
(113, '2020-09-25 12:31:26', 0, 'qw', NULL, '2020-09-25', 1, 3),
(114, '2020-09-25 12:33:03', 0, 'a', NULL, NULL, 1, 3),
(115, '2020-09-25 12:33:37', 0, 'as', 'uploads/user1/DelaVporyadke-Is407-master.zip', NULL, 1, 3),
(116, '2020-09-25 12:34:21', 0, 'ds', NULL, NULL, 1, 1),
(117, '2020-09-25 12:34:33', 0, 'as', NULL, NULL, 1, 1),
(118, '2020-09-25 12:37:58', 0, 'as', 'uploads/user1/Текстовый режим.pdf', NULL, 1, 1),
(123, '2020-09-25 13:18:58', 0, '545', NULL, NULL, 1, 4),
(124, '2020-09-25 13:52:45', 0, 'asas', NULL, '2020-09-25', 1, 3),
(125, '2020-09-25 13:53:16', 0, 'as', NULL, '2020-09-25', 1, 3),
(126, '2020-09-25 13:53:16', 0, 'as', NULL, '2020-09-25', 1, 3),
(127, '2020-09-25 13:53:16', 0, 'as', NULL, '2020-09-25', 1, 3),
(128, '2020-09-25 13:53:16', 0, 'as', NULL, '2020-09-25', 1, 3),
(129, '2020-09-25 14:49:34', 0, 'sa', 'uploads/user1/doingsdoneContinue.zip', '2020-09-25', 1, 3),
(130, '2020-09-25 15:02:05', 0, 'ds', NULL, NULL, 1, 3),
(131, '2020-09-25 15:04:30', 0, 'ds', NULL, NULL, 1, 3),
(132, '2020-09-25 15:04:31', 0, 'ds', NULL, NULL, 1, 3),
(133, '2020-09-25 15:04:31', 0, 'ds', NULL, NULL, 1, 3),
(134, '2020-09-25 15:04:31', 0, 'ds', NULL, NULL, 1, 3),
(135, '2020-09-25 15:04:31', 0, 'ds', NULL, NULL, 1, 3),
(136, '2020-09-25 15:06:32', 0, 'ds', NULL, NULL, 1, 3),
(137, '2020-09-25 15:06:33', 0, 'ds', NULL, NULL, 1, 3),
(138, '2020-09-25 15:06:33', 0, 'ds', NULL, NULL, 1, 3),
(139, '2020-09-25 15:06:34', 0, 'ds', NULL, NULL, 1, 3),
(140, '2020-09-25 15:06:41', 0, 'ds', NULL, NULL, 1, 3),
(141, '2020-09-25 15:06:42', 0, 'ds', NULL, NULL, 1, 3),
(142, '2020-09-25 15:06:51', 0, 'ds', NULL, NULL, 1, 3),
(143, '2020-09-25 15:07:40', 0, 'as', NULL, NULL, 1, 3),
(144, '2020-09-25 15:09:38', 0, 'as', NULL, NULL, 1, 3),
(145, '2020-09-25 15:09:40', 0, 'as', NULL, NULL, 1, 3),
(146, '2020-09-25 15:09:48', 0, 'as', NULL, NULL, 1, 3),
(147, '2020-09-25 15:09:51', 0, 'as', NULL, NULL, 1, 3),
(148, '2020-09-25 15:10:43', 0, 'as', NULL, NULL, 1, 3),
(149, '2020-09-25 15:11:37', 0, 'яч', NULL, NULL, 1, 2),
(150, '2020-09-25 15:11:59', 0, 'яч', NULL, NULL, 1, 2),
(151, '2020-09-25 15:12:21', 0, 'zx', NULL, NULL, 1, 3),
(152, '2020-09-25 15:14:04', 0, 'as', NULL, NULL, 1, 4),
(153, '2020-09-25 15:14:11', 0, '3', NULL, NULL, 1, 4),
(154, '2020-09-25 15:14:37', 0, 'as', NULL, NULL, 1, 3),
(155, '2020-09-25 15:14:44', 0, '23', NULL, NULL, 1, 5),
(156, '2020-09-25 15:15:30', 0, 'qas', NULL, '2020-09-25', 1, 5),
(157, '2020-09-25 15:15:40', 0, 'sa', 'uploads/user1/Текстовый режим.pdf', '2020-09-25', 1, 3),
(158, '2020-09-25 15:15:57', 0, 'asssasa', NULL, NULL, 1, 3),
(159, '2020-09-25 15:16:28', 0, 'sdaasd', 'uploads/user1/Лр 7 варианты.pdf', '2020-09-30', 1, 12),
(160, '2020-09-25 15:17:01', 0, 'ке', NULL, NULL, 1, 12),
(161, '2020-09-25 15:17:16', 0, '34554345', NULL, NULL, 1, 1),
(162, '2020-09-25 15:23:20', 0, 'фы', NULL, '2020-09-30', 1, 2),
(163, '2020-09-25 15:53:54', 0, 'Test22', NULL, '2020-09-25', 1, 2),
(164, '2020-09-25 15:54:09', 0, 'assasasaasasasa', 'uploads/user1/Текстовый режим.pdf', NULL, 1, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `ID` int UNSIGNED NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `RegistrationDate` date NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`ID`, `Email`, `Name`, `RegistrationDate`, `Password`) VALUES
(1, 'ladybag2000@gmail.com', 'Константин', '2007-09-16', '1'),
(2, 'ladybag2001@gmail.com', 'Сергей', '2007-09-16', '2');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Уникальное название и автор` (`Name`,`Author`) USING BTREE,
  ADD KEY `проект_ibfk_1` (`Author`);

--
-- Индексы таблицы `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Author` (`Author`),
  ADD KEY `project` (`Project`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `project`
--
ALTER TABLE `project`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `task`
--
ALTER TABLE `task`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`Project`) REFERENCES `project` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
