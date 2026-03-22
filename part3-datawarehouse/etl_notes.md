# ETL Notes

## ETL Decisions

### Decision 1 — Standardized mixed date formats
Problem: The raw 'date' column used multiple formats in the same file, including values like '29/08/2023', '12-12-2023', and '2023-02-05'. Without standardization, date joins and month-based reporting would be unreliable.
Resolution: Parsing all source dates into a standard format ('YYYY-MM-DD') before loading them into 'dim_date'.

### Decision 2 — Filled missing store city values
Problem: The raw dataset contained NULL values in 'store_city' even though each 'store_name' clearly maps to a single city. For example, stores such as 'Chennai Anna', 'Bangalore MG', and 'Mumbai Central' have consistent city identities across the file.
Resolution: Backfilling missing 'store_city' values using the non-null city already associated with the same 'store_name'. This preserves dimensional completeness without inventing new values and allows 'dim_store' to be loaded with 'NOT NULL' city values.

### Decision 3 — Harmonized inconsistent category labels
Problem: Category values were inconsistent, with variants such as 'electronics' and 'Electronics', and both 'Grocery' and 'Groceries'. If loaded as-is, BI reports would split revenue across duplicate category labels.
Resolution: Standardizing category names before loading, 'dim_product': 'electronics' converted to 'Electronics' and both 'Grocery' and 'Groceries' unified under 'Groceries'. This ensures category-level aggregations are accurate and business-friendly.
