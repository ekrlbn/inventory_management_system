CREATE DATABASE IF NOT EXISTS inventory;

USE inventory;

CREATE TABLE IF NOT EXISTS user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    session VARCHAR(36)
);

CREATE TABLE IF NOT EXISTS supplier(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS product(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
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
    unit_price DOUBLE,
    sale_id INT,
    FOREIGN KEY (product_id) REFERENCES product (id),
    FOREIGN KEY (sale_id) REFERENCES sale (id)
);


CREATE TABLE IF NOT EXISTS purchase_detail(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    unit_price DOUBLE,
    purchase_id INT,
    FOREIGN KEY (product_id) REFERENCES product (id),
    FOREIGN KEY (purchase_id) REFERENCES purchase (id)
);