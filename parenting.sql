SELECT *
FROM [dd].[dbo].[parenting]

DROP TABLE IF EXISTS #accounts_temp;

WITH acc AS(
	SELECT parenting.[CHD ID]	AS account_id
	, parenting.[Account Name] AS account_name
	FROM [dd].[dbo].[parenting] AS parenting
	)
	SELECT *
	INTO #accounts_temp
	FROM acc
	ORDER BY account_name
	;

SELECT tmp.*
	, par.[CHD PID]			AS corporate_id
	, par.[CHD Owner PID]	AS franchise_id
FROM #accounts_temp as tmp
LEFT JOIN [dd].[dbo].[parenting] AS par ON tmp.[account_id] = par.[CHD ID]
;
