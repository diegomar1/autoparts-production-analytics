
-- Project: AutoParts Manufacturing Analytics
-- File: 03_quality_analysis.sql
-- Purpose: Evaluate defects by shift and product.

-- 1. Quality performance by shift
SELECT
    shift,
    SUM(produced_qty) AS produced_quantity,
    SUM(defective_qty) AS defective_quantity,
    ROUND(
        100.0 * SUM(defective_qty)
        / NULLIF(SUM(produced_qty), 0), 2
    ) AS defect_rate_pct,
    COUNT(*) FILTER (
        WHERE status = 'Delayed'
    ) AS delayed_orders
FROM production_orders
GROUP BY shift
ORDER BY defect_rate_pct DESC;


-- 2. Quality performance by product
SELECT
    p.product_name,
    SUM(po.produced_qty) AS produced_quantity,
    SUM(po.defective_qty) AS defective_quantity,
    SUM(po.produced_qty - po.defective_qty) AS good_quantity,
    ROUND(
        100.0 * SUM(po.defective_qty)
        / NULLIF(SUM(po.produced_qty), 0), 2
    ) AS defect_rate_pct
FROM production_orders po
JOIN products p
    ON po.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY defect_rate_pct DESC;


-- 3. Quality performance by product and shift
SELECT
    p.product_name,
    po.shift,
    SUM(po.produced_qty) AS produced_quantity,
    SUM(po.defective_qty) AS defective_quantity,
    ROUND(
        100.0 * SUM(po.defective_qty)
        / NULLIF(SUM(po.produced_qty), 0), 2
    ) AS defect_rate_pct
FROM production_orders po
JOIN products p
    ON po.product_id = p.product_id
GROUP BY p.product_id, p.product_name, po.shift
ORDER BY p.product_name, defect_rate_pct DESC;
