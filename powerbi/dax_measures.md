# Suggested DAX Measures

```DAX
Total Cloud Cost =
SUM(Resources[monthly_cost_gbp])

Estimated Monthly Savings =
SUM(Resources[estimated_monthly_savings_gbp])

Potential Annual Savings =
SUM(Resources[potential_annual_savings_gbp])

Savings Opportunity % =
DIVIDE(
    [Estimated Monthly Savings],
    [Total Cloud Cost]
)

Idle VM Candidates =
CALCULATE(
    COUNTROWS(Resources),
    Resources[is_idle_candidate] = 1
)

Cost Anomalies =
CALCULATE(
    COUNTROWS(Resources),
    Resources[cost_anomaly] = 1
)

Tagging Gaps =
CALCULATE(
    COUNTROWS(Resources),
    Resources[tag_compliant] = 0
)

Resources Requiring Action =
CALCULATE(
    COUNTROWS(Resources),
    Resources[recommendation] <> "No immediate action"
)
```
