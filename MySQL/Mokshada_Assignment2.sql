-- 1) Create a new schema named sales_db and use it.

create database  sales_db;
USE sales_db;
SHOW TABLES;

-- 2) Create a table named products with columns: product_id (INT, PRIMARY KEY, AUTO_INCREMENT), product_name (VARCHAR(100)), 
-- category (VARCHAR(50)), price (DECIMAL(10,2)), stock_quantity (INT).

CREATE TABLE products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR (100),
category VARCHAR(50),
price DECIMAL(10,2), 
stock_quantity INT);

-- 3) Insert at least 5 records into the products table with appropriate values.

INSERT INTO products(product_name,category,price,stock_quantity)
VALUES('Laptop', 'Electronics', 55000.00, 10),
('Smartphone', 'Electronics', 25000.00, 25),
('Office Chair', 'Furniture', 4500.00, 15),
('Wireless Mouse', 'Accessories', 799.00, 50),
('Notebook', 'Stationery', 60.00, 200),
('cloths', 'Clothing', 800, 200),
('HOMES', 'home', 800, 200);


-- 4) Display all records from the products table.

SELECT * FROM products;

-- 5) Create a new table named suppliers with columns: supplier_id (INT, PRIMARY KEY, AUTO_INCREMENT), supplier_name (VARCHAR(100)), city (VARCHAR(50)), contact_number (VARCHAR(15)).

CREATE TABLE suppliers (
supplier_id INT PRIMARY KEY AUTO_INCREMENT,
supplier_name VARCHAR(100),
city VARCHAR(50),
contact_number VARCHAR(15));

-- 6) Insert at least 5 records into the suppliers table.

INSERT INTO suppliers (supplier_name, city, contact_number) VALUES
('TechSource Pvt Ltd', 'Pune', '9876543210'),
('MegaElectro', 'Mumbai', '9123456780'),
('HomeComforts', 'Bangalore', '9988776655'),
('FashionHub', 'Pune', '9090909090'),
('SoundWave Ltd', 'Mumbai', '9191919191');

-- 7) Retrieve only product_name and price from the products table.
SELECT  product_name,price FROM  products;

-- 8) Display product_name and price as “Product” and “Unit Price” using aliases.

SELECT product_name AS Product, price AS "Unit Price" FROM products;

-- 9) Show all unique categories from the products table.

SELECT DISTINCT category FROM products;

-- 10) Retrieve all products where the price is greater than 500.
SELECT * FROM products WHERE price>500;

-- 11) Retrieve all products where stock_quantity is less than 100.
SELECT * FROM products WHERE stock_quantity <100;

-- 12) Retrieve products where category is 'Electronics' and price is greater than 1000.

SELECT * FROM products WHERE category ='Electronics' AND price >1000;

-- 13) Retrieve products where category is 'Clothing' or price is below 800.

SELECT * FROM products where category= 'Clothing' OR price>800;

-- 14) Retrieve products where price is between 200 and 1000.

      SELECT* FROM products WHERE price BETWEEN 200 AND 1000;
      
-- 15) Retrieve all suppliers who are located in 'Pune' or 'Mumbai'.

SELECT * FROM suppliers 
      WHERE city IN ('pune','Mumbai');
      
-- 16) Retrieve products whose product_name starts with the letter 'S'.

      SELECT * FROM products WHERE product_name LIKE 'S%';
      
-- 17) Retrieve products whose category contains the word 'home'.
SELECT * FROM products
WHERE category LIKE '%home';

-- 18) Retrieve products whose product_name ends with the letter 'a'.
 
SELECT * FROM products WHERE  product_name LIKE '%p';

-- 19) Add a new column discount (DECIMAL(5,2)) to the products table.

ALTER TABLE products
ADD discount DECIMAL(5,2);

-- 20) Update the discount for all products in the 'Electronics' category to 10.5.
UPDATE products
SET discount = 10.5
WHERE product_id IN (
    SELECT product_id
    FROM products
    WHERE category = 'Electronics'
);

-- 21) Update the stock_quantity of the product with product_id = 3 to 200.
UPDATE employees SET email = 'john.doe@company.com' WHERE employee_id =1;

UPDATE products
SET stock_quantity = 200
WHERE product_id = 3;

select * from products;

-- 22) Delete the product record where product_id = 5.
DELETE FROM products WHERE product_id =5;

-- 23) Add a new column manufacture_date (DATE) to the products table with a default value of '2024-01-01'.
 
 ALTER TABLE products 
 ADD COLUMN manufacture_date DATE DEFAULT '2024-01-01';
      

-- 24) Retrieve products whose manufacture_date is after '2023-12-31'.

SELECT * FROM products
WHERE manufacture_date > '2023-12-31';

use  sales_db;
-- 25) Retrieve products whose manufacture_date is before '2024-06-01'.

SELECT * FROM products
WHERE manufacture_date < '2024-06-01';


-- 26) Rename the column category to product_category in the products table.

ALTER TABLE products 
CHANGE COLUMN  category  product_category VARCHAR(50);


-- 27) Modify the data type of price column to DECIMAL(12,2).
ALTER TABLE products
MODIFY COLUMN price DECIMAL(12,2);

-- 28) Retrieve total number of products available in the products table.
SELECT COUNT(*) AS total_products FROM products;

-- 29) Retrieve total number of distinct product categories.
SELECT COUNT(DISTINCT product_category) AS total_categories
FROM products;

-- 30) Retrieve the average price of all products.
SELECT AVG(price) AS average_price FROM products;

-- 31) Retrieve maximum and minimum price from the products table.
SELECT MIN(price) AS min_price FROM products;


-- 32) Retrieve total number of products per category using GROUP BY.

SELECT product_category, COUNT(*) AS total_products
FROM products
GROUP BY product_category;

-- 33) Retrieve average price per category using GROUP BY.
SELECT product_category, AVG(price) AS avg_price
FROM products
GROUP BY product_category;

-- 34) Retrieve total stock per category using GROUP BY and display as “Total Stock”.
SELECT product_category, SUM(stock_quantity) AS "Total Stock"
FROM products
GROUP BY product_category;

-- 35) Retrieve products sorted by price in ascending order.
SELECT * FROM products ORDER BY price ASC;

-- 36) Retrieve products sorted by price in descending order.
SELECT *FROM products ORDER BY price DESC;

-- 37) Retrieve products sorted by product_name alphabetically.
SELECT * FROM products ORDER BY product_name;

-- 38) Retrieve top 3 highest priced products using LIMIT.
SELECT * FROM products
ORDER BY price DESC
LIMIT 3;

-- 39) Retrieve products where discount is NULL.
SELECT * FROM products
WHERE discount IS NULL;

-- 40) Retrieve products where discount is NOT NULL.


-- 41) Add a UNIQUE constraint on product_name column.
ALTER TABLE products
ADD CONSTRAINT unique_product_name UNIQUE (product_name);

-- 42) Create a new table named orders with columns: order_id (INT, PRIMARY KEY, AUTO_INCREMENT),
-- product_id (INT), quantity (INT), order_date (DATE).

CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT,
quantity INT,
order_date DATE );

-- 43) Insert 5 records into the orders table referencing existing product_id values

INSERT INTO orders (product_id, quantity, order_date) VALUES
(1, 2, '2025-01-05'),
(2, 1, '2025-01-15'),
(1, 3, '2024-12-20'),
(3, 4, '2025-02-01'),
(4, 2, '2025-01-25');

-- 44) Retrieve all orders where quantity is greater than 2.

SELECT * FROM orders WHERE quantity >2;

-- 45) Retrieve orders placed in the month of January 2025.

SELECT * FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-01-31';

-- 46) Retrieve all orders where order_date is between '2024-12-01' and '2025-02-01'.

 SELECT * FROM orders WHERE order_date  BETWEEN '2024-12-01' AND '2025-02-01';
 
 
-- 47) Retrieve total number of orders per product using GROUP BY.
SELECT product_id, COUNT(*) AS total_orders
FROM orders
GROUP BY product_id;

-- 48) Retrieve total quantity ordered per product using GROUP BY.
SELECT product_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id;

-- 49) Retrieve the total revenue per product (quantity * price) using a JOIN between orders and products.

