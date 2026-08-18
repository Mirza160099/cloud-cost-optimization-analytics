-- Cloud Cost Optimisation Analytics

-- 1. Executive cost and savings KPIs
SELECT
    ROUND(SUM(monthly_cost_gbp),2) AS total_cost_gbp,
    ROUND(SUM(estimated_monthly_savings_gbp),2) AS est_monthly_savings_gbp,
    ROUND(SUM(potential_annual_savings_gbp),2) AS potential_annual_savings_gbp
FROM cloud_cost_usage;

-- 2. Cost by provider
SELECT provider,
       ROUND(SUM(monthly_cost_gbp),2) AS total_cost_gbp,
       ROUND(SUM(estimated_monthly_savings_gbp),2) AS estimated_savings_gbp
FROM cloud_cost_usage
GROUP BY provider
ORDER BY total_cost_gbp DESC;

-- 3. Top right-sizing opportunities
SELECT provider, resource_id, service, environment,
       cpu_avg_pct, memory_avg_pct,
       monthly_cost_gbp, recommendation,
       estimated_monthly_savings_gbp
FROM cloud_cost_usage
WHERE recommendation LIKE 'Right-size%'
ORDER BY estimated_monthly_savings_gbp DESC;

-- 4. Idle compute
SELECT provider, resource_id, environment, owner_team,
       cpu_avg_pct, memory_avg_pct, uptime_pct, monthly_cost_gbp
FROM cloud_cost_usage
WHERE is_idle_candidate = 1
ORDER BY monthly_cost_gbp DESC;

-- 5. Cost anomalies
SELECT month, provider, resource_id, service,
       monthly_cost_gbp, owner_team
FROM cloud_cost_usage
WHERE cost_anomaly = 1
ORDER BY monthly_cost_gbp DESC;

-- 6. Tagging gaps
SELECT provider, owner_team, COUNT(*) AS untagged_resources,
       ROUND(SUM(monthly_cost_gbp),2) AS unallocated_cost_gbp
FROM cloud_cost_usage
WHERE tag_compliant = 0
GROUP BY provider, owner_team
ORDER BY unallocated_cost_gbp DESC;

-- 7. Cost by environment
SELECT environment,
       ROUND(SUM(monthly_cost_gbp),2) AS total_cost_gbp,
       ROUND(SUM(estimated_monthly_savings_gbp),2) AS savings_gbp
FROM cloud_cost_usage
GROUP BY environment
ORDER BY total_cost_gbp DESC;

-- 8. Commitment discount coverage candidates
SELECT provider, resource_id, service, environment,
       reserved_coverage_pct, monthly_cost_gbp
FROM cloud_cost_usage
WHERE recommendation = 'Review commitment discount coverage'
ORDER BY monthly_cost_gbp DESC;
