# Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
# The final output contains these fields, segment product_count_2020 product_count_2021 
# difference

WITH unique_products AS (
    SELECT 
         dp.segment,
         fs.fiscal_year AS year,
         COUNT(DISTINCT dp.product_code) AS product_count
    FROM gdb023.dim_product dp
    JOIN fact_sales_monthly fs ON dp.product_code = fs.product_code
    GROUP BY fs.fiscal_year, dp.segment
)

SELECT 
	segment,
    MAX(CASE WHEN year = 2020 THEN product_count END) AS product_count_2020,
    MAX(CASE WHEN year = 2021 THEN product_count END) AS product_count_2021,
    MAX(CASE WHEN year = 2021 THEN product_count END) - 
    MAX(CASE WHEN year = 2020 THEN product_count END) AS difference
FROM unique_products
GROUP BY segment
ORDER BY difference DESC;
