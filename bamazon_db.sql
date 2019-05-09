CREATE DATABASE IF NOT EXISTS bamazon_db;

CREATE TABLE IF NOT EXISTS products(
	item_id INT (50) AUTO_INCREMENT NOT NULL,
    product_name VARCHAR (100) NOT NULL,
    department_name VARCHAR (100) NOT NULL,
    price DECIMAL (10, 2) NOT NULL,
    stock_quantity INT (50) NOT NULL,
    PRIMARY KEY (item_id)
);

SELECT * FROM products;

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (101, "barbie", "toys", 9.99, 50),
	   (102, "hatchimals", "toys", 34.49, 50),
       (103, "avengers action figures", "toys", 79.99, 50),
       (201, "turtleneck", "clothes", 12.00, 75),
       (202, "corduroys", "clothes", 24.49, 75),
       (203, "tube socks", "clothes", 3.99, 75),
       (301, "hockey stick", "sporting goods", 120.00, 5),
       (302, "basketball", "sporting goods", 16.99, 10),
       (303, "baseball glove", "sporting goods", 44.79, 10),
       (401, "PS4", "electronics", 399.99, 2),
       (402, "VR headset", "electronics", 88.99, 10),
       (403, "HDMI cord", "electronics", 4.00, 50),
       (501, "tent", "outdoors", 39.99, 10),
       (502, "fishing pole", "outdoors", 55.00, 50),
       (503, "firepit", "outdoors", 99.99, 10)