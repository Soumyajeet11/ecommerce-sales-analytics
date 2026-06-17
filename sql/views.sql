CREATE VIEW customer_spending AS
SELECT
    c.customer_id,
    c.customer_name,
    ROUND(SUM(p.price * oi.quantity),2) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name;


CREATE VIEW monthly_sales_summary AS
SELECT
    DATE_FORMAT(o.order_date,'%Y-%m') AS sales_month,
    ROUND(SUM(p.price * oi.quantity),2) AS revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY sales_month;


