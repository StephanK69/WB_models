-- 03. SELECTS / Servants, Products

-- Einzeltabellen
SELECT * FROM mydb.servants;
SELECT * FROM mydb.products;
SELECT * FROM mydb.purchases;

-- Inner Join 1 / Kombi (servants / products / purchases)
SELECT 
	* 
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
;

-- Welche Artikel hat Michael gekauft?
SELECT 
	#servant_name AS Diener,
    #product_name AS "Von Michael gekaufte Produkte:"
    concat(servant_name, " kauft ", product_name) AS Kaufhandlung
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
#WHERE servant_name = "Michael"
WHERE servant_name = "Peter"
;

-- Wieviel Produkte hat Michael gekauft?
SELECT 
    concat(
			servant_name, 
            " kauft ", 
            count(product_name),
            " Produkte."
            ) AS Kaufhandlung
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Michael"
;

-- Wieviel Geld hat Michael ausgegeben?
SELECT 
    servant_name AS Diener, -- organisch
    count(servant_name) AS Artikelanzahl, -- aggregiert / f()
    sum(product_price) AS Gesamtkosten -- aggregiert / f()
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY servant_name
HAVING servant_name = "Michael"
;

-- Wer hat das Produkt X gekauft?  
-- Irgendwas mit Lachs / Irgendwas mit Sauce LIKE
-- Spalten --> Diener / Produkt
-- WHERE / LIKE
SELECT 
	servant_name AS Diener,
    product_name AS "Irgenwas mit Sauce oder Lachs"
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE product_name LIKE "%Lachs%" OR product_name LIKE "%Sauce%"
#WHERE product_name LIKE "%Huhn%"
;

-- Wie oft wurde das Produkt X gekauft?
SELECT 
	product_name AS Produkte, -- nicht aggr.
    count(product_name) AS Anzahl -- aggr.
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY product_name
#ORDER BY count(product_name) DESC
ORDER BY Anzahl DESC  -- Alias 
;

-- Welche Umsätze hatte das Produkt X?
SELECT
	product_name AS Produkte, -- nicht aggr.
    count(product_name) AS Anzahl, -- aggr.
    sum(product_price) AS Umsätze -- aggr.  // count() * price
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY product_name
#ORDER BY sum(product_price) DESC
ORDER BY Umsätze DESC -- Alias
;






