# Architecture

```text
Synthetic AWS / Azure Billing + Utilisation
                    |
                    v
          Python Data Preparation
                    |
                    v
          Optimisation Rules Engine
           /        |         \
          v         v          v
       SQL       Power BI    Savings Queue
          \         |          /
           +--------+----------+
                    |
                    v
          FinOps / Cloud Decisions
```

## Production Adaptation

Real data could come from:
- AWS Cost Explorer / CUR
- AWS CloudWatch
- AWS Compute Optimizer
- Azure Cost Management
- Azure Monitor
- Azure Advisor
- CMDB / tagging inventory
- Finance / budget systems

This portfolio does not claim live production integration with those services.
