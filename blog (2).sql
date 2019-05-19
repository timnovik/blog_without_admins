-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 19 2019 г., 17:53
-- Версия сервера: 10.1.37-MariaDB
-- Версия PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `email`, `text`, `time`, `post_id`) VALUES
(21, 'cccdfd', 'saa\'); DROP TABLE comments; --', '2019-02-24 16:59:43', 0),
(22, '43t3ff', 'not great', '2019-02-26 15:10:52', 0),
(23, 'chelovek', 'не лей воду!', '2019-03-17 13:10:53', 3),
(24, 'nickname', 'text', '2019-03-17 13:21:59', 1),
(25, 'nickname', 'text', '2019-03-17 13:54:51', 1),
(26, 'chelovek', 'Yeah, that\'s great!', '2019-03-17 13:55:32', 1),
(27, 'chelovek', 'text', '2019-03-17 13:55:45', 1),
(28, 'chelovek', 'text', '2019-03-17 13:57:51', 1),
(29, 'chelovek', 'Yeah, that\'s great!', '2019-03-17 13:58:03', 4),
(30, 'chelovek', 'wwassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaacccccccccccccwwwwwwwwwwwwwwwwwww', '2019-03-17 15:31:22', 4),
(31, 'chelovek', 'text', '2019-03-17 15:54:38', 5),
(33, '2', '<script>while (1) {}</script>great', '2019-03-17 15:55:46', 5),
(34, '2', '<script>while (1) {}</script>great', '2019-03-17 15:55:49', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `name`, `text`, `time`, `author`) VALUES
(1, 'test_post shorter than 200 chars', 'text of post', '0000-00-00 00:00:00', 't13novik'),
(3, 'longer than 200 symbols', '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789|01234567890veeeeeeeeeeryyyyyy looooooooooooooong 258 chars', '0000-00-00 00:00:00', 'vodoley'),
(4, 'we\'re opened!', 'congratulations! our blog srtarted working!', '2019-03-17 13:47:27', 'admin'),
(5, 'we\'re opened!', 'Yeah, that\'s great!', '2019-03-17 15:44:49', 'admin');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
