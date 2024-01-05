CREATE DATABASE IF NOT EXISTS inventory;

USE inventory;

CREATE TABLE IF NOT EXISTS user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    session_id VARCHAR(36)
);

CREATE TABLE IF NOT EXISTS supplier(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS product(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    current_price DOUBLE,
    quantity INT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE IF NOT EXISTS purchase(
    id INT PRIMARY KEY AUTO_INCREMENT,
    p_date TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sale(
    id INT PRIMARY KEY AUTO_INCREMENT,
    s_date TIMESTAMP
);


CREATE TABLE IF NOT EXISTS sale_detail(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    price DOUBLE,
    quantity INT,
    sale_id INT,
    FOREIGN KEY (product_id) REFERENCES product (id),
    FOREIGN KEY (sale_id) REFERENCES sale (id)
);


CREATE TABLE IF NOT EXISTS purchase_detail(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    price DOUBLE,
    purchase_id INT,
    FOREIGN KEY (product_id) REFERENCES product (id),
    FOREIGN KEY (purchase_id) REFERENCES purchase (id)
);


INSERT INTO user (username, password) VALUES ('admin', 'admin');

INSERT INTO supplier (name, phone) VALUES
('SweetDelights Distributors', '5551234567'),
('CrispyTreats Suppliers', '5552345678'),
('SugarJoy Traders', '5553456789'),
('CookieCraze Enterprises', '5554567890'),
('CandyLand Distributing Co.', '5555678901'),
('GourmetBites Suppliers', '5556789012'),
('BlissfulSweets Trading', '5557890123'),
('SnackHarmony Distributors', '5558901234'),
('DelightfulMunchies Co.', '5559012345'),
('TastyBites Wholesalers', '5550123456'),
('SugarRush Trading Company', '5551232567'),
('CrunchyMingle Suppliers', '5552345278'),
('YummyHaven Distributors', '5553456749'),
('DivineConfections Traders', '5554562890'),
('SweetSensation Wholesalers', '5555628901'),
('CrispNJoy Suppliers', '5556789212'),
('MunchyMagic Trading Co.', '5557891123'),
('CookieHeaven Distributing', '5558201234'),
('CandyCrunch Wholesalers', '5559011345'),
('HeavenlyTreats Suppliers', '5550163456');

INSERT INTO product (name, current_price, quantity, supplier_id) VALUES
('Chocolate Chip Cookies', 2.99, 150, 1),
('Fruity Gummy Bears', 1.49, 300, 2),
('Butter Shortbread Biscuits', 3.99, 100, 3),
('Assorted Chocolates Mix', 4.49, 200, 4),
('Jelly-filled Donuts', 2.79, 250, 5),
('Hazelnut Crunch Biscuits', 3.29, 180, 6),
('Caramel Popcorn', 1.99, 220, 7),
('Vanilla Cream Sandwich Cookies', 3.49, 170, 8),
('Sour Cherry Candies', 2.19, 280, 9),
('Peanut Butter Cups', 4.99, 120, 10),
('White Chocolate Macadamia Cookies', 3.79, 190, 11),
('Fudge Brownie Bites', 2.59, 240, 12),
('Ginger Snap Biscuits', 3.89, 160, 13),
('Cotton Candy Bags', 1.69, 270, 14),
('Almond Joy Chocolates', 4.29, 130, 15),
('Lemon Shortbread Cookies', 3.09, 210, 16),
('Rock Candy Sticks', 2.39, 260, 17),
('Pistachio Delight Biscuits', 3.69, 140, 18),
('Bubblegum Balls', 1.79, 290, 19),
('Raspberry Dark Chocolate Bars', 4.79, 110, 20),
('Mint Chocolate Chip Cookies', 2.99, 150, 2),
('Fruity Rainbow Gummies', 1.49, 300, 3),
('Cinnamon Swirl Biscuits', 3.99, 100, 4),
('Decadent Chocolate Bonbons', 4.49, 200, 6),
('Blueberry Glazed Donuts', 2.79, 250, 8),
('Peanut Butter Bliss Biscuits', 3.29, 180, 9),
('Spicy Jalapeno Popcorn', 1.99, 220, 10),
('Oreo Cream Cookies', 3.49, 170, 11),
('Tropical Fruit Chewy Candies', 2.19, 280, 13),
('Salted Caramel Chocolate Squares', 4.99, 120, 14),
('Chewy Mocha Cookies', 3.79, 190, 15),
('Chocolate Hazelnut Brownie Bites', 2.59, 240, 2),
('Lavender Shortbread Biscuits', 3.89, 160, 2),
('Strawberry Lollipop Delight', 1.69, 270, 4),
('White Chocolate Toffee Crunch', 4.29, 130, 9),
('Lemon Zest Cookies', 3.09, 210, 15),
('Fizzy Fruit Rock Candy', 2.39, 260, 20),
('Pistachio Nut Biscuits', 3.69, 140, 20);

INSERT INTO purchase (p_date) VALUES
  ('2023-01-01 12:00:00'),
  ('2023-02-15 14:30:00'),
  ('2023-03-10 09:45:00'),
  ('2023-04-20 18:20:00'),
  ('2023-05-05 07:30:00'),
  ('2023-06-12 10:45:00'),
  ('2023-07-07 16:00:00'),
  ('2023-08-18 21:15:00'),
  ('2023-09-08 11:30:00'),
  ('2023-10-25 14:45:00'),
  ('2023-11-03 08:00:00'),
  ('2023-12-15 17:30:00'),
  ('2023-01-02 08:15:00'),
  ('2023-02-20 16:45:00'),
  ('2023-03-15 11:00:00'),
  ('2023-04-10 19:30:00'),
  ('2023-05-12 06:45:00'),
  ('2023-06-20 13:10:00'),
  ('2023-07-15 15:30:00'),
  ('2023-08-22 22:00:00'),
  ('2023-09-12 12:30:00'),
  ('2023-10-30 15:55:00'),
  ('2023-11-08 09:10:00'),
  ('2023-12-20 18:35:00');

INSERT INTO sale (s_date) VALUES
    ('2023-01-01 12:00:00'),
    ('2023-02-15 14:30:00'),
    ('2023-03-10 09:45:00'),
    ('2023-04-20 18:20:00'),
    ('2023-05-05 07:30:00'),
    ('2023-06-12 10:45:00'),
    ('2023-07-07 16:00:00'),
    ('2023-08-18 21:15:00'),
    ('2023-09-08 11:30:00'),
    ('2023-10-25 14:45:00'),
    ('2023-11-03 08:00:00'),
    ('2023-12-15 17:30:00'),
    ('2023-01-02 08:15:00'),
    ('2023-02-20 16:45:00'),
    ('2023-03-15 11:00:00'),
    ('2023-04-10 19:30:00'),
    ('2023-05-12 06:45:00'),
    ('2023-06-20 13:10:00'),
    ('2023-07-15 15:30:00'),
    ('2023-08-22 22:00:00'),
    ('2023-09-12 12:30:00'),
    ('2023-10-30 15:55:00'),
    ('2023-11-08 09:10:00'),
    ('2023-12-20 18:35:00');

INSERT INTO purchase_detail (product_id, price, quantity, purchase_id) VALUES
  (15, 12.6, 120, 8),
(23, 10.3, 75, 17),
(7, 15.8, 180, 3),
(31, 18.5, 95, 22),
(14, 6.7, 150, 11),
(5, 13.2, 110, 6),
(20, 9.4, 55, 19),
(11, 16.9, 160, 13),
(36, 14.7, 130, 2),
(29, 7.1, 70, 14),
(8, 11.8, 100, 10),
(17, 19.2, 190, 23),
(26, 5.5, 120, 7),
(2, 17.3, 85, 16),
(33, 8.6, 170, 1),
(22, 12.1, 60, 20),
(9, 14.4, 140, 4),
(35, 10.9, 105, 12),
(18, 16.0, 195, 18),
(13, 6.2, 125, 9),
(28, 15.5, 80, 21),
(3, 9.9, 165, 5),
(24, 13.7, 115, 15),
(19, 11.4, 145, 8),
(32, 7.8, 90, 13),
(6, 18.2, 175, 24),
(27, 5.1, 135, 6),
(12, 16.4, 110, 17),
(37, 10.1, 55, 1),
(30, 14.9, 185, 11),
(4, 8.2, 75, 10),
(21, 12.3, 155, 3),
(10, 17.6, 120, 19),
(25, 6.4, 95, 8),
(16, 15.1, 160, 14),
(1, 9.7, 130, 12),
(34, 13.0, 100, 16),
(15, 11.6, 175, 22),
(23, 17.5, 80, 4);


INSERT INTO sale_detail (product_id, price, quantity, sale_id) VALUES
(1, 10.5, 120, 1),
(2, 15.3, 80, 2),
(3, 8.7, 150, 3),
(4, 18.2, 100, 4),
(5, 6.4, 180, 5),
(6, 12.9, 55, 6),
(7, 19.8, 130, 7),
(8, 7.1, 95, 8),
(9, 14.6, 160, 9),
(10, 9.3, 70, 10),
(11, 17.0, 110, 11),
(12, 13.7, 140, 12),
(13, 5.6, 185, 13),
(14, 16.1, 120, 14),
(15, 11.2, 90, 15),
(16, 8.9, 55, 16),
(17, 18.4, 170, 17),
(18, 6.7, 105, 18),
(19, 14.3, 75, 19),
(20, 12.0, 195, 20),
(21, 16.8, 160, 21),
(22, 7.5, 130, 22),
(23, 9.6, 85, 23),
(24, 19.0, 110, 24),
(25, 10.1, 155, 1),
(26, 15.7, 120, 2),
(27, 8.4, 80, 3),
(28, 18.9, 145, 4),
(29, 6.2, 195, 5),
(30, 12.5, 100, 6),
(31, 19.3, 60, 7),
(32, 7.8, 130, 8),
(33, 14.2, 180, 9),
(34, 9.9, 95, 10),
(35, 17.6, 150, 11),
(36, 13.0, 120, 12),
(37, 5.5, 85, 13);

