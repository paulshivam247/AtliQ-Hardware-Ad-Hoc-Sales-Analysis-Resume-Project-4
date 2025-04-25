# Generate a report which contains the top 5 customers who received an average high 
# pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. 
# The final output contains these fields, customer_code customer 
# average_discount_percentage


SELECT 
	dc.customer_code,
    dc.customer,
    ROUND(AVG(id.pre_invoice_discount_pct), 2) AS avg_discnt_pct
    FROM gdb023.fact_pre_invoice_deductions id
    JOIN dim_customer dc ON id.customer_code = dc.customer_code
    WHERE id.fiscal_year = 2021
    AND dc.market = "India"
    GROUP BY dc.customer_code, dc.customer
    ORDER BY avg_discnt_pct DESC
    LIMIT 5;