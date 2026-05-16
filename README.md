# Cohort Analysis & Retention Rate Project (SQL + Tableau)

## Project Overview
This project focuses on performing a comprehensive **Cohort Analysis** to evaluate user retention patterns. The analysis is built on a dataset with "raw" and challenging datetime formats, requiring advanced text parsing and cleaning at the database level before visualization.

## Technical Stack
* **SQL (PostgreSQL):** Advanced text parsing, CTEs (`WITH` clauses), date transformation, and calculating cohort offsets.
* **Tableau:** Interactive Dashboard showcasing Cohort Heatmaps and Promo vs. Non-Promo behavior.

## SQL Highlights: Handling "Dirty" Data
The core strength of the data preparation lies in standardizing inconsistent date string formats (handling variations with dots, slashes, and truncated years) before performing analytical calculations:
* Used `split_part` and `replace` to isolate day, month, and year components.
* Implemented `make_date` dynamically based on year length (handling 2-digit vs 4-digit years).
* Calculated precise dynamic `month_offset` using `extract(year from age(...)) * 12 + extract(month from age(...))`.

