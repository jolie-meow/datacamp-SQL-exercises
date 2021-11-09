--determine the records in common for country code and year for the economies and populations tables.
SELECT code, year
FROM economies
INTERSECT
SELECT 	country_code, year
FROM populations
ORDER BY code, year;

--which countries also have a city with the same name as their country name?
SELECT name FROM cities
INTERSECT 
SELECT name FROM countries