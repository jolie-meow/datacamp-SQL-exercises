--Get the names of cities in cities which are not noted as capital cities in countries as a single field result
--Note that there are some countries in the world that are not included in the countries table, 
-- which will result in some cities not being labeled as capital cities when in fact they are.
SELECT name FROM cities
EXCEPT
SELECT capital FROM countries
ORDER BY name;

-- Determine the names of capital cities that are not listed in the cities table.
SELECT capital FROM countries
EXCEPT
SELECT name FROM cities
ORDER BY capital;