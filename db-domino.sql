-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 05, 2024 at 07:56 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-domino`
--

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `id` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`id`, `image`) VALUES
(1, 'assets/calrosels/2024Feb16_Banner-web---Desktop_VALUE-COMBO-(PHASE-2)_(1920x810)px.jpg'),
(2, 'assets/calrosels/BANNER+-+FAMILY+COMBO+SING+(3).jpg'),
(3, 'assets/calrosels/BANNER+70+SING+(3).jpg'),
(4, 'assets/calrosels/BANNER+BOGO+CN+SING+(2).jpg'),
(5, 'assets/calrosels/BANNER+BOGO3+SING+NEW.jpg'),
(6, 'assets/calrosels/BANNER+BOGO5+NEWNEW+(2).jpg'),
(7, 'assets/calrosels/BANNER+LTO+CUA+NEW+(3).jpg'),
(8, 'assets/calrosels/BANNER+MY+DOMINOS+CLT+NEW+(1).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `card_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`card_id`, `user_id`, `product_id`, `quantity`, `price`, `title`, `image_url`, `description`, `created_at`) VALUES
(3, 1, 1, 2, 5200.00, 'Extravaganza pizza', 'assets/images/1.jpg', 'Delicious pizza with a variety of toppings.', '2024-03-05 02:52:50'),
(4, 1, 1, 2, 5200.00, 'Extravaganza pizza', 'assets/images/1.jpg', 'Delicious pizza with a variety of toppings.', '2024-03-05 02:53:22'),
(5, 1, 1, 2, 5200.00, 'Extravaganza pizza', 'assets/images/1.jpg', 'Delicious pizza with a variety of toppings.', '2024-03-05 02:54:16'),
(6, 1, 1, 2, 5200.00, 'Extravaganza pizza', 'assets/images/1.jpg', 'Delicious pizza with a variety of toppings.', '2024-03-05 02:54:22'),
(7, 1, 1, 2, 5200.00, 'Extravaganza pizza', 'assets/images/1.jpg', 'Delicious pizza with a variety of toppings.', '2024-03-05 02:54:24'),
(8, 1, 1, 2, 5200.00, 'Extravaganza pizza', 'assets/images/1.jpg', 'Delicious pizza with a variety of toppings.', '2024-03-05 02:55:45'),
(9, 1, 3, 2, 2500.00, 'Beef shawarma', 'assets/images/3.jpg', 'Tender beef shawarma wrapped in a warm tortilla.', '2024-03-05 02:55:54'),
(10, 1, 3, 2, 2500.00, 'Beef shawarma', 'assets/images/3.jpg', 'Tender beef shawarma wrapped in a warm tortilla.', '2024-03-05 02:56:40'),
(11, 1, 5, 2, 3000.00, 'Cheesy breadsticks', 'assets/images/5.jpg', 'Cheesy breadsticks that melt in your mouth.', '2024-03-05 02:56:46'),
(12, 1, 5, 2, 3000.00, 'Cheesy breadsticks', 'assets/images/5.jpg', 'Cheesy breadsticks that melt in your mouth.', '2024-03-05 03:02:11'),
(13, 1, 5, 2, 3000.00, 'Cheesy breadsticks', 'assets/images/5.jpg', 'Cheesy breadsticks that melt in your mouth.', '2024-03-05 03:02:27'),
(14, 1, 5, 2, 3000.00, 'Cheesy breadsticks', 'assets/images/5.jpg', 'Cheesy breadsticks that melt in your mouth.', '2024-03-05 03:03:01'),
(15, 1, 5, 2, 3000.00, 'Cheesy breadsticks', 'assets/images/5.jpg', 'Cheesy breadsticks that melt in your mouth.', '2024-03-05 03:03:28'),
(16, 1, 5, 2, 3000.00, 'Cheesy breadsticks', 'assets/images/5.jpg', 'Cheesy breadsticks that melt in your mouth.', '2024-03-05 03:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `user_id`, `title`, `content`, `image`) VALUES
(1, 1, 'Đặt hàng thành công', 'Đơn hàng của bạn đã được đặt thành công', 'assets/images/5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `weight` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `title`, `type`, `price`, `description`, `weight`, `image`) VALUES
(1, 'Extravaganza pizza', 'pizza', 5200, 'Delicious pizza with a variety of toppings.', 250, 'assets/images/1.jpg'),
(2, 'Chicken wings', '', 2500, 'Crispy and flavorful chicken wings.', 150, 'assets/images/2.jpg'),
(3, 'Beef shawarma', '', 2500, 'Tender beef shawarma wrapped in a warm tortilla.', 200, 'assets/images/3.jpg'),
(4, 'Chicken bali pizza', 'pizza', 5200, 'Spicy chicken bali pizza with a unique twist.', 280, 'assets/images/4.jpg'),
(5, 'Cheesy breadsticks', '', 3000, 'Cheesy breadsticks that melt in your mouth.', 180, 'assets/images/5.jpg'),
(6, 'French fries', '', 2000, 'Golden and crispy French fries.', 120, 'assets/images/6.jpg'),
(7, 'Chicken nuggets', '', 2500, 'Succulent chicken nuggets for a quick snack.', 160, 'assets/images/7.jpg'),
(8, 'Pepperoni pizza', 'pizza', 5200, 'Classic pepperoni pizza with a perfect crust.', 300, 'assets/images/8.jpg'),
(9, 'Veggies supreme pizza', 'pizza', 5200, 'Veggie supreme pizza loaded with fresh vegetables.', 320, 'assets/images/9.jpg'),
(10, 'Chocolate icecream', '', 2000, 'Rich and creamy chocolate ice cream.', 150, 'assets/images/10.jpg'),
(11, 'Coldstone chocolate', '', 3000, 'Indulge in the Coldstone chocolate treat.', 200, 'assets/images/11.jpg'),
(12, 'Coca-cola (33cl)', '', 500, 'Refreshing Coca-cola in a 33cl can.', 330, 'assets/images/12.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`) VALUES
(1, 'admin@gmail.com', '123123', '2024-03-05 02:52:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `card_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
