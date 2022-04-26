(/* QUERY 1 - Which cities have the best rock customers? */)
SELECT g.name AS Genre_Name,
       c.city AS City,
       SUM(il.Quantity * il.UnitPrice) AS Amount_Spent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId =t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.name = "Rock"
GROUP BY City
ORDER BY Amount_Spent DESC

/* QUERY 1 Which music genre generated the highest revenue? */
SELECT g.Name AS Genre_Name,
       ROUND(SUM(il.Quantity * il.UnitPrice), 2) AS Amount_Spent
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY Genre_Name
ORDER BY Amount_Spent DESC

/* QUERY 1 What is the historical trend of rock music purchases?*/
SELECT STRFTIME('%Y-%m', i.InvoiceDate) AS Date,
       SUM(il.Quantity * il.UnitPrice) AS Amount_Spent
FROM Invoice i
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = "Rock"
GROUP BY Date

/* QUERY 1 What is the distribution of customers based on the total of their invoices?*/
SELECT c.FirstName || " " || c.LastName Customer_Name,
       SUM(i.Total) AS Amount_Spent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY Customer_Name
ORDER BY Amount_Spent DESC
