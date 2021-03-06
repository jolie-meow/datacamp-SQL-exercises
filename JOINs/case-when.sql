--relationship between the size of a country in terms of surface area and in terms of population
SELECT country_code, size, 
CASE WHEN size > 50000000 THEN 'large'
    WHEN size > 1000000 THEN 'medium'
    ELSE 'small' END
    AS popsize_group
INTO pop_plus
FROM populations 
WHERE year = 2015;

SELECT name, continent, geosize_group, popsize_group
FROM countries_plus AS c 
JOIN pop_plus AS p 
ON c.code = p.country_code
ORDER BY geosize_group;