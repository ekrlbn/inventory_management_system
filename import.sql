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
    quantity INT,
    sale_id INT,
    FOREIGN KEY (product_id) REFERENCES product (id),
    FOREIGN KEY (sale_id) REFERENCES sale (id)
);


CREATE TABLE IF NOT EXISTS purchase_detail(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
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

INSERT INTO purchase_detail (product_id, quantity, purchase_id) VALUES
  (1, 5, 1),
  (2, 8, 2),
  (3, 10, 3),
  (4, 3, 4),
  (5, 7, 5),
  (6, 2, 6),
  (7, 6, 7),
  (8, 9, 8),
  (9, 4, 9),
  (10, 12, 10),
  (11, 1, 11),
  (12, 11, 12),
  (13, 8, 13),
  (14, 3, 14),
  (15, 5, 15),
  (16, 7, 16),
  (17, 10, 17),
  (18, 2, 18),
  (19, 6, 19),
  (20, 9, 20),
  (21, 4, 21),
  (22, 12, 22),
  (23, 1, 23),
  (24, 11, 24),
  (25, 8, 1),
  (26, 3, 2),
  (27, 5, 3),
  (28, 7, 4),
  (29, 10, 5),
  (30, 2, 6),
  (31, 6, 7),
  (32, 9, 8),
  (33, 4, 9),
  (34, 12, 10),
  (35, 1, 11),
  (36, 11, 12),
  (37, 8, 13);

INSERT INTO sale_detail (product_id, quantity, sale_id) VALUES
  (1, 5, 1),
  (2, 8, 2),
  (3, 10, 3),
  (4, 3, 4),
  (5, 7, 5),
  (6, 2, 6),
  (7, 6, 7),
  (8, 9, 8),
  (9, 4, 9),
  (10, 12, 10),
  (11, 1, 11),
  (12, 11, 12),
  (13, 8, 13),
  (14, 3, 14),
  (15, 5, 15),
  (16, 7, 16),
  (17, 10, 17),
  (18, 2, 18),
  (19, 6, 19),
  (20, 9, 20),
  (21, 4, 21),
  (22, 12, 22),
  (23, 1, 23),
  (24, 11, 24),
  (25, 8, 1),
  (26, 3, 2),
  (27, 5, 3),
  (28, 7, 4),
  (29, 10, 5),
  (30, 2, 6),
  (31, 6, 7),
  (32, 9, 8),
  (33, 4, 9),
  (34, 12, 10),
  (35, 1, 11),
  (36, 11, 12),
  (37, 8, 13);
