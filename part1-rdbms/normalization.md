## Anomaly Analysis
## 1.1 Answer
Insert Anomaly
In the current structure, a new product cannot be inserted independently because the table requires values for order_id, customer_id, and sales_rep_id.
This creates an insert anomaly, as product data is dependent on order existence.

Update Anomaly
Customer C001 appears in multiple rows (e.g: ORD1114, ORD1091, ORD1133).
If the customer’s email changes, it must be updated across all rows.
Failure to do so results in inconsistent data.

Delete Anomaly
Deleting the only order of a customer results in complete loss of customer information, indicating a delete anomaly.

## 1.3 Answer
A single table is simpler only at a very small scale or for read-only datasets. In this case, the dataset clearly demonstrates why normalization is necessary.

First, there are update anomalies. For example, customer 'C001' appears across multiple orders. If their email changes, it must be updated in every row. Missing even one row creates inconsistent data. The same issue applies to 'unit_price' for products and 'office_address' for sales reps—these values are duplicated across many records, increasing maintenance effort and risk of errors.

Second, there are insert anomalies. If the business wants to add a new product or register a new sales representative before any orders exist, it cannot do so without inserting dummy order data. This is inefficient and violates data integrity principles, as unrelated data becomes artificially linked.

Third, there are delete anomalies. If a product appears in only one order and that order is deleted, all information about the product (name, category, price) is lost. Similarly, deleting a customer’s only order removes all their details. This leads to unintended data loss.

Normalization resolves these issues by separating entities into logical tables (customers, products, orders, etc.), ensuring each piece of information is stored once and referenced via keys. While a single table may seem simpler initially, it becomes harder to maintain, scale, and trust over time.

Therefore, normalization is not over-engineering—it is essential for data consistency, integrity, and scalability.
