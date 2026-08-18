-- Future Interns Data Science & Analytics
-- Task 1: Business Sales Performance Analytics

USE future_ds_1;

-- Check total records
SELECT COUNT(*) AS total_rows
FROM `list of orders`;

-- Check blank Order IDs
SELECT COUNT(*) AS blank_order_ids
FROM `list of orders`
WHERE TRIM(`Order ID`) = '';

-- Remove blank records
DELETE FROM `list of orders`
WHERE TRIM(`Order ID`) = '';

-- Verify remaining records
SELECT COUNT(*) AS total_rows
FROM `list of orders`;

-- Check Order Date values
SELECT DISTINCT `Order Date`
FROM `list of orders`
ORDER BY `Order Date`
LIMIT 20;

-- Create cleaned date column
ALTER TABLE `list of orders`
ADD COLUMN Order_Date_Clean DATE;

-- Convert text dates to proper DATE format
UPDATE `list of orders`
SET Order_Date_Clean = STR_TO_DATE(`Order Date`, '%d-%m-%Y');

-- Verify date conversion
SELECT
    `Order Date`,
    Order_Date_Clean
FROM `list of orders`
LIMIT 10;

-- Check failed date conversions
SELECT COUNT(*) AS conversion_failed
FROM `list of orders`
WHERE Order_Date_Clean IS NULL;
