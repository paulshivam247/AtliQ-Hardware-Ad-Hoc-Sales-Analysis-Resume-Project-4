# What is the percentage of unique product increase in 2021 vs. 2020? The final 
# output contains these fields, unique_products_2020 unique_products_2021 
# percentage_chg


WITH unique_products AS (
	SELECT 
		 fiscal_year as year,
		 COUNT(DISTINCT product_code) AS unique_products
	FROM gdb023.fact_sales_monthly
	GROUP BY year
)

SELECT 
    MAX(CASE WHEN year = 2020 THEN unique_products END) AS unique_products_2020,
    MAX(CASE WHEN year = 2021 THEN unique_products END) AS unique_products_2021,
	ROUND(
        ((MAX(CASE WHEN year = 2021 THEN unique_products END) - 
          MAX(CASE WHEN year = 2020 THEN unique_products END)) * 100.0) / 
         MAX(CASE WHEN year = 2020 THEN unique_products END), 2) AS percentage_chg
FROM unique_products;
