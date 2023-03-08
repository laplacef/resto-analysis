WITH cte AS(
SELECT dup.[Account Name]	AS account_name
	, dup.[Billing Address] AS billing_address
	, dup.[Business ID]		AS business_id
	, dup.[Store ID]		AS phone_number
	, dup.[Phone]			AS store_id
	, ROW_NUMBER() OVER (PARTITION BY dup.[Account Name], dup.[Billing Address] ORDER BY dup.[Account Name] ASC) AS [duplicates]
FROM [dd].[dbo].[duplicates] AS dup
)
SELECT *
FROM cte
WHERE cte.[duplicates] > 1
;