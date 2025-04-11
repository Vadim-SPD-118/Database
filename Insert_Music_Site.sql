/* inserting genres */
INSERT INTO Genres (Name) VALUES
('Rock'),
('Pop'),
('Jazz');

/* inserting artists */
INSERT INTO Artists (Name) VALUES
('The Beatles'),
('Queen'),
('Miles Davis'),
('Adele'),
('Linkin Park');

/* inserting albums */
INSERT INTO Albums (Title, ReleaseYear) VALUES
('Abbey Road', 1969),
('A Night at the Opera', 1975),
('Kind of Blue', 1959),
('Future Nostalgia', 2020),
('Fine Line', 2019),
('After Hours', 2020),
('Hybrid Theory', 2000);

/* inserting tracks */
INSERT INTO Tracks (Title, Duration, AlbumID) VALUES
('Come Together', 259, 1),
('Bohemian Rhapsody', 354, 2),
('So What', 545, 3),
('Here Comes the Sun', 185, 1),
('You’re My Best Friend', 220, 2),
('Freddie Freeloader', 320, 3),
('Don’t Start Now', 183, 4),  -- Future Nostalgia
('Adore You', 200, 5),        -- Fine Line
('Blinding Lights', 200, 6),  -- After Hours
('One Step Closer', 180, 7),  -- Hybrid Theory
('Crawling', 220, 7),
('my own', 200, 1),
('own my', 210, 2),
('my', 220, 3),
('oh my god', 190, 4),
('myself', 205, 5),
('by myself', 210, 6),
('bemy self', 220, 7),
('myself by', 200, 1),
('by myself by', 205, 2),
('beemy', 180, 3),
('premyne', 195, 4);

/* inserting compliations */
INSERT INTO Compilations (Title, ReleaseYear) VALUES
('Greatest Hits Vol. 1', 1981),
('The Essential Jazz Collection', 2005),
('Pop Classics', 2010),
('Rock Legends', 2015),
('Rock Anthems', 2018);

/* inserting artists and genres */
INSERT INTO ArtistGenres (ArtistID, GenreID) VALUES
(1, 1),  -- The Beatles - Rock
(1, 2),  -- The Beatles - Pop
(2, 1),  -- Queen - Rock
(3, 3),  -- Miles Davis - Jazz
(4, 2),  -- Adele - Pop
(5, 1),  -- Linkin Park - Rock
(5, 2);  -- Linkin Park - Metal

/* inserting artists and albums */
INSERT INTO AlbumArtists (AlbumID, ArtistID) VALUES
(1, 1),  -- Abbey Road - The Beatles
(2, 2),  -- A Night at the Opera - Queen
(3, 3),  -- Kind of Blue - Miles Davis
(4, 4),  -- Future Nostalgia - Adele
(5, 4),  -- Fine Line - Adele
(6, 2);  -- After Hours - Queen

/* inserting compliations and tracks */
INSERT INTO CompilationTracks (CompilationID, TrackID) VALUES
(1, 1),  -- Greatest Hits Vol. 1 - Come Together
(1, 2),  -- Greatest Hits Vol. 1 - Bohemian Rhapsody
(2, 3),  -- The Essential Jazz Collection - So What
(2, 6),  -- The Essential Jazz Collection - Freddie Freeloader
(3, 4),  -- Pop Classics - Here Comes the Sun
(4, 5),  -- Rock Legends - You’re My Best Friend
(5, 1),  -- Greatest Hits Vol. 1 - Come Together
(5, 2);  -- Rock Anthems - Bohemian Rhapsody