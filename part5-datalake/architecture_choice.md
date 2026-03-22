# Architecture Choice

## Architecture Recommendation

I would recommend a 'Data Lakehouse' for this food delivery startup.

First, the startup is collecting multiple data types that do not fit neatly into a traditional warehouse alone: structured payment transactions, semi-structured GPS logs, unstructured customer reviews, and image files for restaurant menus. A plain data warehouse is excellent for cleaned, tabular analytics, but it is not the best landing zone for raw text, logs, and images. A data lakehouse can store all of these formats in one architecture while still supporting SQL analytics.

Second, the business is fast-growing, which means both scale and flexibility matter. GPS logs and review data can grow very quickly, and schema requirements will likely keep changing as the product evolves. A lakehouse gives the low-cost, scalable storage benefits of a data lake while also providing stronger structure and governance than a raw lake.

Third, the company will need both BI reporting and AI/ML use cases. Finance and ops teams may want dashboard-ready metrics like delivery time, refund rate, or restaurant performance. At the same time, the startup may want machine learning on review sentiment, route optimization from GPS traces, or image analysis on menu photos. A lakehouse supports both analytical SQL workloads and downstream data science better than choosing only a warehouse or only a lake.

Finally, a lakehouse helps reduce duplication by keeping raw and refined data in the same ecosystem. That makes it easier to manage pipelines, governance, and access as the company matures. In this case, it gives the best balance of flexibility, performance, and future readiness.
