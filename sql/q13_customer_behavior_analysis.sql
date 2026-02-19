-- Q13. For each payment_method, what share of total revenue comes from high‑value customers (top 20% by total spend) compared to other customers?

-- 1) Total spend per customer
WITH customer_spend AS (
  SELECT
    customer_id,
    SUM(purchase_amount) AS total_spend
  FROM `your project id`
  GROUP BY customer_id
),

-- 2) Get 80th percentile threshold
spend_with_p80 AS (
  SELECT
    customer_id,
    total_spend,
    PERCENTILE_CONT(total_spend, 0.8) OVER () AS p80_spend
  FROM customer_spend
),

-- 3) Label customers
labeled_customers AS (
  SELECT
    customer_id,
    CASE
      WHEN total_spend >= p80_spend THEN 'High Value'
      ELSE 'Other'
    END AS customer_segment
  FROM spend_with_p80
)

-- 4) Revenue share by payment_method and segment
SELECT
  payment_method,
  customer_segment,
  SUM(purchase_amount) AS segment_revenue,
  SUM(SUM(purchase_amount)) OVER (PARTITION BY payment_method) AS total_revenue_payment_method,
  SAFE_DIVIDE(
    SUM(purchase_amount),
    SUM(SUM(purchase_amount)) OVER (PARTITION BY payment_method)
  ) AS revenue_share_within_payment_method
FROM `your project id` cb
JOIN labeled_customers lc
  ON cb.customer_id = lc.customer_id
GROUP BY payment_method, customer_segment
ORDER BY payment_method, customer_segment;

