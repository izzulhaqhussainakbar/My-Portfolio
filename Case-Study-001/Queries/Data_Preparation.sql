-- Checking table information
PRAGMA TABLE_INFO(retail_sales_dataset);

-- Checking duplication
SELECT
	"Transaction ID",
	COUNT(*) AS duplication
FROM retail_sales_dataset
GROUP BY "Transaction ID"
HAVING duplication > 1;

-- Checking missing value
SELECT
	SUM(CASE WHEN "Transaction ID" IS NULL THEN 1 ELSE 0 END) AS null_TransactionID,
	SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS null_Date,
	SUM(CASE WHEN "Customer ID" IS NULL THEN 1 ELSE 0 END) AS null_CustomerID,
	SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS null_Gender,
	SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS null_Age,
	SUM(CASE WHEN "Product Category" IS NULL THEN 1 ELSE 0 END) AS null_ProductCategory,
	SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS null_Quantity,
	SUM(CASE WHEN "Price per Unit" IS NULL THEN 1 ELSE 0 END) AS null_PricePerUnit,
	SUM(CASE WHEN "Total Amount" IS NULL THEN 1 ELSE 0 END) AS null_TotalAmount
FROM retail_sales_dataset;

-- Checking Gender and Product Category format
SELECT DISTINCT
	Gender
FROM retail_sales_dataset;

SELECT DISTINCT
	"Product Category"
FROM retail_sales_dataset;

-- Checking Quantity, Price per Unit, and Total Amount outliers
SELECT  
	MIN(Quantity), MAX(Quantity),
	MIN("Price per Unit"), MAX("Price per Unit"),
	MIN("Total Amount"), MAX("Total Amount")
FROM retail_sales_dataset;

-- Validating Total Amount calculation
SELECT *
FROM retail_sales_dataset
WHERE "Total Amount" != Quantity * "Price per Unit"
LIMIT 10;