-- Drop tables if they already exist
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_store;
DROP TABLE IF EXISTS dim_product;

-- Date dimension
CREATE TABLE dim_date (
    date_key        INT PRIMARY KEY,
    full_date       DATE NOT NULL UNIQUE,
    day_num         INT NOT NULL,
    month_num       INT NOT NULL,
    month_name      VARCHAR(20) NOT NULL,
    quarter_num     INT NOT NULL,
    year_num        INT NOT NULL
);

-- Store dimension
CREATE TABLE dim_store (
    store_key       INT PRIMARY KEY,
    store_id        VARCHAR(10) NOT NULL UNIQUE,
    store_name      VARCHAR(100) NOT NULL UNIQUE,
    store_city      VARCHAR(50) NOT NULL
);

-- Product dimension
CREATE TABLE dim_product (
    product_key     INT PRIMARY KEY,
    product_id      VARCHAR(10) NOT NULL UNIQUE,
    product_name    VARCHAR(100) NOT NULL,
    category        VARCHAR(50) NOT NULL
);

-- Sales fact table
CREATE TABLE fact_sales (
    sales_key       INT PRIMARY KEY,
    transaction_id  VARCHAR(20) NOT NULL UNIQUE,
    date_key        INT NOT NULL,
    store_key       INT NOT NULL,
    product_key     INT NOT NULL,
    units_sold      INT NOT NULL,
    unit_price      DECIMAL(12,2) NOT NULL,
    sales_amount    DECIMAL(14,2) NOT NULL,
    CONSTRAINT fk_fact_date FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    CONSTRAINT fk_fact_store FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    CONSTRAINT fk_fact_product FOREIGN KEY (product_key) REFERENCES dim_product(product_key)
);

-- Cleaned and standardized dimension data loaded from retail_transactions.csv
INSERT INTO dim_date (date_key, full_date, day_num, month_num, month_name, quarter_num, year_num) VALUES
(20230115, '2023-01-15', 15, 1, 'January', 1, 2023),
(20230205, '2023-02-05', 5, 2, 'February', 1, 2023),
(20230220, '2023-02-20', 20, 2, 'February', 1, 2023),
(20230331, '2023-03-31', 31, 3, 'March', 1, 2023),
(20230604, '2023-06-04', 4, 6, 'June', 2, 2023),
(20230809, '2023-08-09', 9, 8, 'August', 3, 2023),
(20230815, '2023-08-15', 15, 8, 'August', 3, 2023),
(20230829, '2023-08-29', 29, 8, 'August', 3, 2023),
(20231020, '2023-10-20', 20, 10, 'October', 4, 2023),
(20231026, '2023-10-26', 26, 10, 'October', 4, 2023),
(20231208, '2023-12-08', 8, 12, 'December', 4, 2023),
(20231212, '2023-12-12', 12, 12, 'December', 4, 2023);

INSERT INTO dim_store (store_key, store_id, store_name, store_city) VALUES
(1, 'S001', 'Bangalore MG', 'Bangalore'),
(2, 'S002', 'Chennai Anna', 'Chennai'),
(3, 'S003', 'Delhi South', 'Delhi'),
(4, 'S004', 'Mumbai Central', 'Mumbai'),
(5, 'S005', 'Pune FC Road', 'Pune');

INSERT INTO dim_product (product_key, product_id, product_name, category) VALUES
(1, 'P001', 'Atta 10kg', 'Groceries'),
(2, 'P002', 'Biscuits', 'Groceries'),
(3, 'P003', 'Jacket', 'Clothing'),
(4, 'P004', 'Jeans', 'Clothing'),
(5, 'P005', 'Phone', 'Electronics'),
(6, 'P006', 'Smartwatch', 'Electronics'),
(7, 'P007', 'Speaker', 'Electronics'),
(8, 'P008', 'Tablet', 'Electronics');

-- Cleaned fact rows: mixed date formats standardized, missing store_city values backfilled from store_name, and category casing harmonized
INSERT INTO fact_sales (sales_key, transaction_id, date_key, store_key, product_key, units_sold, unit_price, sales_amount) VALUES
(1, 'TXN5000', 20230829, 2, 7, 3, 49262.78, 147788.34),
(2, 'TXN5001', 20231212, 2, 8, 11, 23226.12, 255487.32),
(3, 'TXN5002', 20230205, 2, 5, 20, 48703.39, 974067.80),
(4, 'TXN5003', 20230220, 3, 8, 14, 23226.12, 325165.68),
(5, 'TXN5004', 20230115, 2, 6, 10, 58851.01, 588510.10),
(6, 'TXN5005', 20230809, 1, 1, 12, 52464.00, 629568.00),
(7, 'TXN5006', 20230331, 5, 6, 6, 58851.01, 353106.06),
(8, 'TXN5007', 20231026, 5, 4, 16, 2317.47, 37079.52),
(9, 'TXN5008', 20231208, 1, 2, 9, 27469.99, 247229.91),
(10, 'TXN5009', 20230815, 1, 6, 3, 58851.01, 176553.03),
(11, 'TXN5010', 20230604, 2, 3, 15, 30187.24, 452808.60),
(12, 'TXN5011', 20231020, 4, 4, 13, 2317.47, 30127.11);