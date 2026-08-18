import pandas as pd

df = pd.read_csv("data/processed/cloud_cost_optimization_powerbi_ready.csv")

print("=== CLOUD COST OPTIMISATION SUMMARY ===")
print("Total cost: £", round(df["monthly_cost_gbp"].sum(), 2))
print("Estimated monthly savings: £", round(df["estimated_monthly_savings_gbp"].sum(), 2))
print("Potential annual savings: £", round(df["potential_annual_savings_gbp"].sum(), 2))
print("Idle VM candidates:", int(df["is_idle_candidate"].sum()))
print("Cost anomalies:", int(df["cost_anomaly"].sum()))
print("Tagging gaps:", int((df["tag_compliant"] == 0).sum()))

print("\nTop savings opportunities:")
cols = [
    "provider","resource_id","service","environment",
    "monthly_cost_gbp","recommendation","estimated_monthly_savings_gbp"
]
print(
    df[df["estimated_monthly_savings_gbp"] > 0]
    .sort_values("estimated_monthly_savings_gbp", ascending=False)[cols]
    .head(15)
    .to_string(index=False)
)

print("\nCost by provider:")
print(df.groupby("provider")["monthly_cost_gbp"].sum().round(2))

print("\nCost by environment:")
print(df.groupby("environment")["monthly_cost_gbp"].sum().round(2))
