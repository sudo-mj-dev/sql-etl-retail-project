-- Create table structure
CREATE TABLE dim_date (
    date_key INT,
    date_value DATE,
    year INT,
    month INT,
    day INT
);
-- Insert 1 year of dates (2024)
WITH RECURSIVE all_dates AS (
    SELECT DATE('2024-01-01') AS dt
    UNION ALL
    SELECT DATE_ADD(dt, INTERVAL 1 DAY)
    FROM all_dates
    WHERE dt < '2024-12-31'
)
INSERT INTO dim_date (date_key, date_value, year, month, day)
SELECT 
    DATE_FORMAT(dt, '%Y%m%d') AS date_key,
    dt AS date_value,
    YEAR(dt) AS year,
    MONTH(dt) AS month,
    DAY(dt) AS day
FROM all_dates;
