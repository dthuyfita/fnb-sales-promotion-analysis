-- Query 1: View sample data
SELECT *
FROM sales_transactions
LIMIT 10;

-- Query 2: Calculate revenue per row
SELECT
    order_id,
    store_id,
    quantity,
    unit_price,
    quantity * unit_price AS revenue
FROM sales_transactions;

-- Query 3: Total revenue
SELECT
    SUM(quantity * unit_price) AS total_revenue
FROM sales_transactions;

-- Query 4: Total orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_transactions;

-- Query 5: AOV
SELECT
    SUM(quantity * unit_price) / COUNT(DISTINCT order_id) AS AOV
FROM sales_transactions;

-- Query 6: Revenue by store
SELECT
    store_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity * unit_price) AS total_revenue
FROM sales_transactions
GROUP BY store_id
ORDER BY total_revenue DESC;

-- Query 7: Revenue by store name
SELECT
    s.store_name,
    COUNT(DISTINCT t.order_id) AS total_orders,
    SUM(t.quantity * t.unit_price) AS total_revenue
FROM sales_transactions t
JOIN stores s
    ON t.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_revenue DESC;

-- Query 8: Promo vs Non-promo
SELECT
    CASE
        WHEN promo_id IS NULL THEN 'Non-promo'
        ELSE 'Promo'
    END AS promo_type,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity * unit_price) AS total_revenue,
    SUM(quantity * unit_price) / COUNT(DISTINCT order_id) AS AOV
FROM sales_transactions
GROUP BY promo_type;

-- Query 9: Store x Promo / Non-promo
SELECT
    s.store_name,
    CASE
        WHEN t.promo_id IS NULL THEN 'Non-promo'
        ELSE 'Promo'
    END AS promo_type,
    COUNT(DISTINCT t.order_id) AS total_orders,
    SUM(t.quantity * t.unit_price) AS total_revenue,
    SUM(t.quantity * t.unit_price) / COUNT(DISTINCT t.order_id) AS AOV
FROM stores s
LEFT JOIN sales_transactions t
    ON s.store_id = t.store_id
GROUP BY s.store_name, promo_type
ORDER BY s.store_name, promo_type;
