-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Окт 21 2026 г., 09:02
-- Версия сервера: 8.0.40
-- Версия PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ICEA`
--

-- --------------------------------------------------------

--
-- Структура таблицы `equipments`
--

CREATE TABLE `equipments` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `manufacturer_link` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `equipments`
--

INSERT INTO `equipments` (`id`, `category_id`, `name`, `description`, `manufacturer_link`, `image_path`, `is_active`) VALUES
(1, 1, 'LRB-101 - модульный маршрутизатор', 'Бескорпусный маршрутизатор для встраивания в промышленные системы. Обеспечивает сетевую связь оборудования и передачу данных через Ethernet и 4G/LTE.', 'LCARD.RU', '/images/equipments/lrb-101.png', 1),
(2, 1, 'LRB-200 — промышленный маршрутизатор', 'Корпусная версия маршрутизатора для подключения оборудования и периферии к промышленной сети. Подходит для задач автоматизации и удалённого контроля.', 'LCARD.RU', '/images/equipments/lrb-200.png', 1),
(3, 2, 'Переносной пульт управления', 'Пульт с джойстиками, экраном, кнопками и переключателями для дистанционного управления техникой. Точную модель и назначение нужно подтвердить перед публикацией — по фотографии этого установить нельзя.', 'LCARD.RU', '/images/equipments/remote.png', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `equipment_categories`
--

CREATE TABLE `equipment_categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `equipment_categories`
--

INSERT INTO `equipment_categories` (`id`, `name`, `slug`) VALUES
(1, 'Маршрутизаторы', 'routers'),
(2, 'Пульты управления', 'control-panels');

-- --------------------------------------------------------

--
-- Структура таблицы `feedback_requests`
--

CREATE TABLE `feedback_requests` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('new','in_progress','completed','archived') DEFAULT 'new',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `feedback_requests`
--

INSERT INTO `feedback_requests` (`id`, `name`, `email`, `message`, `status`, `created_at`) VALUES
(1, 'Иван Иванов', 'ivan@example.com', 'Необходима разработка ПО для сбора данных с датчиков по протоколу CAN.', 'new', '2026-10-13 11:46:07'),
(2, 'Максим', 'ksenia@mail.ru', 'Давайте сотрудничать!!', 'new', '2026-10-16 10:52:27'),
(3, 'ривамловл', 'dalvrozhkov@gmail.com', 'часпрол', 'new', '2026-10-21 08:38:54');

-- --------------------------------------------------------

--
-- Структура таблицы `industries`
--

CREATE TABLE `industries` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `order_index` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `industries`
--

INSERT INTO `industries` (`id`, `title`, `order_index`) VALUES
(1, 'Железнодорожный транспорт', 1),
(2, 'Измерительная техника', 2),
(3, 'Электроэнергетика', 3),
(4, 'Производство радиоэлектроники', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `partners`
--

CREATE TABLE `partners` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `order_index` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `partners`
--

INSERT INTO `partners` (`id`, `name`, `logo_path`, `order_index`) VALUES
(1, 'Компания “LCARD”', '/images/partners/lcard.svg', 1),
(2, 'Компания “Комдиагностика”', '/images/partners/komdiagnostika.svg', 2),
(3, 'ООО \"ЛайкаСофт\"', '/images/partners/laikasoft.svg', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `seo_meta`
--

CREATE TABLE `seo_meta` (
  `id` int NOT NULL,
  `page_url` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `keywords` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `site_settings`
--

CREATE TABLE `site_settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `site_settings`
--

INSERT INTO `site_settings` (`setting_key`, `setting_value`, `description`) VALUES
('company_name', 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ \"ИНЖЕНЕРНЫЙ ЦЕНТР ЭЛЕКТРОНИКИ И АВТОМАТИЗАЦИИ\"', 'Полное название'),
('email', 'icea@icea.site', 'Электронная почта'),
('header_address', 'Варшавское шоссе 5к4. Москва', 'Адрес в шапке'),
('inn', '7726467863', 'ИНН компании'),
('it_codes', '1.01, 1.03, 4.01', 'Коды IT-деятельности'),
('legal_address', '117105, ГОРОД МОСКВА, Ш. ВАРШАВСКОЕ, Д. 5, К. 4, ЭТ/КОМ 5/3,5,6', 'Юридический адрес'),
('ogrn', '1207700327130', 'ОГРН'),
('okved', '62.01, 62.02, 62.09, 63.11, 63.11.1, 72.19', 'ОКВЭД'),
('phone', '+7 (495) 785-95-25', 'Контактный телефон');

-- --------------------------------------------------------

--
-- Структура таблицы `specializations`
--

CREATE TABLE `specializations` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `order_index` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `specializations`
--

INSERT INTO `specializations` (`id`, `title`, `description`, `order_index`, `is_active`) VALUES
(1, 'Встроенное ПО для аппаратуры', 'Микроконтроллеры, периферия, протоколы и управление устройством', 1, 1),
(2, 'Прикладное ПО для измерений', 'Сбор, обработка и визуализация данных, испытания и калибровка.', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `specialization_tags`
--

CREATE TABLE `specialization_tags` (
  `id` int NOT NULL,
  `specialization_id` int NOT NULL,
  `tag_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `specialization_tags`
--

INSERT INTO `specialization_tags` (`id`, `specialization_id`, `tag_name`) VALUES
(1, 1, 'AMR'),
(2, 1, 'AVR'),
(3, 1, 'ПЛИС'),
(4, 1, 'CAN'),
(5, 2, 'WIN API'),
(6, 2, 'LINUX API'),
(7, 2, 'C/C++');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `view_equipment_catalog`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `view_equipment_catalog` (
`category_name` varchar(255)
,`description` text
,`equipment_name` varchar(255)
,`id` int
,`image_path` varchar(255)
,`manufacturer_link` varchar(255)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `view_specializations_with_tags`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `view_specializations_with_tags` (
`description` text
,`id` int
,`tags` text
,`title` varchar(255)
);

-- --------------------------------------------------------

--
-- Структура для представления `view_equipment_catalog`
--
DROP TABLE IF EXISTS `view_equipment_catalog`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_equipment_catalog`  AS SELECT `e`.`id` AS `id`, `e`.`name` AS `equipment_name`, `c`.`name` AS `category_name`, `e`.`description` AS `description`, `e`.`manufacturer_link` AS `manufacturer_link`, `e`.`image_path` AS `image_path` FROM (`equipments` `e` left join `equipment_categories` `c` on((`e`.`category_id` = `c`.`id`))) WHERE (`e`.`is_active` = true) ;

-- --------------------------------------------------------

--
-- Структура для представления `view_specializations_with_tags`
--
DROP TABLE IF EXISTS `view_specializations_with_tags`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_specializations_with_tags`  AS SELECT `s`.`id` AS `id`, `s`.`title` AS `title`, `s`.`description` AS `description`, group_concat(`t`.`tag_name` order by `t`.`id` ASC separator ' • ') AS `tags` FROM (`specializations` `s` left join `specialization_tags` `t` on((`s`.`id` = `t`.`specialization_id`))) WHERE (`s`.`is_active` = true) GROUP BY `s`.`id` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `equipment_categories`
--
ALTER TABLE `equipment_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `feedback_requests`
--
ALTER TABLE `feedback_requests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `industries`
--
ALTER TABLE `industries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `seo_meta`
--
ALTER TABLE `seo_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_url` (`page_url`);

--
-- Индексы таблицы `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- Индексы таблицы `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `specialization_tags`
--
ALTER TABLE `specialization_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialization_id` (`specialization_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `equipments`
--
ALTER TABLE `equipments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `equipment_categories`
--
ALTER TABLE `equipment_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `feedback_requests`
--
ALTER TABLE `feedback_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `industries`
--
ALTER TABLE `industries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `seo_meta`
--
ALTER TABLE `seo_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `specializations`
--
ALTER TABLE `specializations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `specialization_tags`
--
ALTER TABLE `specialization_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `equipments`
--
ALTER TABLE `equipments`
  ADD CONSTRAINT `equipments_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `equipment_categories` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `specialization_tags`
--
ALTER TABLE `specialization_tags`
  ADD CONSTRAINT `specialization_tags_ibfk_1` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
