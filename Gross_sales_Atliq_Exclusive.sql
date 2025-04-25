SELECT 
    DATE_FORMAT(fs.date, '%b %y') AS month,
    fs.fiscal_year AS year,
    ROUND(SUM(fs.sold_quantity * gp.gross_price), 2) AS gross_sales_amount
FROM gdb023.fact_sales_monthly fs
JOIN gdb023.fact_gross_price gp 
    ON fs.product_code = gp.product_code 
    AND fs.fiscal_year = gp.fiscal_year
JOIN gdb023.dim_customer dc 
    ON fs.customer_code = dc.customer_code
WHERE dc.customer = 'Atliq Exclusive'
GROUP BY DATE_FORMAT(fs.date, '%b %y'), fs.fiscal_year
ORDER BY fs.fiscal_year;