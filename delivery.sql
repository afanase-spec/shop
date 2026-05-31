-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 31 2026 г., 15:15
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `delivery`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admins`
--

INSERT INTO `admins` (`id`, `username`, `password_hash`, `created_at`) VALUES
(1, 'admin', '$2y$10$jY0/QX8N2Ioyg7ZLGTELj.uSeWIitOqmFqmmsv.6Kk0fVSqDYwusW', '2026-05-27 16:24:50');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`) VALUES
(1, 'Продукты', 'produkty', '2026-05-27 16:24:50'),
(2, 'Бытовая химия', 'bytovaya-himiya', '2026-05-27 16:24:50'),
(3, 'Напитки', 'napitki', '2026-05-27 16:24:50');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `customer_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` enum('new','processing','delivered') COLLATE utf8mb4_unicode_ci DEFAULT 'new',
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `phone`, `address`, `comment`, `status`, `total`, `created_at`) VALUES
(1, 'Афанасьев Кирилл Сергеевич', '+7 (919) 976-00-95', 'Чебоксары, Тургенева 17 Б', 'туда сюда', 'processing', '579.60', '2026-05-27 16:47:48');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_at_time` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price_at_time`) VALUES
(1, 1, 2, 4, '45.00'),
(2, 1, 1, 3, '89.90'),
(3, 1, 3, 1, '129.90');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_popular` tinyint(1) DEFAULT '0',
  `manufacturer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `composition` text COLLATE utf8mb4_unicode_ci,
  `calories` decimal(6,2) DEFAULT NULL,
  `proteins` decimal(6,2) DEFAULT NULL,
  `fats` decimal(6,2) DEFAULT NULL,
  `carbohydrates` decimal(6,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `description`, `price`, `image`, `is_popular`, `manufacturer`, `composition`, `calories`, `proteins`, `fats`, `carbohydrates`, `created_at`) VALUES
(1, 1, 'Молоко 3.2%', 'moloko-3-2', 'Свежее пастеризованное молоко 3.2% жирности, 1 литр', '89.90', 'https://damcdn.samokat.ru/dam-storage-ext-env-prod/2026/01/1330d4bc-d4df-4efd-8d00-9c85c57ffcd6', 0, 'Топовое молочко)))', 'Топовое молочко)))', '123.00', '12.00', '44.00', '23.00', '2026-05-27 16:24:50'),
(2, 1, 'Хлеб белый', 'hleb-belyy', 'Нарезной белый хлеб из пшеничной муки высшего сорта, 400г', '45.00', 'https://damcdn.samokat.ru/dam-storage-ext-env-prod/2026/01/0fe16e4d-eba2-440f-96e7-a8e6d7b94eeb', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27 16:24:50'),
(3, 1, 'Яйца куриные С0', 'yaytsa-kurinye-s0', 'Яйца куриные отборные, категория С0, 10 штук', '129.90', 'https://main-cdn.sbermegamarket.ru/big1/hlr-system/558/743/533/620/182/6/100074491186b0.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27 16:24:50'),
(4, 1, 'Сыр Российский', 'syr-rossiyskiy', 'Сыр полутвердый Российский 50% жирности, 200г', '189.50', 'https://tsx.x5static.net/i/400x400-fit/xdelivery/files/e3/c6/bfa8ce15223d3ae33e1dc218cc41.jpg', 0, '', 'Вода, сахар, мука высший сорт, углеводы', NULL, NULL, NULL, NULL, '2026-05-27 16:24:50'),
(5, 2, 'Средство для мытья посуды', 'sredstvo-dlya-mytya-posudy', 'Гель для мытья посуды с лимоном, эффективно удаляет жир, 500мл', '79.90', 'https://images.unsplash.com/photo-1584820927498-cfe5211fd8bf?w=400', 0, 'Пропеллер', 'Химия, химия, химия', NULL, NULL, NULL, NULL, '2026-05-27 16:24:50'),
(6, 2, 'Стиральный порошок', 'stiralnyy-poroshok', 'Универсальный стиральный порошок автомат, 3кг', '349.00', 'https://images.unsplash.com/photo-1610557892470-55d9e80c0bce?w=400', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27 16:24:50'),
(7, 3, 'Вода минеральная', 'voda-mineralnaya', 'Вода минеральная негазированная, природная, 1.5л', '59.90', 'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?w=400', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27 16:24:50'),
(8, 3, 'Сок апельсиновый', 'sok-apelsinovyy', 'Сок апельсиновый прямого отжима, 100% натуральный, 1л', '149.90', 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=400', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27 16:24:50');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `name`, `phone`, `address`, `created_at`) VALUES
(1, 'afanasevtwink@gmail.com', '$2y$10$g2n6KS9DvqOtDpWvHufv3.XzOw9CiKQvH6BfV27MaeEz.p0P39Aau', 'Кирилл', '', 'Тургенева 17 Б', '2026-05-27 16:25:33'),
(2, 'afnafa@gmail.com', '$2y$10$jEl2szt/MNx5DFpxtJ1VEekqiOFTDlk0OODSdjrsMr5ItNJtOyI.C', 'кмириллл', '123', NULL, '2026-05-29 23:58:06');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `is_popular` (`is_popular`);

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
-- AUTO_INCREMENT для таблицы `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
