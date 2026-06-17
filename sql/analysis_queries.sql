SELECT
SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;
SELECT COUNT(*) AS total_orders
FROM orders;


SELECT
p.product_name,
SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC;


SELECT
p.category,
SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;

SELECT
ROUND(SUM(p.price * oi.quantity), 2) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;
SELECT COUNT(*) AS total_orders
FROM orders;


SELECT
p.product_name,
SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC
LIMIT 10;


SELECT
p.category,
ROUND(SUM(p.price * oi.quantity),2) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;


SELECT
c.customer_name,
ROUND(SUM(p.price * oi.quantity),2) AS total_spending
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spending DESC
LIMIT 10;


SELECT
DATE_FORMAT(o.order_date,'%Y-%m') AS month,
ROUND(SUM(p.price * oi.quantity),2) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;


