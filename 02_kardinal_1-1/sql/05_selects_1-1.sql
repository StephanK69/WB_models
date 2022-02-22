-- SELECTS 1:1

-- Einzeltabellen
SELECT * FROM mydb.cats;
SELECT * FROM mydb.servants;

-- Kreuzprodukt (Kartesisches Produkt)
SELECT * FROM mydb.cats JOIN mydb.servants;

-- Kreuzprodukt (gefiltert)
SELECT * FROM 
mydb.cats JOIN mydb.servants
WHERE cat_name = "Grizabella"
;

-- Inner Join 1 / Gesamte Tabelle
SELECT 
	* 
FROM mydb.cats INNER JOIN mydb.servants
-- Werte Primärschlüssel/MT  = Werte Fremdschlüssel/DT
ON mydb.cats.id = mydb.servants.cats_id
;
