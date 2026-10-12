# AutoParts Manufacturing — Production & Operations Analytics

A portfolio project analyzing a fictional automotive-parts manufacturer using **PostgreSQL, SQL, and Power BI**. The project explores production performance, capacity planning, product quality, and delivery reliability, translating operational data into KPIs and practical recommendations.

> **Dataset notice:** All records are synthetic and created for demonstration. Findings illustrate the analysis workflow and should not be interpreted as evidence about a real company.

## Dashboard Preview

### 1. Executive Overview
![Executive Overview](images/1-executive-overview.png)

### 2. Production & Capacity
![Production & Capacity](images/2-production-capacity.png)

### 3. Quality & Delivery
![Quality & Delivery](images/3-quality-delivery.png)

### 4. Insights & Recommendations
![Insights & Recommendations](images/4-insights-recommendations.png)

## Business Questions

- How does actual production compare with planned quantities?
- Which production lines and periods show potential capacity pressure?
- How do defect rates vary by shift and product?
- How many orders are delayed, and where should backlog reviews begin?
- Which operational indicators can support continuous improvement?

## Tools & Technologies

- **PostgreSQL** — relational data storage and querying
- **SQL** — data quality checks, KPI calculations, production and quality analysis
- **Power BI Desktop** — interactive dashboard and visual storytelling
- **DAX** — measures and KPI calculations
- **Data modeling** — relationships between orders, products, production lines, and calendar data

## Dataset

The project includes four CSV files in [the data folder](data/):

| File | Description |
|---|---|
| production_orders.csv | 4,000 production orders, quantities, dates, status, shift, and operational attributes |
| products.csv | Product reference data and pricing fields |
| production_lines.csv | Plant, production line, product category, and nominal monthly capacity |
| calendar.csv | Calendar dimension covering 2025–2026 |

The production orders have order dates from **January 2025 through September 2026**. The calendar dimension covers **January 2025 through December 2026**.

## Key Findings

- **Production achievement:** 86.68% across all orders, including orders that remain planned.
- **Realized achievement:** 96.05% when considering completed and delayed orders.
- **Delayed orders:** 774, representing 19.35% of all 4,000 orders.
- **Quality:** an overall defect rate of 1.81%.
- **Shift analysis:** Shift 3 has a defect rate of 2.65%, compared with approximately 1.4% for Shifts 1 and 2.
- **Capacity planning:** the analysis flags line-month combinations where planned volume exceeds nominal monthly capacity for further review.

These results describe patterns in synthetic data. They do not establish the underlying causes of delays, defects, or capacity constraints.

## Dashboard Pages

1. **Executive Overview** — production, achievement, delays, defects, and backlog KPIs.
2. **Production & Capacity** — planned versus produced quantities, monthly trends, and nominal capacity utilization.
3. **Quality & Delivery** — defect analysis by shift and product, delayed orders, and backlog.
4. **Insights & Recommendations** — operational findings, suggested actions, and success metrics.

## SQL Analysis

The [sql folder](sql/) contains the project queries:

- [Data quality checks](sql/01_data_quality_checks.sql)
- [Production performance](sql/02_production_performance.sql)
- [Quality analysis](sql/03_quality_analysis.sql)
- [Delivery and capacity analysis](sql/04_delivery_capacity_analysis.sql)

## How to Explore the Project

1. Clone or download this repository.
2. Import the CSV files in the data folder into PostgreSQL, preserving the column names from the headers.
3. Run the SQL scripts in the sql folder to explore data quality and operational KPIs.
4. Open the [Power BI report](powerbi/Production%20and%20Operations%20Analytics.pbix) in Power BI Desktop to explore the dashboard. If prompted, reconnect the data sources to your local PostgreSQL database or update the source paths as needed.

## Recommendations

- Investigate quality differences across shifts and products before assigning root causes.
- Review schedules for line-month combinations with planned volumes above nominal capacity.
- Prioritize delayed orders and investigate recurring scheduling constraints.
- Segment backlog by due date, priority, product, and production line.
- Monitor operational KPIs regularly to support continuous improvement.

## Limitations

This is a synthetic-data portfolio project. Capacity utilization compares planned volume with nominal monthly capacity; values above 100% are a signal to investigate planning assumptions and schedules, not proof that actual production exceeded physical capacity.

## Repository Structure

```text
.
├── data/       # Synthetic CSV datasets and data notes
├── images/     # Dashboard screenshots
├── powerbi/    # Power BI report
├── sql/        # SQL analysis scripts
└── README.md
```

## Author

**Data Analytics Portfolio Project**  
Focus areas: manufacturing operations, production planning (PCP), ERP data, KPI reporting, and process improvement.
