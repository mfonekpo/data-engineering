SELECT albums.AlbumId,
Title,
Name
FROM albums
INNER JOIN artists
ON albums.ArtistId = artists.ArtistId;