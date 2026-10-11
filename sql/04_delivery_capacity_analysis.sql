
-- Project: AutoParts Manufacturing Analytics
-- File: 04_delivery_capacity_analysis.sql
-- Purpose: Analyze delivery performance, backlog,
-- and planned volume against nominal capacity.

-- 1. Delivery performance
SELECT
    COUNT(*) AS total_orders,
    COUNT(*) FILTER (
        WHERE status = 'Delayed'
    ) AS delayed_orders,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE status = 'Delayed'
        ) / NULLIF(COUNT(*), 0), 2
    ) AS delay_rate_pct,
    ROUND(
        AVG(
            production_date - planned_date
        ) FILTER (
            WHERE status = 'Delayed'
              AND production_date IS NOT NULL
              AND planned_date IS NOT NULL
        ), 2
    ) AS average_delay_days,
    MAX(
        production_date - planned_date
    ) FILTER (
        WHERE status = 'Delayed'
      AND production_date IS NOT NULL
      AND planned_date IS NOT NULL
    ) AS maximum_delay_days
FROM production_orders;


-- 2. Backlog overview
SELECT
    COUNT(*) FILTER (
        WHERE status = 'Planned'
    ) AS backlog_orders,
    COALESCE(
        SUM(planned_qty) FILTER (
            WHERE status = 'Planned'
        ), 0
    ) AS backlog_quantity
FROM production_orders;


-- 3. Planned volume versus nominal capacity
-- Capacity utilization is meaningful at line-month level.
SELECT
    pl.plant,
    pl.line_name,
    DATE_TRUNC('month', po.planned_date)::date
        AS planned_month,
    COUNT(*) AS total_orders,
    COUNT(*) FILTER (
        WHERE po.status = 'Delayed'
    ) AS delayed_orders,
    SUM(po.planned_qty) AS planned_quantity,
    MAX(pl.monthly_capacity) AS nominal_monthly_capacity,
    ROUND(
        100.0 * SUM(po.planned_qty)
        / NULLIF(MAX(pl.monthly_capacity), 0), 2
    ) AS capacity_utilization_pct
FROM production_orders po
JOIN production_lines pl
    ON po.line_id = pl.line_id
WHERE po.planned_date IS NOT NULL
GROUP BY
    pl.plant,
    pl.line_id,
    pl.line_name,
    DATE_TRUNC('month', po.planned_date)::date
ORDER BY
    planned_month,
    pl.plant,
    pl.line_name;
