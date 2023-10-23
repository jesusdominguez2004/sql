-- The IS NOT NULL Operator
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL;
