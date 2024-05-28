

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(128) NOT NULL,
  `customer_tel` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_tel`) VALUES
(1, 'Michael Johnson', '123-456-7890'),
(2, 'Emily Davis', '987-654-3210'),
(3, 'Christopher Smith', '123-456-7890'),
(4, 'Jessica Brown', '987-654-3210'),
(5, 'Daniel Martinez', '123-456-7890'),
(6, 'Sarah Wilson', '987-654-3210'),
(7, 'Ashley Garcia', '123-456-7890'),
(8, 'Joshua Anderson', '987-654-3210'),
(9, 'Megan Lee', '123-456-7890'),
(10, 'Jane Smith', '987-654-3210'),
(11, 'Andrew Clark', '123-456-7890'),
(12, 'Olivia Rodriguez', '987-654-3210');



CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_cost` decimal(4,2) NOT NULL,
  `stock_limit` int(5) NOT NULL,
  `item_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `item` (`item_id`, `item_cost`, `stock_limit`, `item_name`) VALUES
(1, '3.00', 100, 'burger'),
(2, '2.00', 80, 'chips');


CREATE TABLE `menu_type` (
  `menu_type_id` int(11) NOT NULL,
  `fk_saver_id` int(11) NOT NULL,
  `fk_reugular_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `menu_type` (`menu_type_id`, `fk_saver_id`, `fk_reugular_id`) VALUES
(1, 1, 2),
(2, 2, 2);



CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `fk_payment_id` int(11) NOT NULL,
  `fk_staff_id` int(11) NOT NULL,
  `fk_menu_type_id` int(11) NOT NULL,
  `fk_store_id` int(11) NOT NULL,
  `menu_name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `order` (`order_id`, `order_date`, `order_time`, `fk_customer_id`, `fk_payment_id`, `fk_staff_id`, `fk_menu_type_id`, `fk_store_id`, `menu_name`) VALUES
(1, '2024-04-29', '12:00:00', 1, 2, 1, 1, 1, 'saver'),
(2, '2024-04-02', '12:30:00', 2, 2, 2, 1, 1, 'regualar'),
(3, '2024-04-04', '13:00:00', 3, 2, 3, 1, 1, NULL),
(4, '2024-03-01', '13:30:00', 4, 2, 4, 1, 1, NULL),
(5, '2024-03-21', '14:00:00', 5, 1, 5, 1, 1, NULL),
(6, '2024-04-29', '14:30:00', 6, 3, 6, 1, 1, NULL),
(7, '2024-04-29', '15:00:00', 7, 1, 7, 1, 1, NULL),
(8, '2024-04-29', '15:30:00', 8, 2, 8, 1, 1, NULL),
(9, '2024-04-29', '16:00:00', 8, 2, 9, 1, 1, NULL),
(10, '2024-04-29', '16:30:00', 9, 1, 10, 1, 1, NULL),
(11, '2024-05-08', '17:00:00', 10, 1, 1, 1, 1, NULL),
(12, '2024-04-29', '17:30:00', 11, 2, 2, 1, 1, NULL),
(13, '2024-04-29', '18:00:00', 11, 2, 1, 1, 1, NULL),
(14, '2024-04-29', '18:30:00', 12, 2, 2, 1, 1, NULL),
(15, '2024-04-29', '19:00:00', 1, 3, 1, 1, 1, NULL),
(16, '2024-04-29', '19:30:00', 2, 2, 2, 1, 1, NULL),
(17, '2024-04-29', '20:00:00', 1, 2, 1, 1, 1, NULL),
(18, '2024-04-29', '20:30:00', 3, 1, 2, 1, 1, NULL),
(19, '2024-04-29', '21:00:00', 4, 1, 1, 1, 1, NULL),
(20, '2024-04-29', '21:30:00', 5, 3, 2, 1, 1, NULL);


CREATE TABLE `order_items` (
  `fk_item_id` int(11) NOT NULL,
  `fk_order_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `order_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `order_items` (`fk_item_id`, `fk_order_id`, `quantity`, `order_item_id`) VALUES
(1, 1, 2, 1),
(2, 2, 1, 2),
(1, 3, 2, 3),
(2, 4, 1, 4),
(1, 5, 2, 5),
(2, 6, 1, 6),
(1, 7, 2, 7),
(2, 8, 1, 8),
(1, 9, 2, 9),
(2, 10, 1, 10),
(1, 11, 2, 11),
(2, 12, 1, 12),
(1, 13, 2, 13),
(2, 14, 1, 14),
(1, 15, 2, 15),
(2, 16, 1, 16),
(1, 17, 2, 17),
(2, 18, 1, 18),
(1, 19, 2, 19),
(2, 20, 1, 20);



CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_type` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `payment` (`payment_id`, `payment_type`) VALUES
(1, 'cash'),
(2, 'card'),
(3, 'bitcoin');


CREATE TABLE `regular_menu` (
  `regular_menu_id` int(11) NOT NULL,
  `regular_menu_meal_type` varchar(32) NOT NULL,
  `regular_menu_type` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `regular_menu` (`regular_menu_id`, `regular_menu_meal_type`, `regular_menu_type`) VALUES
(1, 'Breakfast', 'Saver'),
(2, 'Lunch', 'Saver'),
(3, 'evening meal', 'saver'),
(4, 'Lunch', 'Food'),
(5, 'Breakfast', 'Food'),
(6, 'evening meal', 'Food'),
(7, 'Breakfast', 'Food'),
(8, 'Lunch', 'Food'),
(9, 'Breakfast', 'Food'),
(10, 'Lunch', 'Food'),
(11, 'Breakfast', 'Food'),
(12, 'Lunch', 'Food');


CREATE TABLE `saver_menu` (
  `saver_menu_id` int(11) NOT NULL,
  `saver_menu_name` varchar(32) NOT NULL,
  `saver_menu_item` varchar(128) NOT NULL,
  `saver_menu_deal` varchar(32) NOT NULL,
  `saver_menu_start` date NOT NULL,
  `saver_menu_end` date NOT NULL,
  `saver_menu_type` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `saver_menu` (`saver_menu_id`, `saver_menu_name`, `saver_menu_item`, `saver_menu_deal`, `saver_menu_start`, `saver_menu_end`, `saver_menu_type`) VALUES
(1, 'Festive Menu', 'Burger', '2 for 1', '2024-12-01', '2024-12-31', 'Food'),
(2, 'Festive Menu', 'Burger', '2 for 1', '2024-12-01', '2024-12-31', 'Food'),
(3, 'Festive Menu', 'Burger', '2 for 1', '2024-12-01', '2024-12-31', 'Food'),
(4, 'Festive Menu', 'Burger', '2 for 1', '2024-12-01', '2024-12-31', 'Food'),
(5, 'Festive Menu', 'Burger', '2 for 1', '2024-12-01', '2024-12-31', 'Food'),
(6, 'Festive Menu', 'Burger', '2 for 1', '2024-12-01', '2024-12-31', 'Food');



CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_firstname` varchar(32) NOT NULL,
  `staff_surname` varchar(32) NOT NULL,
  `staff_role` varchar(16) NOT NULL,
  `staff_tel` varchar(12) NOT NULL,
  `staff_shift` varchar(8) NOT NULL DEFAULT 'Day'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `staff` (`staff_id`, `staff_firstname`, `staff_surname`, `staff_role`, `staff_tel`, `staff_shift`) VALUES
(1, 'Michael', 'Smith', 'Manager', '111-222-3333', 'Day'),
(2, 'Emma', 'Johnson', 'Sales Staff', '444-555-6666', 'Day'),
(3, 'James', 'Williams', 'Sales Staff', '777-888-9999', 'Night'),
(4, 'Olivia', 'Brown', 'Sales Staff', '111-222-3334', 'Night'),
(5, 'William', 'Jones', 'Sales Staff', '444-555-6667', 'Day'),
(6, 'Sophia', 'Miller', 'Sales Staff', '777-888-9998', 'Night'),
(7, 'Daniel', 'Davis', 'Sales Staff', '111-222-3335', 'Day'),
(8, 'Ava', 'Garcia', 'Sales Staff', '444-555-6668', 'Day'),
(9, 'Benjamin', 'Wilson', 'Sales Staff', '777-888-9997', 'Night'),
(10, 'Isabella', 'Martinez', 'Sales Staff', '111-222-3336', 'Day'),
(11, 'Michael', 'Smith', 'Manager', '111-222-3333', 'Night'),
(12, 'Emma', 'Johnson', 'Sales Staff', '444-555-6666', 'Night'),
(13, 'James', 'Williams', 'Sales Staff', '777-888-9999', 'Day'),
(14, 'Olivia', 'Brown', 'Sales Staff', '111-222-3334', 'Day'),
(15, 'William', 'Jones', 'Sales Staff', '444-555-6667', 'Night'),
(16, 'Sophia', 'Miller', 'Sales Staff', '777-888-9998', 'Day'),
(17, 'Daniel', 'Davis', 'Sales Staff', '111-222-3335', 'Day'),
(18, 'Ava', 'Garcia', 'Sales Staff', '444-555-6668', 'Night'),
(19, 'Benjamin', 'Wilson', 'Sales Staff', '777-888-9997', 'Day'),
(20, 'Isabella', 'Martinez', 'Sales Staff', '111-222-3336', 'Day'),
(21, 'Michael', 'Smith', 'Manager', '111-222-3333', 'Day'),
(22, 'Emma', 'Johnson', 'Sales Staff', '444-555-6666', 'Day'),
(23, 'James', 'Williams', 'Sales Staff', '777-888-9999', 'Night'),
(24, 'Olivia', 'Brown', 'Sales Staff', '111-222-3334', 'Day'),
(25, 'William', 'Jones', 'Sales Staff', '444-555-6667', 'Day'),
(26, 'Sophia', 'Miller', 'Sales Staff', '777-888-9998', 'Day'),
(27, 'Daniel', 'Davis', 'Sales Staff', '111-222-3335', 'Day'),
(28, 'Ava', 'Garcia', 'Sales Staff', '444-555-6668', 'Day'),
(29, 'Benjamin', 'Wilson', 'Sales Staff', '777-888-9997', 'Day'),
(30, 'Isabella', 'Martinez', 'Sales Staff', '111-222-3336', 'Day'),
(31, 'Michael', 'Smith', 'Manager', '111-222-3333', 'Day'),
(32, 'Emma', 'Johnson', 'Sales Staff', '444-555-6666', 'Day'),
(33, 'James', 'Williams', 'Sales Staff', '777-888-9999', 'Day'),
(34, 'Olivia', 'Brown', 'Sales Staff', '111-222-3334', 'Day'),
(35, 'William', 'Jones', 'Sales Staff', '444-555-6667', 'Day'),
(36, 'Sophia', 'Miller', 'Sales Staff', '777-888-9998', 'Day'),
(37, 'Daniel', 'Davis', 'Sales Staff', '111-222-3335', 'Day'),
(38, 'Ava', 'Garcia', 'Sales Staff', '444-555-6668', 'Day'),
(39, 'Benjamin', 'Wilson', 'Sales Staff', '777-888-9997', 'Day'),
(40, 'Isabella', 'Martinez', 'Sales Staff', '111-222-3336', 'Day'),
(41, 'Michael', 'Smith', 'Manager', '111-222-3333', 'Day'),
(42, 'Emma', 'Johnson', 'Sales Staff', '444-555-6666', 'Day'),
(43, 'James', 'Williams', 'Sales Staff', '777-888-9999', 'Day'),
(44, 'Olivia', 'Brown', 'Sales Staff', '111-222-3334', 'Day'),
(45, 'William', 'Jones', 'Sales Staff', '444-555-6667', 'Day'),
(46, 'Sophia', 'Miller', 'Sales Staff', '777-888-9998', 'Day'),
(47, 'Daniel', 'Davis', 'Sales Staff', '111-222-3335', 'Day'),
(48, 'Ava', 'Garcia', 'Sales Staff', '444-555-6668', 'Day'),
(49, 'Benjamin', 'Wilson', 'Sales Staff', '777-888-9997', 'Day'),
(50, 'Isabella', 'Martinez', 'Sales Staff', '111-222-3336', 'Day'),
(51, 'Michael', 'Smith', 'Manager', '111-222-3333', 'Day'),
(52, 'Emma', 'Johnson', 'Sales Staff', '444-555-6666', 'Day'),
(53, 'James', 'Williams', 'Sales Staff', '777-888-9999', 'Day'),
(54, 'Olivia', 'Brown', 'Sales Staff', '111-222-3334', 'Day'),
(55, 'William', 'Jones', 'Sales Staff', '444-555-6667', 'Day'),
(56, 'Sophia', 'Miller', 'Sales Staff', '777-888-9998', 'Day'),
(57, 'Daniel', 'Davis', 'Sales Staff', '111-222-3335', 'Day'),
(58, 'Ava', 'Garcia', 'Sales Staff', '444-555-6668', 'Day'),
(59, 'Benjamin', 'Wilson', 'Sales Staff', '777-888-9997', 'Day'),
(60, 'Isabella', 'Martinez', 'Sales Staff', '111-222-3336', 'Day');



CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(32) NOT NULL,
  `store_location` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `store` (`store_id`, `store_name`, `store_location`) VALUES
(1, 'London Central', '123 Main Street'),
(2, 'Manchester West', '456 Elm Street'),
(3, 'London Central', '123 Main Street'),
(4, 'Manchester West', '456 Elm Street'),
(5, 'London Central', '123 Main Street'),
(6, 'Manchester West', '456 Elm Street'),
(7, 'London Central', '123 Main Street'),
(8, 'Manchester West', '456 Elm Street'),
(9, 'London Central', '123 Main Street'),
(10, 'Manchester West', '456 Elm Street'),
(11, 'London Central', '123 Main Street'),
(12, 'Manchester West', '456 Elm Street');


ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`menu_type_id`),
  ADD KEY `fk_saver_id` (`fk_saver_id`),
  ADD KEY `fk_reugular_id` (`fk_reugular_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`),
  ADD KEY `fk_menu_type_id` (`fk_menu_type_id`),
  ADD KEY `fk_staff_id` (`fk_staff_id`),
  ADD KEY `fk_store_id` (`fk_store_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `quantity` (`quantity`),
  ADD KEY `fk_item_id` (`fk_item_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `regular_menu`
--
ALTER TABLE `regular_menu`
  ADD PRIMARY KEY (`regular_menu_id`);

--
-- Indexes for table `saver_menu`
--
ALTER TABLE `saver_menu`
  ADD PRIMARY KEY (`saver_menu_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `menu_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `regular_menu`
--
ALTER TABLE `regular_menu`
  MODIFY `regular_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `saver_menu`
--
ALTER TABLE `saver_menu`
  MODIFY `saver_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD CONSTRAINT `menu_type_ibfk_1` FOREIGN KEY (`fk_saver_id`) REFERENCES `saver_menu` (`saver_menu_id`),
  ADD CONSTRAINT `menu_type_ibfk_2` FOREIGN KEY (`fk_reugular_id`) REFERENCES `regular_menu` (`regular_menu_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`fk_menu_type_id`) REFERENCES `menu_type` (`menu_type_id`),
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`fk_staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `order_ibfk_5` FOREIGN KEY (`fk_store_id`) REFERENCES `store` (`store_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`quantity`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`fk_item_id`) REFERENCES `item` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;