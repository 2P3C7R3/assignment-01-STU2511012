-- Q1: Lists all customers with the total number of orders they have placed.
SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('/mnt/data/customers.csv') AS c
LEFT JOIN read_json_auto('/mnt/data/orders.json') AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC, c.customer_id;

-- Q2: Finds the top 3 customers by total order value using the orders JSON file joined to customers.
SELECT
    c.customer_id,
    c.name AS customer_name,
    SUM(o.total_amount) AS total_order_value
FROM read_csv_auto('/mnt/data/customers.csv') AS c
JOIN read_json_auto('/mnt/data/orders.json') AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_order_value DESC, c.customer_id
LIMIT 3;

-- Q3: Lists distinct products purchased by customers whose city is Bangalore.
SELECT DISTINCT
    p.product_id,
    p.product_name,
    p.category
FROM read_csv_auto('/mnt/data/customers.csv') AS c
JOIN read_json_auto('/mnt/data/orders.json') AS o
    ON c.customer_id = o.customer_id
JOIN read_parquet('/mnt/data/products.parquet') AS p
    ON o.order_id = p.order_id
WHERE c.city = 'Bangalore'
ORDER BY p.product_name;

-- Q4: Joins all three raw files to show customer name, order date, product name, and quantity for each line item.
SELECT
    c.name AS customer_name,
    o.order_date,
    p.product_name,
    p.quantity
FROM read_csv_auto('/mnt/data/customers.csv') AS c
JOIN read_json_auto('/mnt/data/orders.json') AS o
    ON c.customer_id = o.customer_id
JOIN read_parquet('/mnt/data/products.parquet') AS p
    ON o.order_id = p.order_id
ORDER BY o.order_date, customer_name, p.product_name;
