Exercises about different types of JOINs

An INNER JOIN keeps only the records in which the key field (or fields) is in both tables. 

A LEFT JOIN keeps all the records in fields specified in the left table and includes the matches in the right table based on the key field or fields. Key field values that don't match in the right table are included as missing data in the resulting table of a LEFT JOIN.

A RIGHT JOIN keeps all the records specified in the right table and includes the matches from the key field (or fields) in the left table. Those that don't match are included as missing values in the resulting table from the RIGHT JOIN query. 

A FULL JOIN is a combination of a LEFT JOIN and a RIGHT JOIN showing exactly which values appear in both tables and those that appear in only one or the other table.

A CROSS JOIN matches all records from fields specified in one table with all records from fields specified in another table. Remember that a CROSS JOIN does not have an ON or USING clause, but otherwise looks very similar to the code for an INNER JOIN, LEFT JOIN, RIGHT JOIN, or FULL JOIN.