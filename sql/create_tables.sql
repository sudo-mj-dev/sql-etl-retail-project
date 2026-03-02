-- Orders
CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    customer_id INT,
    store_id INT,
    status VARCHAR(20)
);

-- Order_items
CREATE TABLE order_items (
    order_item_id INT,
    order_id INT,
    product_id INT,
    qty INT,
    unit_price DECIMAL(10,2)
);

-- Products
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    current_price DECIMAL(10,2)
);

INSERT INTO orders VALUES
(1001,'2024-01-05',501,10,'COMPLETE'),
(1002,'2024-01-06',502,10,'CANCELLED'),
(1003,'2024-01-06',501,11,'COMPLETE'),
(1004,'2024-02-01',503,12,'COMPLETE');

INSERT INTO order_items VALUES
(1,1001,301,2,500),
(2,1001,302,1,1200),
(3,1002,301,1,500),
(4,1003,301,1,520),
(5,1004,303,4,250);

INSERT INTO products VALUES
(301,'Phone X','Electronics',500),
(302,'Laptop Z','Computers',1200),
(303,'Headphones Y','Accessories',250);
