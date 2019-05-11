CREATE DATABASE IF NOT EXISTS bamazondb;

USE bamazondb;

CREATE TABLE IF NOT EXISTS products (
	item_id INT (50) AUTO_INCREMENT NOT NULL,
	department_name VARCHAR (100) NOT NULL,
    product_name VARCHAR (100) NOT NULL,
    price DECIMAL (10, 2) NOT NULL,
    stock_quantity INT (50) NOT NULL,
    PRIMARY KEY (item_id)
);

SELECT * FROM products;

INSERT INTO products (department_name, product_name, price, stock_quantity)
VALUES ("toys", "barbie", 9.99, 50),
	   ("toys", "hatchimals", 34.49, 50),
       ("toys", "avengers action figures", 79.99, 50),
       ("clothes", "turtleneck", 12.00, 75),
       ("clothes", "corduroys", 24.49, 75),
       ("clothes", "tube socks", 3.99, 75),
       ("sporting goods", "hockey stick", 120.00, 5),
       ("sporting goods", "basketball", 16.99, 10),
       ("sporting goods", "baseball glove", 44.79, 10),
       ("electronics", "PS4", 399.99, 2),
       ("electronics", "VR headset", 88.99, 10),
       ("electronics", "HDMI cord", 4.00, 50),
       ("outdoors", "tent", 39.99, 10),
       ("outdoors", "fishing pole", 55.00, 50),
       ("outdoors", "firepit", 99.99, 10);