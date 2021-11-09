--example 1
SELECT c1.name AS city, code, c2.name AS country,
       region, city_proper_pop
FROM cities AS c1
LEFT JOIN countries AS c2
    ON c1.country_code = c2.code
ORDER BY code DESC;

--example 2
SELECT c.name AS country, local_name, l.name AS language, percent
FROM countries AS c
LEFT JOIN languages AS l
  ON c.code = l.code
ORDER BY country DESC;

--example 3: average gross domestic product (GDP) per capita by region in 2010.
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c 
LEFT JOIN economies AS e 
ON c.code = e.code
WHERE year = 2010
GROUP BY region
ORDER BY avg_gdp DESC;

--example 4: In terms of life expectancy for 2010, determine the names of the lowest five countries and their regions.
SELECT name AS country,region, life_expectancy AS life_exp
FROM countries AS c
LEFT JOIN populations AS p
ON c.code = p.country_code
WHERE year = 2010
ORDER BY life_expectancy
LIMIT 5;

--example 5: RIGHT JOINS
SELECT cities.name AS city, urbanarea_pop, countries.name AS country,
       indep_year, languages.name AS language, percent
FROM languages
RIGHT JOIN countries 
  ON countries.code = languages.code
RIGHT JOIN cities 
  ON cities.country_code = countries.code
ORDER BY city, language;