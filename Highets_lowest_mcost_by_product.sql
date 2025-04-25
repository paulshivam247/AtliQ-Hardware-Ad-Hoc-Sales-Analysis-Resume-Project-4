#Get the products that have the highest and lowest manufacturing costs. The final output
#  should contain these fields, product_code product manufacturing_cost

(
    SELECT 
        dp.product_code,
        dp.product,
        mc.manufacturing_cost,
        'Highest' AS cost_type
    FROM gdb023.dim_product dp
    JOIN fact_manufacturing_cost mc ON dp.product_code = mc.product_code
    ORDER BY mc.manufacturing_cost DESC
    LIMIT 1
)
UNION ALL
(
    SELECT 
        dp.product_code,
        dp.product,
        mc.manufacturing_cost,
        'Lowest' AS cost_type
    FROM gdb023.dim_product dp
    JOIN fact_manufacturing_cost mc ON dp.product_code = mc.product_code
    ORDER BY mc.manufacturing_cost ASC
    LIMIT 1
);

