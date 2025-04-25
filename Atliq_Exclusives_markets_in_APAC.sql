# Provide the list of markets in which customer "Atliq Exclusive" operates its business
# in the APAC region.

SELECT 
	dc.customer,
    dc.market,
    dc.region
    FROM gdb023.fact_sales_monthly fs
    JOIN gdb023.dim_customer dc ON dc.customer_code = fs.customer_code
    JOIN gdb023.fact_gross_price fg ON fg.product_code = fs.product_code
    WHERE customer = "Atliq Exclusive"
    AND region = "APAC"
    GROUP BY dc.customer, dc.market, dc.region;