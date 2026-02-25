-- Checking total sales trends
WITH analysis AS(
	SELECT
		STRFTIME('%Y-%m', "Date") AS month,
		SUM("Total Amount") AS total_sales
	FROM retail_sales_dataset
	WHERE STRFTIME('%Y-%m', "Date") < '2024-01'
	GROUP BY 1
)
SELECT 
	month,
	total_sales,
	ROUND(AVG(total_sales) OVER(), 2) AS annual_average,
	ROUND(total_sales - AVG(total_sales) OVER(), 2) AS deviation,
	ROUND(
		(total_sales - LAG(total_sales) OVER(ORDER BY month)) * 100 /
		LAG(total_sales) OVER(ORDER BY month), 2
	) || '%' AS month_over_month
FROM analysis
GROUP BY 1;

-- Checking causes from transaction volume and AOV
SELECT
	STRFTIME('%Y-%m', "Date") AS month,
	SUM("Total Amount") AS total_sales,
	COUNT(DISTINCT "Transaction ID") AS transaction_volume,
	ROUND(
		SUM("Total Amount") / COUNT(DISTINCT "Transaction ID"), 2
	) AS avg_order_value
FROM retail_sales_dataset
WHERE STRFTIME('%Y-%m', "Date") IN ('2023-02', '2023-03', '2023-08', '2023-09')
GROUP BY 1;

-- Checking causes from purchase volume and average unit price 
SELECT
	STRFTIME('%Y-%m', "Date") AS month,
	"Product Category" AS product_category,
	SUM(Quantity) AS purchase_volume,
	ROUND(AVG("Price per Unit"), 2) AS avg_unit_price
FROM retail_sales_dataset
WHERE STRFTIME('%Y-%m', "Date") IN ('2023-02', '2023-03', '2023-04', '2023-05', '2023-08', '2023-09')
GROUP BY 1, 2;

-- Checking customer segmentation by gender and age category
SELECT
	STRFTIME('%Y-%m', "Date") AS month,
	Gender AS gender,
	CASE
		WHEN Age < 25 THEN '<25'
		WHEN Age BETWEEN 25 AND 34 THEN '25-34'
		WHEN Age BETWEEN 34 AND 44 THEN '35-44'
		ELSE '>44'
	END AS age_group,
	COUNT("Customer ID") AS transaction_volume
FROM retail_sales_dataset
WHERE STRFTIME('%Y-%m', "Date") IN ('2023-02', '2023-03', '2023-08', '2023-09')
GROUP BY 1, 2, 3