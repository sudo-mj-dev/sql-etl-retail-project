# SQL ETL Retail Project
## 1. Project Overview
This repository contains a simple SQL-based ETL project built using MySQL on DB Fiddle.  
It demonstrates how raw CSV data can be:
1. Extracted into raw tables  
2. Transformed into clean staging tables  
3. Loaded into Dimension and Fact tables  
This project helps build foundational ETL and SQL skills required for Data Engineering roles.
---
## 2. Folder Structure
sql-etl-retail-project/ │ ├── raw_data/ │ ├── orders.csv │ ├── order_items.csv │ └── products.csv │ ├── sql/ │ ├── create_tables.sql │ ├── staging.sql │ ├── dim_product.sql │ └── fact_sales.sql │ └── README.md
---
## 3. Raw Data Description 
### 3.1 orders.csv 
Contains order header information such as order date, customer ID, store ID, and status.
### 3.2 order_items.csv 
Contains line-level item data such as product ID, quantity, and unit price. 
### 3.3 products.csv 
Contains product master data including product name, category, and price. These three datasets represent a simplified retail order system. 
--- 
## 4. ETL Steps 
### 4.1 Extract Raw CSV data is loaded into three MySQL tables: - `orders` - `order_items` - `products` 
### 4.2 Transform (Staging Layer) Three cleaned staging tables are created: - `stg_orders` - `stg_order_items` - `stg_products` Transformations include: - Fixing data types - Standardizing text (uppercase, trimming) - Removing cancelled orders - Handling null values - Preparing data for joins ### 4.3 Load 
Two final tables are created: 
#### 4.3.1 dim_product 
Contains product-related descriptive attributes. 
#### 4.3.2 fact_sales 
A fact table created by joining staging tables. Contains: - Order information - Product details - Quantities and prices - A derived metric: `gross_amount = qty * unit_price` 
--- 
## 5. Example Analysis Queries 
### Total Revenue 
SELECT SUM(gross_amount) AS total_revenue 
FROM fact_sales;
### Revenue by Product Category
SELECT category, SUM(gross_amount) AS revenue
FROM fact_sales
GROUP BY category;
###Top Selling Products
SELECT product_name, SUM(qty) AS total_qty
FROM fact_sales
GROUP BY product_name
ORDER BY total_qty DESC;
