# Cohort Analysis & User Retention Project (SQL + Tableau)

## 📌 Project Overview
This project focuses on performing a comprehensive **Cohort Analysis** to evaluate user retention patterns over time. The analysis is built on a raw dataset with highly inconsistent datetime formats, requiring advanced text parsing and conditioning at the database level before visualization. 

The final dashboard is designed to deliver clean, professional, and easily scannable business insights.

## 🛠️ Technical Stack & Skills
* **SQL (PostgreSQL):** Common Table Expressions (CTEs), advanced text parsing, dynamic conditional logic (`CASE WHEN`), type casting, and cohort offset calculations.
* **Tableau:** Data visualization, interactive filtering, and dynamic Cohort Heatmaps.
* **Data Cleansing:** Standardizing unstructured date formats.

## 🗂️ Project Structure
* `project_sql_lisova.sql` — Production-ready SQL script with data cleaning and aggregation logic.
* `README.md` — Project documentation and business summary.

## 🚀 SQL Highlights: Handling "Dirty" Data
The core strength of the data preparation phase lies in standardizing inconsistent date string formats (handling variations with dots, slashes, and truncated 2-digit years) before executing any analytical functions:
* Used `split_part`, `replace`, and `trim` to cleanly isolate day, month, and year components.
* Implemented dynamic `make_date` inside conditional statements to safely handle both 2-digit (`YY + 2000`) and 4-digit (`YYYY`) years.
* Calculated precise dynamic `month_offset` using: 
  `extract(year from age(...)) * 12 + extract(month from age(...))`

## 📊 Tableau Visualization
The aggregated data is visualized using a custom-tailored dashboard, featuring:
* **Cohort Retention Heatmap:** Tracking user activity month-by-month.
* **Segment Breakdown:** Quick toggle via `promo_signup_flag` to compare behavior between organic users and promo-acquired campaigns.

## 📊 Business Insights & Project Execution

### 🚀 Technical Implementation
* **Data Pipelines & Modeling:** Engineered complex SQL queries to clean raw transaction logs, define specific user cohorts, and calculate precise dynamic time offsets (`month_offset`).
* **Metrics & Analytics:** Built automated calculation models for **Retention Rate (%)** and monitored lifecycle decay curves.
* **Visualization:** Developed a dark-themed interactive dashboard in Tableau Public, incorporating dynamic filters (`promo_signup_flag`) to isolate organic traffic from marketing campaigns.

### 💡 Key Findings (Data Insights)
* **The Promo Trap (Promo vs. Organic):** Users acquired through promotional campaigns (`promo_signup_flag = 1`) show a strong initial spike in Month 1 but experience a **15% steeper churn rate** by Month 3 compared to organic signups. 
  * *Business Action:* Marketing should optimize spending; attracting "discount hunters" is hurting long-term LTV.
* **The March Anomaly:** The March 2026 cohort revealed an unexpected **2.4% retention bump** in Month 2 (May), breaking the natural downward trend. 
  * *Business Action:* Investigation mapped this to a specific push-notification reactivation campaign. Recommendation: Scale this campaign framework to other fading cohorts.
  * ### 📊 Interactive Dashboard
You can explore the live interactive dashboard here: 
👉 [Live Interactive Tableau Dashboard]https://public.tableau.com/app/profile/olena.lisova/viz/OnlineRetailCohortAnalysisDashboard/Dashboard1
