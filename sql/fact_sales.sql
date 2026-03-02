-- Fact Table: 
-- Numeric metrics (qty, price, revenue)
-- Foreign keys to dimensions
-- Filtered business‑valid records (CANCELLED already removed)
CREATE TABLE fact_sales AS
SELECT
	oi.order_item_id AS sales_id,
	o.order_id,
	o.order_date,
	o.store_id,
	o.customer_id,
	
	oi.product_id,
	p.product_name,
	p.category,
	
	oi.qty,
	(oi.qty*oi.unit_price) AS gross_amount
FROM stg_order_items oi
JOIN stg_orders o      ON oi.order_id = o.order_id
JOIN stg_products p    ON oi.product_id = p.product_id;
