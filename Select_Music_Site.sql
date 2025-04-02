/* task 2 */

/* the title and duration of the longest track */
SELECT Title, Duration
FROM Tracks
ORDER BY Duration DESC
LIMIT 1;

/* The name of tracks with a duration of at least 3.5 minutes (210 seconds) */
SELECT Title
FROM Tracks
WHERE Duration >= 210;

/* Titles of collections published between 2018 and 2020 inclusive */
SELECT Title
FROM Compilations
WHERE ReleaseYear BETWEEN 2018 AND 2020;

/* artists whose name consists of one word */
SELECT Name
FROM Artists
WHERE Name NOT LIKE '% %';

/* The name of tracks that contain the word 'мой' or 'my' */
SELECT Title
FROM Tracks
WHERE Title ILIKE '%мой%' OR Title ILIKE '%my%';

/* task 3 */

/* number of artists in each genre */
SELECT g.Name AS Genre, COUNT(ag.ArtistID) AS ArtistCount
FROM Genres g
LEFT JOIN ArtistGenres ag ON g.GenreID = ag.GenreID
GROUP BY g.Name;

/* number of tracks included in 2019-2020 albums */
SELECT COUNT(t.TrackID) AS TrackCount
FROM Tracks t
JOIN Albums a ON t.AlbumID = a.AlbumID
WHERE a.ReleaseYear BETWEEN 2019 AND 2020;

/* Average track duration per album */
SELECT a.Title AS AlbumTitle, AVG(t.Duration) AS AverageDuration
FROM Albums a
JOIN Tracks t ON a.AlbumID = t.AlbumID
GROUP BY a.Title;

/* All artists who haven't released albums in 2020 */
SELECT DISTINCT ar.Name
FROM Artists ar
LEFT JOIN AlbumArtists aa ON ar.ArtistID = aa.ArtistID
LEFT JOIN Albums al ON aa.AlbumID = al.AlbumID AND al.ReleaseYear = 2020
WHERE al.AlbumID IS NULL;

/* Titles of compilations featuring the artist Queen */
SELECT DISTINCT c.Title
FROM Compilations c
JOIN CompilationTracks ct ON c.CompilationID = ct.CompilationID
JOIN Tracks t ON ct.TrackID = t.TrackID
JOIN AlbumArtists aa ON t.AlbumID = aa.AlbumID
WHERE aa.ArtistID = (SELECT ArtistID FROM Artists WHERE Name = 'Queen');

/* task 4 */

/* Album titles that feature artists from more than one genre */
SELECT a.Title AS AlbumTitle
FROM Albums a
JOIN AlbumArtists aa ON a.AlbumID = aa.AlbumID
JOIN ArtistGenres ag ON aa.ArtistID = ag.ArtistID
GROUP BY a.Title
HAVING COUNT(DISTINCT ag.GenreID) > 1;

/* Names of tracks that are not included in compilations */
SELECT t.Title
FROM Tracks t
LEFT JOIN CompilationTracks ct ON t.TrackID = ct.TrackID
WHERE ct.CompilationID IS NULL;

/* The artist or artists who wrote the shortest track in terms of duration */
SELECT ar.Name
FROM Artists ar
JOIN AlbumArtists aa ON ar.ArtistID = aa.ArtistID
JOIN Tracks t ON aa.AlbumID = t.AlbumID
WHERE t.Duration = (
    SELECT MIN(Duration) FROM Tracks
);

/* Titles of albums with the fewest number of tracks */
SELECT a.Title AS AlbumTitle
FROM Albums a
JOIN Tracks t ON a.AlbumID = t.AlbumID
GROUP BY a.Title
HAVING COUNT(t.TrackID) = (
    SELECT MIN(track_count) FROM (
        SELECT COUNT(TrackID) AS track_count
        FROM Tracks
        GROUP BY AlbumID
    ) AS album_counts
);