
-- Project: AutoParts Manufacturing Analytics
-- File: 02_production_performance.sql
-- Purpose: Analyze production performance and order status.

-- 1. Overall production KPIs
SELECT
    COUNT(*) AS total_orders,
    SUM(planned_qty) AS planned_quantity,
    SUM(produced_qty) AS produced_quantity,
    SUM(defective_qty) AS defective_quantity,
    SUM(produced_qty - defective_qty) AS good_quantity,
    ROUND(
        100.0 * SUM(produced_qty)
        / NULLIF(SUM(planned_qty), 0), 2
    ) AS achievement_pct,
    ROUND(
        100.0 * SUM(defective_qty)
        / NULLIF(SUM(produced_qty), 0), 2
    ) AS defect_rate_pct,
    ROUND(
        100.0 * SUM(produced_qty - defective_qty)
        / NULLIF(SUM(produced_qty), 0), 2
    ) AS yield_pct
FROM production_orders;


-- 2. Production performance by order status
SELECT
    status,
    COUNT(*) AS total_orders,
    SUM(planned_qty) AS planned_quantity,
    SUM(produced_qty) AS produced_quantity,
    SUM(defective_qty) AS defective_quantity,
    ROUND(
        100.0 * SUM(produced_qty)
        / NULLIF(SUM(planned_qty), 0), 2
    ) AS achievement_pct
FROM production_orders
GROUP BY status
ORDER BY total_orders DESC;


-- 3. Achievement for executed orders only
SELECT
    COUNT(*) AS executed_orders,
    SUM(planned_qty) AS planned_quantity,
    SUM(produced_qty) AS produced_quantity,
    ROUND(
        100.0 * SUM(produced_qty)
        / NULLIF(SUM(planned_qty), 0), 2
    ) AS realized_achievement_pct
FROM production_orders
WHERE status IN ('Completed', 'Delayed');
