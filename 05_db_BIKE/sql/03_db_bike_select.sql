-- Relation = Tabelle

USE bike;
SHOW TABLES;

/* Query 1
Schreiben Sie einen Select-Befehl, 
der aus der Relation (Tabelle) Personal die Namen aller Personen ermittelt, 
die mehr als 3000 Euro verdienen.
*/
-- ges. Tabelle
SELECT * FROM Personal;

-- Query
SELECT
	Name,
    Gehalt
FROM Personal
WHERE Gehalt > 3000
ORDER BY Gehalt DESC;
#ORDER BY Gehalt ASC;
;

/* Query 2
Geben Sie die Gesamtanzahl der für Aufträge reservierten Artikel aus 
(die benötigten Informationen stehen in der Relation Reservierung).
*/

-- ges. Tabelle
SELECT * FROM Reservierung;

-- Query
SELECT 
	 sum(Anzahl) AS "Reservierungen (kum.)" 
FROM Reservierung;

/* Query 3
Geben Sie alle Artikel der Relation Lager aus, deren Bestand abzüglich 
des Mindestbestands und der Reservierungen unter den Wert 3 gesunken ist. 
Als Ausgabe werden Artikelnummer und Artikelbezeichnung erwartet.
*/
-- Bedingung:  (Bestand - Mindbest - Reserviert) < 3

SELECT * FROM Lager; -- Tab. Lager
SELECT * FROM Artikel; -- Tab. Artikel

-- Vorbereitung: Tab. Lager + Bedingung
SELECT 
	Artnr AS Artikelnummer,
    (Bestand - Mindbest - Reserviert) AS Berechnung
FROM Lager
WHERE (Bestand - Mindbest - Reserviert) < 3
ORDER BY Berechnung DESC
; 

-- Tab. Lager + Artikel m. INNER JOIN + Bedingung
SELECT 
	Artnr AS Artikelnummer,
    Bezeichnung,
    (Bestand - Mindbest - Reserviert) AS Berechnung
FROM Lager 
INNER JOIN Artikel ON Lager.Artnr = Artikel.Anr
WHERE Bestand - Mindbest - Reserviert < 3
ORDER BY Berechnung DESC
;

