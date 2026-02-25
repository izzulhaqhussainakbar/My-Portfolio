# 🚚 Retail Sales Analysis

## Background
This project analyzes the sales performance of a retail business across three product categories: Beauty, Clothing, and Electronics. 

The objective of this analysis is to evaluate overall sales performance by assessing sales stability, transaction behavior, product mix, and customer demand patterns.

## Dataset Summary

- Dataset source: [Kaggle](https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset)
- Number of records: 1,000 transactions
- Time period: 2023–2024 

**Variables:**
- Transaction ID
- Date
- Customer ID
- Gender
- Age
- Product Category
- Quantity
- Price per Unit
- Total Amount

**Limitations:** 
- No repeat customers, no product price tiers.
- Analysis focuses on 2023 due to incomplete 2024 data.

## Data Preparation

SQL query: [Data Preparation](https://github.com/izzulhaqhussainakbar/My-Portfolio/blob/456b0ab5edf3a818918a3f78004fd5acd25b6931/Case-Study-001/Queries/Data_Preparation.sql)

Data quality checks were performed.
- Duplicate detection
- Missing value checks
- Data anomalies for categorical and numerical columns
- Outlier inspection for quantitative fields
- Verification of Total Amount calculations

No significant data quality issues were identified.

## Key Results
- Total sales in 2023 exhibit **high fluctuation**, with performance heavily dependent on a small number of peak months.
- **March and September** represent the lowest-performing months.
- Sales downturns are driven by a **simultaneous decline in transaction volume and average order value (AOV)**.
- Electronics is the primary driver of total sales fluctuation.
- Customers aged **45 and above** represent the core transaction segment and significantly influence overall sales performance.
- Low-performing months indicate a **shift in product demand toward lower-priced purchases**.

## Actionable Insights
- A simultaneous decline in transaction volume and average order value can serve as an early warning signal of a broader sales downturn and **should be consistently monitored** in future reporting.
- Given the limited one-year observation period, clear seasonal patterns in transaction volume and AOV **cannot yet be established**. Therefore, sales performance should be interpreted alongside internal and external factors,such as promotional activities, pricing adjustments, and consumer feedback to better contextualize short-term fluctuations.
- Sales performance shows a strong dependency on **consumers aged 45 and over**. Monitoring changes in purchasing behavior within this segment is critical, while gradual diversification toward other age groups may help mitigate dependency risk over time.

## Exploratory Data Analysis

SQL query: [Exploratory Data Analysis](https://github.com/izzulhaqhussainakbar/My-Portfolio/blob/456b0ab5edf3a818918a3f78004fd5acd25b6931/Case-Study-001/Queries/Exploratory_Data_Analysis.sql)

### 1. Total Sales Trend

<img src="https://github.com/izzulhaqhussainakbar/My-Portfolio/blob/456b0ab5edf3a818918a3f78004fd5acd25b6931/Case-Study-001/Images/Total_Sales_Trend.jpg" width="600" height="300">

Total sales throughout 2023 show noticeable fluctuations. 

March and September record the lowest sales levels, indicating periods of weakened performance rather than a stable total sales pattern.

### 2. Transaction Volume & Average Order Value

<img src="https://github.com/izzulhaqhussainakbar/My-Portfolio/blob/456b0ab5edf3a818918a3f78004fd5acd25b6931/Case-Study-001/Images/Transaction_Volume_AOV.jpg" width="600" height="600">

To diagnose the decline in total sales, transaction volume and average order value were examined.

Both metrics declined in March and September compared to previous month, indicating fewer purchasing customers and lower spending per transaction.

This suggests reduced purchase intent and smaller basket sizes during these periods.

### 3. Customer Segmentation: Gender & Age Group

<img src="https://github.com/izzulhaqhussainakbar/My-Portfolio/blob/456b0ab5edf3a818918a3f78004fd5acd25b6931/Case-Study-001/Images/Gender_Age_Group.jpg" width="600" height="600">

Gender-based analysis shows relatively balanced contributions, with no significant divergence between male and female customers.

In terms of age segmentation, retail purchasing activity is primarily driven by consumers aged 45 and over. However, activity patterns within this segment differ between March and September. In March, transaction volume among consumers aged 45 and over increased relatively, although spending value declined. In contrast, September shows a significant decline in both transaction volume and spending, closely aligning with the overall total sales downturn.

This indicates that total sales fluctuations are more strongly associated with age-related demand patterns than with gender differences.

### 4. Product Mix: Quantity & Average Unit Price

<img src="https://github.com/izzulhaqhussainakbar/My-Portfolio/blob/456b0ab5edf3a818918a3f78004fd5acd25b6931/Case-Study-001/Images/Purchase_Volume_Avg_Unit_Price.jpg" width="600" height="600">

Further analysis of purchase quantity and unit price highlights distinct patterns between the two low-performing months.

- **March:**
The decline is primarily driven by a sharp drop in demand for Electronics, affecting both purchase volume and unit price.

- **September:**
All product categories: Beauty, Clothing, and Electronics experience declines, indicating a broader downtrading behavior rather than category-specific weakness.

These patterns suggest that while both months underperform, the underlying drivers differ.
