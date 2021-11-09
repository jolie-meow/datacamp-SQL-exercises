--Combine the two new tables into one table containing all of the fields in economies2010
SELECT * FROM economies2010
UNION ALL
SELECT * FROM economies2015
ORDER BY code, year;

-- Identify the country codes that are included in either economies or currencies but not in populations.
SELECT name
FROM cities 
WHERE country_code IN (
  SELECT code FROM economies 
  UNION 
  SELECT code FROM currencies
  EXCEPT 
  SELECT country_code FROM populations)
