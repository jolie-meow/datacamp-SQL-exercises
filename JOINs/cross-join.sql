--explore languages potentially and most frequently spoken in the cities of Hyderabad (India) and Hyderabad (Pakistan)
SELECT c.name as city, l.name AS language
FROM cities AS c 
CROSS JOIN languages AS l 
WHERE c.name LIKE 'Hyder%'