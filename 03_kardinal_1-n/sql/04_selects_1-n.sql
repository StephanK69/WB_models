-- 03. SELECTS

-- Einzeltabellen
SELECT * FROM mydb.cats;
SELECT * FROM mydb.kittens;

-- Inner Join 1 / Gesamte Kombi-Tabelle
SELECT 
	* 
FROM mydb.cats INNER JOIN mydb.kittens
ON mydb.cats.id  = mydb.kittens.cats_id
;
