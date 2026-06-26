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

### Phase 2: Data Visualization & Insights (Google Sheets)
After exporting the structured data from SQL, the data was processed in Google Sheets to simulate an executive-level presentation.
* Built dynamic Cohort Retention Matrices showing the % of retained users month-over-month.
* Applied **Conditional Formatting (Heatmaps)** to easily identify sharp drops in retention.
* Segmented the retention tables by user acquisition channels and promo statuses to evaluate campaign efficiency.

---

## Key Business Insights

* **Organic Cohorts Outperform Promo in Volume & Retention:** During the analyzed period, organic traffic channels not only attracted a larger volume of users but also demonstrated significantly higher loyalty. Organic users show a remarkably stable Retention Rate, staying above **73% in Month 1** and maintaining at least **74% by Month 3**.
* **The March Peak Anomalies:** The March organic cohort deserves special attention, as its retention reached an outstanding **94%**. This indicates either a highly successful product update, strong seasonal demand, or an exceptionally high-quality audience segment that requires deeper behavioral analysis.
* **Promo Campaigns Accumulate "One-Time" Users:** In contrast, users acquired through discounts and promotional campaigns show poor engagement. Their retention drops sharply immediately within the first few months. This pattern suggests a high customer acquisition cost (CAC) for low-value users who churn immediately after consuming the promo offer.
* **Strategic Business Recommendations:** From a business perspective, organic users are currently the primary growth driver—they cost nothing to acquire and remain active significantly longer. Management should urgently review the current paid marketing strategy and promo mechanics, as they are currently acquiring low-retention segments and burning marketing budget.

---

##  How to Review This Project

1. **SQL Source Code:** Check the [cohort_retention_query.sql](Code/cohort_retention_query.sql) file to see the exact queries used for cohort grouping and date handling.
2. **Interactive Google Sheet:** You can view the final interactive dashboards and cohort tables here: (https://docs.google.com/spreadsheets/d/1LYdVrzwpGVagOAAXMXG5ilEShlRp756Ec3iMuFyfMkA/edit?usp=sharing)

---
