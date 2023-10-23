-- The example above will not work in Firefox!
-- Because COUNT(DISTINCT column_name) is not supported in Microsoft Access databases. 
-- Firefox is using Microsoft Access in our examples.

-- Here is the workaround for MS Access:
SELECT Count(*) AS DistinctCountries 
FROM (SELECT DISTINCT Country FROM Customers);
