# E-Commerce Sales Funnel & Marketing Channel Optimization (SQL)

## Project Overview
This project simulates a real-world business scenario analyzing e-commerce user event data to optimize a digital sales funnel. Utilizing **Google BigQuery**, I tracked user behavior across a 5-stage funnel over a rolling 30-day window to identify critical conversion drop-offs, evaluate marketing traffic acquisition channel efficiency, map user velocity, and derive baseline financial KPIs (AOV, Revenue per Buyer).

The objective is to move beyond running raw SQL syntax and translate quantitative query outputs into distinct, actionable strategic recommendations for cross-functional stakeholders in **UX/Product, Marketing, and Finance**.

---

## Business Problem & Funnel Definition
The business is looking to maximize conversion efficiency and audit marketing spending. To evaluate the health of the store, the user path was mapped across 5 core event stages:
$$\text{Page View} \longrightarrow \text{Add to Cart} \longrightarrow \text{Checkout Start} \longrightarrow \text{Payment Info} \longrightarrow \text{Purchase}$$

---

## Tech Stack & Directory Structure
*   **Database Engine:** Google BigQuery (SQL)
*   **Development Workspace:** VS Code & Git/GitHub

```text
ecommerce-sales-funnel-analysis/
├── data/
│   └── raw/                           # Raw e-commerce CSV events (Ignored via .gitignore)
├── sql/
│   ├── 1_funnel_stages_count.sql      # User volume counts per stage
│   ├── 2_conversion_rates.sql         # Drop-off & conversion metrics
│   ├── 3_marketing_channel_funnel.sql # Traffic source performance breakdown
│   ├── 4_time_to_conversion.sql       # User velocity calculation (TIMESTAMP_DIFF)
│   └── 5_revenue_financial_metrics.sql# Financial KPIs (Revenue, Orders, AOV)
├── docs/
│   ├── business_recommendations.md    # Formatted stakeholder brief
│   └── project_overview.md            # Detailed schema documentation
└── README.md                          # Project presentation page