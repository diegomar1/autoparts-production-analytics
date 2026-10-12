# Dataset

This folder contains the synthetic dataset used in the AutoParts Manufacturing Production & Operations Analytics project.

## Tables

Export the following PostgreSQL tables as UTF-8 CSV files:

- `production_orders.csv` — 4,000 production orders and operational measures.
- `products.csv` — product reference data.
- `production_lines.csv` — plant, production-line, and nominal monthly-capacity data.
- `calendar.csv` — calendar dimension used for time-based analysis.

## Data disclaimer

All records are fictional and were created for portfolio and demonstration purposes. They do not describe a real company or its operations.

## How to use

Import the CSV files into PostgreSQL using the table schemas documented in the project's SQL scripts, then run the SQL analyses in the `sql/` folder. The Power BI report may need its data-source settings updated to point to your local PostgreSQL database.

## Export notes

Export the existing tables from the project database rather than generating new records, so the CSV files remain consistent with the published dashboard and SQL results. Save files as UTF-8 CSV with headers, and do not include database credentials or connection secrets.