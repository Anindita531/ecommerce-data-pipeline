-- ==============================
-- E-commerce Data Analysis Queries
-- ==============================

-- 1. Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;


-- 2. Total customers
SELECT COUNT(*) AS total_customers
FROM customers;


-- 3. Orders per customer (Top 10)
SELECT 
    c.customer_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC
LIMIT 10;


-- 4. Orders by state
SELECT 
    c.customer_state,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;


-- 5. Monthly order trend
SELECT 
    year,
    month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY year, month
ORDER BY year, month;


-- 6. Order status distribution
SELECT 
    order_status,
    COUNT(*) AS total
FROM orders
GROUP BY order_status
ORDER BY total DESC;


-- 7. Orders delivered vs not delivered
SELECT 
    CASE 
        WHEN order_delivered_customer_date IS NULL THEN 'Not Delivered'
        ELSE 'Delivered'
    END AS delivery_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY delivery_status;


-- 8. Average delivery time (in days)
SELECT 
    AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


-- 9. Top states by delivered orders
SELECT 
    c.customer_state,
    COUNT(*) AS delivered_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY delivered_orders DESC;


-- 10. Late deliveries (actual > estimated)
SELECT 
    COUNT(*) AS late_deliveries
FROM orders
WHERE order_delivered_customer_date > order_estimated_delivery_date;


-- 11. On-time deliveries
SELECT 
    COUNT(*) AS on_time_deliveries
FROM orders
WHERE order_delivered_customer_date <= order_estimated_delivery_date;


-- 12. Monthly delivery performance
SELECT 
    year,
    month,
    COUNT(*) AS total_orders,
    SUM(CASE 
        WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 1 
        ELSE 0 
    END) AS on_time_orders
FROM orders
GROUP BY year, month
ORDER BY year, month;