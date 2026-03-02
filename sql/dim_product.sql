-- Dimension table: Descriptive info about Products
CREATE TABLE dim_product AS
SELECT
	Product_id,
	Product_name,
	Category,
	Current_price
FROM stg_products;
