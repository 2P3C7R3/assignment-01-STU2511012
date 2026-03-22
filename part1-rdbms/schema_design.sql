-- Customers Table
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id      VARCHAR(10) PRIMARY KEY,
    customer_name    VARCHAR(100) NOT NULL,
    customer_email   VARCHAR(100) NOT NULL UNIQUE,
    customer_city    VARCHAR(50) NOT NULL
);

-- Offices Table
DROP TABLE IF EXISTS offices;
CREATE TABLE offices (
    office_id        VARCHAR(10) PRIMARY KEY,
    office_name      VARCHAR(100) NOT NULL,
    office_address   VARCHAR(255) NOT NULL UNIQUE
);

-- Sales Representatives Table
DROP TABLE IF EXISTS sales_reps;
CREATE TABLE sales_reps (
    sales_rep_id     VARCHAR(10) PRIMARY KEY,
    sales_rep_name   VARCHAR(100) NOT NULL,
    sales_rep_email  VARCHAR(100) NOT NULL UNIQUE,
    office_id        VARCHAR(10) NOT NULL,
    CONSTRAINT fk_salesrep_office
        FOREIGN KEY (office_id) REFERENCES offices(office_id)
);

-- Products Table
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id       VARCHAR(10) PRIMARY KEY,
    product_name     VARCHAR(100) NOT NULL,
    category         VARCHAR(50) NOT NULL,
    unit_price       DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_unit_price CHECK (unit_price >= 0)
);

-- Orders Table
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id         VARCHAR(10) PRIMARY KEY,
    customer_id      VARCHAR(10) NOT NULL,
    sales_rep_id     VARCHAR(10) NOT NULL,
    order_date       DATE NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_salesrep
        FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Order Items Table
DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items (
    order_id         VARCHAR(10) NOT NULL,
    product_id       VARCHAR(10) NOT NULL,
    quantity         INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_orderitems_product
        FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT chk_quantity CHECK (quantity > 0)
);

-- Data Insertion for all tables
INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES
('C001', 'Rohan Mehta',  'rohan@gmail.com',  'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com',  'Delhi'),
('C003', 'Amit Verma',   'amit@gmail.com',   'Bangalore'),
('C004', 'Sneha Iyer',   'sneha@gmail.com',  'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

INSERT INTO offices (office_id, office_name, office_address) VALUES
('OF01', 'Mumbai HQ',   'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('OF02', 'Delhi Office','Delhi Office, Connaught Place, New Delhi - 110001'),
('OF03', 'South Zone',  'South Zone, MG Road, Bangalore - 560001'),
('OF04', 'Chennai Hub', 'Chennai Hub, Anna Salai, Chennai - 600002'),
('OF05', 'Hyderabad Hub','Hyderabad Hub, Banjara Hills, Hyderabad - 500034');

INSERT INTO sales_reps (sales_rep_id, sales_rep_name, sales_rep_email, office_id) VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'OF01'),
('SR02', 'Anita Desai',  'anita@corp.com',  'OF02'),
('SR03', 'Ravi Kumar',   'ravi@corp.com',   'OF03'),
('SR04', 'Meera Nair',   'meera@corp.com',  'OF04'),
('SR05', 'Karan Shah',   'karan@corp.com',  'OF05');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
('P001', 'Laptop',        'Electronics', 55000.00),
('P002', 'Mouse',         'Electronics',   800.00),
('P003', 'Desk Chair',    'Furniture',    8500.00),
('P004', 'Notebook',      'Stationery',    120.00),
('P005', 'Headphones',    'Electronics',  3200.00);

INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES
('ORD1027', 'C002', 'SR02', '2023-11-02'),
('ORD1114', 'C001', 'SR01', '2023-08-06'),
('ORD1132', 'C003', 'SR02', '2023-03-07'),
('ORD1075', 'C005', 'SR03', '2023-04-18'),
('ORD1091', 'C001', 'SR01', '2023-07-24');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
('ORD1027', 'P004', 3),
('ORD1114', 'P001', 1),
('ORD1132', 'P003', 2),
('ORD1075', 'P005', 1),
('ORD1091', 'P002', 4);