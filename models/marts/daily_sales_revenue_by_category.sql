{{ config(materialized='table') }}

SELECT
    s.sale_date,
    p.category,
    SUM(s.quantity * p.price) AS daily_revenue
FROM {{ ref('stg_sales') }} s
JOIN {{ ref('stg_products') }} p ON s.product_id = p.product_id
GROUP BY s.sale_date, p.category
ORDER BY s.sale_date, p.category