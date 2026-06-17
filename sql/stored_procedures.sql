CREATE PROCEDURE GetTopCustomers()
BEGIN
    SELECT
        c.customer_name,
        ROUND(SUM(p.price * oi.quantity),2) AS spending
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_name
    ORDER BY spending DESC
    LIMIT 10;
END $$

