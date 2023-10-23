-- Combining AND and OR
-- return all customers from Spain that starts with a "G", 
-- plus all customers that starts with an "R", 
-- regardless of the country value:
SELECT * FROM Customers
WHERE Country = 'Spain'
AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';
