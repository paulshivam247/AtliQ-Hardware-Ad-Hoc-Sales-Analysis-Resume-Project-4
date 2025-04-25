# In which quarter of 2020, got the maximum total_sold_quantity? The final output 
# contains these fields sorted by the total_sold_quantity, Quarter total_sold_quantity

SELECT 
     FiscalQuarter AS quarter,
     SUM(sold_quantity) AS total_sold_qty
     FROM gdb023.fact_sales_monthly
     WHERE fiscal_year = 2020
     GROUP BY quarter
     ORDER BY total_sold_qty DESC;

