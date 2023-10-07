-- Create a list of album titles and the unit prices for the artist "Audioslave using inner join to solve it".
SELECT albums.Title,
artists.Name,
tracks.UnitPrice
FROM albums
INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.Name = 'Audioslave';



-- Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?
SELECT customers.FirstName,
customers.LastName
FROM customers
INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId;


-- Find the total price for each album.
SELECT albums.Title,
albums.AlbumId,
tracks.UnitPrice,
sum(tracks.UnitPrice) AS totalPrice
FROM albums
INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId
GROUP BY albums.Title
ORDER BY albums.AlbumId;



-- Find all the tracks that have a length of 5,000,000 milliseconds or more.
SELECT * FROM tracks
WHERE tracks.Milliseconds >= 5000000;



-- Find all the invoices whose total is between $5 and $15 dollars.
SELECT * FROM invoices
WHERE Total  BETWEEN 5 AND 15;



-- Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT * FROM customers
WHERE customers.State IN ("RJ", "DF", "AB", "BC", "CA", "WA", "NY");



-- Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
SELECT * FROM invoices
WHERE invoices.CustomerId IN (56, 58) AND invoices.Total BETWEEN 1 AND 5;


-- Find all the tracks whose name starts with 'All'.
SELECT * FROM tracks
WHERE Name LIKE "ALL%";


-- Find all the customer emails that start with "J" and are from gmail.com.
SELECT * FROM customers
WHERE Email LIKE "J%" AND Email LIKE "%gmail.com";



--  Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
SELECT * FROM invoices
WHERE BillingCity IN ('Brasília', 'Edmonton', 'Vancouver')
ORDER BY InvoiceId DESC


-- Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in 
SELECT count(CustomerId) AS count,
*
FROM invoices
GROUP BY CustomerId;


-- Find the albums with 12 or more tracks.
SELECT
count(tracks.AlbumId) AS tracks_count,
albums.AlbumId,
albums.Title as album_name,
tracks.Name  AS track_name
FROM albums INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId
GROUP BY tracks.AlbumId
HAVING count(tracks.AlbumId) >= 12;


-- using a subquery, find the names of all the tracks from the album "Californication"
SELECT tracks.Name, tracks.AlbumId
FROM tracks
WHERE tracks.AlbumId = 
    (SELECT albums.AlbumId FROM albums WHERE albums.Title = "Californication");

   
-- Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT customers.CustomerId,
customers.FirstName,
customers.LastName,
customers.City,
customers.Email,
count(invoices.InvoiceId) AS Total_count,
invoices.InvoiceId
FROM customers
INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId
GROUP BY customers.CustomerId;



-- Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT tracks.Name AS tracks_name,
albums.Title AS album_name,
artists.ArtistId,
tracks.TrackId
FROM albums
INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId; 
   
   
-- Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT * FROM employees;
   
   
   
-- Find the name and ID of the artists who do not have albums.
-- Will be making use of left join
SELECT artists.ArtistId, artists.Name
FROM artists
LEFT JOIN albums ON artists.ArtistId = albums.ArtistId
WHERE albums.AlbumId IS NULL;


-- Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT employees.FirstName,
employees.LastName
FROM employees
UNION
SELECT customers.FirstName,
customers.LastName
FROM customers
ORDER BY LastName DESC;


-- See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT customers.CustomerId,
customers.FirstName,
customers.LastName,
customers.City,
invoices.BillingCity
FROM customers
INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId;







