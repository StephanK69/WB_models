-- 3a SELECTS 1:1 / n:m

-- 1. JOIN 
SELECT
	*
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
INNER JOIN mydb.cats ON mydb.cats.id = mydb.servants.cats_id
;
