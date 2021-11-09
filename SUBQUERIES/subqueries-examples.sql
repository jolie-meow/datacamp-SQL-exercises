--SEMI JOIN: identify languages spoken in the Middle East.
SELECT DISTINCT name
  FROM languages
WHERE code IN
  (SELECT code
   FROM countries
   WHERE region = 'Middle East')
ORDER BY name;

-- Sometimes problems solved with semi-joins can also be solved using an inner join.SELECT languages.name AS language
FROM DISTINCT languages
INNER JOIN countries
ON languages.code = countries.code
WHERE region = 'Middle East'
ORDER BY language;

--ANTI-JOIN: useful in identifying which records are causing an incorrect number of records to appear in join queries.
-- identify the currencies used in Oceanian countries!
SELECT c1.code, name, basic_unit AS currency
  FROM countries AS c1
  	INNER JOIN currencies AS c2
WHERE c1.continent = 'Oceania';

--not all countries in Oceania were listed in the resulting inner join with currencies. 
-- Use an anti-join to determine which countries were not included!
SELECT code, name
  FROM countries
  WHERE continent = 'Oceania'
  	AND code NOT IN
  	(SELECT code
  	 FROM currencies);

--determine Asian countries below average `fert_rate`
SELECT name, fert_rate 
FROM states
WHERE fert_rate < 
    (SELECT AVG(fert_rate)
    FROM states)
AND continent = 'Asia'

--which countries had high average life expectancies (at the country level) in 2015.
SELECT *
FROM populations
WHERE life_expectancy > 
  1.15 * (SELECT AVG(life_expectancy)
  FROM populations
  WHERE year = 2015)
AND year = 2015;

--the urban area population for only capital cities.
SELECT name, country_code, urbanarea_pop
FROM cities
WHERE name IN (
    SELECT name
    FROM cities
    INTERSECT
    SELECT capital
    FROM countries )
ORDER BY urbanarea_pop DESC;


--subqueries inside SELECT clauses
-- count the number of countries listed in the states table for each continent in the prime_ministers table
SELECT DISTINCT continent,
  (SELECT COUNT(*)
  FROM states
  WHERE prime_ministers.continent = states.continent) AS countries_num
FROM prime_ministers;

--top nine countries in terms of number of cities appearing in the cities table
SELECT countries.name AS country,
  (SELECT COUNT(*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;
-- can also use JOIN to solve this :
*SELECT countries.name AS country, COUNT(*) AS cities_num
  FROM cities
    INNER JOIN countries
    ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;*/


--  number of languages spoken for each country, identified by the country's local name! 
--(Note this may be different than the name field and is stored in the local_name field.)
SELECT local_name, countries.code, lang_num
FROM countries,(
SELECT code, COUNT(name) AS lang_num
FROM languages
GROUP BY code) as subquery
WHERE countries.code = subquery.code
ORDER BY lang_num DESC


-- Advanced subquery : nest multiple subqueries to answer even more specific questions
-- For each of the six continents listed in 2015, you'll identify which country had the maximum inflation rate, and how high it was
SELECT name, continent, inflation_rate
  FROM countries
	INNER JOIN economies
	ON countries.code = economies.code
  WHERE year = 2015
    -- And inflation rate in subquery (alias as subquery)
    AND inflation_rate IN (
        SELECT MAX(inflation_rate) AS max_inf
        FROM (
             SELECT name, continent, inflation_rate
             FROM countries
             INNER JOIN economies
             ON countries.code = economies.code
             WHERE year = 2015) AS subquery
      -- Group by continent
        GROUP BY continent);


-- Subquery challenge
--get 2015 economic data for countries that do not have gov_form of 'Constitutional Monarchy' or 'Republic' in their gov_form.
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE code NOT IN 
    (SELECT code 
    FROM countries
    WHERE gov_form = 'Constitutional Monarchy' 
    OR gov_form LIKE '%Republic%')
AND year = 2015
ORDER BY inflation_rate;