# Interview Case Study

## Situation
Cloud spend can grow faster than expected when teams lack visibility into utilisation, ownership and waste.

## Task
Build a portfolio analytics workflow combining cost and operational usage data to identify optimisation opportunities.

## Action
- Created a synthetic AWS/Azure billing and utilisation dataset.
- Added CPU, memory, storage utilisation, uptime, tagging and commitment-coverage fields.
- Created right-sizing, idle-resource, anomaly and governance rules.
- Estimated savings using transparent portfolio assumptions.
- Wrote SQL for cost, savings, anomalies and tagging analysis.
- Prepared Power BI pages for executive cost, right-sizing, storage/network and governance.
- Documented the limitations of synthetic savings estimates.

## Result
Produced a reproducible FinOps-style analytics project showing how cloud engineering, data analysis and BI can be combined to support cost decisions.

## Interview Talking Points
1. Why low CPU alone is not enough to downsize a server.
2. How memory, latency and business criticality affect right-sizing.
3. Reserved Instances / Savings Plans vs Azure Reservations.
4. Cost allocation and tagging.
5. Why NAT Gateway can become expensive.
6. Cost anomaly detection.
7. Difference between savings estimate and guaranteed saving.
8. How AWS Compute Optimizer / Azure Advisor could improve the model.
9. How finance and engineering should collaborate in FinOps.
10. How you would automate the data pipeline in production.
