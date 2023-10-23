-- Combining AND and OR
-- selects all customers from Spain that starts with a "G" or an "R"
SELECT * FROM Customers
WHERE Country = 'Spain'
AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%')
