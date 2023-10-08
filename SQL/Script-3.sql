SELECT albums.AlbumId,
Title,
Name
FROM albums
INNER JOIN artists
ON albums.ArtistId = artists.ArtistId;



SELECT albums.AlbumId,
albums.Title AS album_title,
artists.Name AS artist_name,
tracks.Milliseconds,
tracks.Name,
tracks.Composer AS track_composer
FROM albums
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId;



SELECT customers.FirstName,
customers.LastName,
customers.CustomerId,
customers.Country
FROM customers
LEFT JOIN invoices ON customers.CustomerId = customers.CustomerId
WHERE BillingCountry == 'Germany';


SELECT customers.CustomerId,
customers.FirstName,
customers.LastName,
customers.Country
FROM customers
WHERE Country = 'Germany'
UNION
SELECT invoices.CustomerId,
NULL AS FirstName,
NULL AS LastName,
invoices.BillingCountry
FROM invoices
WHERE invoices.BillingCountry = "Germany";




