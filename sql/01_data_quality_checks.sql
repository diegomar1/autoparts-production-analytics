
-- Project: AutoParts Manufacturing Analytics
-- File: 01_data_quality_checks.sql
-- Purpose: Validate dataset completeness and consistency.

-- 1. Dataset overview
SELECT
    COUNT(*) AS total_orders,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    COUNT(*) FILTER (
        WHERE order_date IS NULL
    ) AS missing_order_dates,
    COUNT(*) FILTER (
        WHERE product_id IS NULL
           OR line_id IS NULL
           OR status IS NULL
    ) AS incomplete_orders
FROM production_orders;


-- 2. Check missing and invalid quantities
SELECT
    COUNT(*) FILTER (
        WHERE planned_qty IS NULL
    ) AS missing_planned_qty,
    COUNT(*) FILTER (
        WHERE produced_qty IS NULL
    ) AS missing_produced_qty,
    COUNT(*) FILTER (
        WHERE defective_qty IS NULL
    ) AS missing_defective_qty,
    COUNT(*) FILTER (
        WHERE planned_qty < 0
           OR produced_qty < 0
           OR defective_qty < 0
    ) AS negative_quantity_records,
    COUNT(*) FILTER (
        WHERE defective_qty > produced_qty
    ) AS defects_exceeding_production
FROM production_orders;


-- 3. Check date consistency
SELECT
    COUNT(*) FILTER (
        WHERE production_date < order_date
    ) AS production_before_order,
    COUNT(*) FILTER (
        WHERE production_date IS NOT NULL
          AND planned_date IS NOT NULL
          AND production_date < planned_date
    ) AS production_before_planned_date
FROM production_orders;
