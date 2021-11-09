--inflation rate for both 2010 and 2015 in each country
SELECT c.code AS country_code, name, year, inflation_rate
FROM countries AS c
INNER JOIN economies AS e 
ON c.code = e.code
WHERE e.year IN (2010, 2015)

--fertility rate for both 2010 and 2015 in each country 
SELECT code, name, region, year, fertility_rate
FROM countries AS c 
INNER JOIN populations AS p 
ON c.code = p.country_code