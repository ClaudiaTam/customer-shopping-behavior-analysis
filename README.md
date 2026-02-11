# Customer Shopping Behavior Analysis

## Tech Stack

- **Python (pandas)** for data cleaning, feature engineering, and preparation.   
- **BigQuery (SQL)** for scalable segmentation and revenue analysis.   
- **Power BI** for interactive dashboards and stakeholder-friendly visuals. 

---

## Executive Summary

Analyzed 3,900 retail transactions using Python, BigQuery, and Power BI to understand customer shopping behavior across products, segments, and locations.  The project identifies opportunities in subscriptions, discount strategy, merchandising, marketing, payment methods, and inventory to grow revenue and protect margins. 

---

## Business Problem

The business wanted to move from raw transaction data to clear, segment-level strategies that increase revenue and customer lifetime value.  Key questions included which customers, products, and behaviors drive the most value, and where revenue or margin is being lost (for example, heavy discounts, low subscription adoption, or inefficient marketing). 

---

## Dataset

- 3,900 transactions, 18 attributes per transaction.   
- Customer: Age, Gender, Location, Subscription Status.   
- Transaction: Item Purchased, Category, Purchase Amount, Season, Size, Color, Shipping Type, Payment Method.   
- Behavior: Discount Applied, Promo Code Used, Previous Purchases, Frequency of Purchases, Review Rating (37 missing values). 

---

## Data Preparation

- Loaded data into pandas and reviewed structure and distributions with `df.info()` and `.describe()`.   
- Imputed 37 missing Review Rating values using the median rating by product category.   
- Standardized column names to `snake_case` and engineered `age_group` and `purchase_frequency_days`.   
- Removed redundant `promo_code_used` and pushed the cleaned dataset to BigQuery for SQL analysis. 

---

## Analysis

### BigQuery SQL Insights

- Revenue by gender: Male revenue is 2.1x female revenue (157,890 vs 75,191), signaling an underdeveloped female segment.   
- Discounts: Key products (Hat, Sneakers, Coat, Sweater, Pants) rely on 47–50% discounts, which risks margin erosion.   
- Hero products: Highest-rated items (Gloves, Sandals, Boots) and category leaders (for example, Jewelry, Pants, Blouse, Sandals) show strong customer preference.   
- Shipping: Express users spend about 3.5% more on average than Standard users (60.48 vs 58.46).   
- Lifecycle segments: Loyal (3,116) and Returning (701) customers form the core base, yet many repeat buyers remain unsubscribed.   
- Geo and age: Locations like Alaska, Pennsylvania, and Arizona have the highest revenue per customer, with Young Adults leading total revenue.   
- Payment: High‑value customers contribute 30–37% of revenue across payment methods, with Debit Card, PayPal, and Venmo having the highest high‑value share. 


