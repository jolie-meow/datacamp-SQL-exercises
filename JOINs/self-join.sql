--percentage increase in population from 2010 to 2015 for each country code
SELECT p1.country_code, p1.size AS size2010, p2.size AS size2015, 
  (p2.size - p1.size)/p1.size*100.0 AS growth_perc
FROM populations AS p1
JOIN populations AS p2
  ON p1.country_code = p2.country_code AND p1.year = p2.year - 5
