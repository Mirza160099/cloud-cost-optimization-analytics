# Methodology

## Objective

Identify waste, right-sizing opportunities, cost anomalies, governance gaps and estimated savings.

## Portfolio Logic

### Compute Right-Sizing
- Very low CPU + memory: aggressive right-sizing / stop schedule candidate.
- Moderate underutilisation: one-tier right-sizing candidate.
- Production compute with low commitment coverage: review reserved/commitment pricing.

### Storage
- Low utilisation: review unattached/underused storage.
- Low object-storage utilisation: lifecycle / tiering candidate.

### Network Services
- NAT Gateway and Load Balancer outliers are surfaced for architecture review.

### Governance
- Missing cost-allocation tags are flagged.
- Cost anomalies are surfaced for investigation.

## Savings Estimates

Savings percentages are demonstration assumptions only. They are not claims of guaranteed AWS/Azure savings and should be replaced with provider recommendations and validated pricing in a production environment.
