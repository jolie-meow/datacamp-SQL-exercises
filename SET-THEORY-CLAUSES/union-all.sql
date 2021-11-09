--Determine all combinations (include duplicates) of country code and year that exist in either the economies or the populations tables
SELECT code, year FROM economies
UNION ALL
SELECT country_code, year FROM populations
ORDER BY code, year;