# User Retention Rate & Cohort Analysis Case Study
### Investigating the Impact of Promo Status on Customer Lifecycle Using SQL & Google Sheets

---

##  Business Context & Problem Statement
In any customer-centric business or e-commerce platform, acquiring new users (Customer Acquisition Cost - CAC) is significantly more expensive than retaining existing ones. Therefore, understanding customer loyalty and maximizing Customer Lifetime Value (LTV) is crucial for sustainable growth.

**The goal of this project** is to evaluate user retention patterns using **Cohort Analysis**. Specifically, the objective is to analyze how different marketing and operational factors—such as **Promo Status** (users who joined via promotions vs. organic users) and acquisition channels—affect user retention over their first few months in the product. These insights will help the management team optimize marketing budgets and refine user re-engagement strategies.

---

##  Tech Stack & Tools Used
* **SQL (PostgreSQL):** For data extraction, cleaning, date formatting, and data transformation (cohort building).
* **Google Sheets:** For advanced data visualization, conditional formatting, and creating interactive dynamic cohort retention tables.

---

##  Project Structure & Workflow

### Phase 1: Data Extraction & Transformation (SQL)
The initial phase focused on querying the main database to structure raw user activity data into a format suitable for cohort analysis. 
* Identified user registration dates and grouped them into monthly start cohorts.
* Developed custom SQL logic (using date functions and regular/custom expressions) to normalize and convert timestamp formats into consistent monthly periods.
* Aggregated the total number of active users per cohort, segmented by month and **Promo Status**.
* *The complete SQL script can be found in the `/sql` directory of this repository.*

### Phase 2: Data Visualization & Insights (Google Sheets)
After exporting the structured data from SQL, the data was processed in Google Sheets to simulate an executive-level presentation.
* Built dynamic Cohort Retention Matrices showing the % of retained users month-over-month.
* Applied **Conditional Formatting (Heatmaps)** to easily identify sharp drops in retention.
* Segmented the retention tables by user acquisition channels and promo statuses to evaluate campaign efficiency.

---

##  Key Business Insights (Samples - Update with your findings!)
* **Promo vs. Organic Retention:** Users acquired via promo campaigns show a high initial conversion rate but experience a [X]% sharper drop in Month 2 compared to organic users. This indicates a potential "one-time buyer" issue that needs targeted re-engagement.
* **Critical Drop-off Point:** Across all cohorts, the biggest drop-off happens between **Month 1 and Month 2** (averaging a [X]% decline). Retaining users past Month 2 stabilizes their long-term lifecycle.
* **Top Performing Channels:** Acquisition Channel [Name, e.g., Paid Ads/Referral] yielded cohorts with the highest long-term retention stability.

---

##  How to Review This Project

1. **SQL Source Code:** Check the [`cohort_retention_query.sql`](./sql/your_script_name.sql) file to see the exact queries used for cohort grouping and date handling.
2. **Interactive Google Sheet:** You can view the final interactive dashboards and cohort tables here: [👉 Link to your Google Sheets Document] *(Make sure the link sharing is set to "Anyone with the link can view")*

---
