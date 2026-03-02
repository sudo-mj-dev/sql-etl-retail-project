-- Stg_orders
Create TABLE stg_orders AS
SELECT 
	CAST(order_id as SIGNED) AS order_id,
	CAST(order_date as DATE) AS order_date,
	CAST(customer_id as SIGNED) AS customer_id,
	CAST(store_id AS SIGNED) AS store_id,
	UPPER(TRIM(status)) AS status
FROM orders
WHERE status <> 'CANCELLED'
And order_date IS NOT NULL;

-- Stg_Order_items
CREATE TABLE stg_order_items AS
SELECT
	CAST(order_item_id AS SIGNED) AS order_item_id,
	CAST( order_id AS SIGNED) AS order_id,
	CAST(product_id AS SIGNED) AS product_id,
	COALESCE(CAST(qty AS SIGNED), 0) AS qty,
	COALESCE(CAST(unit_price AS DECIMAL(10,2)), 0.00) AS unit_price
FROM order_items;

-- Stg_products
CREATE TABLE stg_products AS
SELECT
  CAST(product_id AS SIGNED)              AS product_id,
  TRIM(product_name)                      AS product_name,
  UPPER(TRIM(category))                   AS category,
  COALESCE(CAST(current_price AS DECIMAL(10,2)), 0.00) AS current_price
FROM products;
