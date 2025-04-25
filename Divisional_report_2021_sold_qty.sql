# Get the Top 3 products in each division that have a high total_sold_quantity in 
# the fiscal_year 2021? The final output contains these fields, division product_code 
# product total_sold_quantity rank_order


WITH CTE1 AS (
SELECT 
     dp.division,
     fs.product_code,
     CONCAT(dp.product, ' (', dp.variant, ')') AS product_variant,
     SUM(fs.sold_quantity) AS total_sold_qty,
     DENSE_RANK () OVER (PARTITION BY dp.division ORDER BY SUM(fs.sold_quantity) DESC) AS rank_order
FROM gdb023.fact_sales_monthly fs
JOIN dim_product dp ON fs.product_code = dp.product_code
WHERE fs.fiscal_year = 2021
GROUP BY dp.division, fs.product_code, dp.product, dp.variant
)
SELECT 
	*
FROM CTE1
WHERE rank_order <= 3;