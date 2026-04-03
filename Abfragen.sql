
-- Restaurant Markt- & Standortanalyse Düsseldorf
-- Vaishnavi Srinivas

-- Welche Stadtteile haben die meisten indischen Staatsangehörigen?
SELECT 
    stadtteil,
    indische_staatsangehoerige,
    gesamtbevoelkerung,
    ROUND((indische_staatsangehoerige::numeric / gesamtbevoelkerung * 100), 2) AS anteil_prozent
FROM zielgruppe
ORDER BY indische_staatsangehoerige DESC;


-- An welchen Tagen sind indische Restaurants am vollsten?
SELECT 
    tag,
    COUNT(*) AS anzahl_restaurants,
    AVG(uhrzeit) AS durchschnitt_uhrzeit
FROM stosszeiten
GROUP BY tag
ORDER BY anzahl_restaurants DESC;


--  Konkurrenz-Übersicht nach Stadtteil
SELECT 
    restaurant,
    stadtteil,
    latitude,
    longitude
FROM konkurrenz
ORDER BY stadtteil;


-- Wie viele Konkurrenten pro Stadtteil?
SELECT 
    stadtteil,
    COUNT(*) AS anzahl_restaurants
FROM konkurrenz
GROUP BY stadtteil
ORDER BY anzahl_restaurants DESC;