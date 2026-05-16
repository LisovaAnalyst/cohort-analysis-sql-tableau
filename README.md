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

## 💡 Key Business Insights & Proposals
*(To be filled dynamically after we complete the dashboard and look at the exact numbers! We will define actionable proposals here regarding how user acquisition strategy should be optimized based on the retention curves).*
