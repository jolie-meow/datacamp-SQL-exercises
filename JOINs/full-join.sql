--example 1: North American region and also where the name of the country is missing
SELECT code, name AS country, region, basic_unit
FROM countries
FULL JOIN currencies 
USING (code)
WHERE region = 'North America' OR region IS NULL
ORDER BY region 

--example 2: country's name starts with the capital letter 'V' or is NULL.
SELECT countries.name, code, languages.name AS language
FROM languages
FULL JOIN countries
USING (code)
WHERE countries.name LIKE 'V%' OR countries.name IS NULL
ORDER BY countries.name;

--example 3: Melanesia and Micronesia regions
SELECT c1.name AS country, region, l.name AS language, basic_unit, frac_unit
FROM countries AS c1
FULL JOIN languages AS l
  USING(code)
FULL JOIN currencies AS c2
  USING(code) 
WHERE region LIKE 'M%esia';