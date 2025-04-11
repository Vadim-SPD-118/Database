CREATE DATABASE music_site WITH OWNER = postgres;

\c music_site;

CREATE TABLE IF NOT EXISTS Genres (
    GenreID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists (
    ArtistID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS ArtistGenres (
    ArtistGenreID SERIAL PRIMARY KEY,
    ArtistID INT,
    GenreID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE IF NOT EXISTS Albums (
    AlbumID SERIAL PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ReleaseYear SMALLINT
);

CREATE TABLE IF NOT EXISTS AlbumArtists (
    AlbumArtistID SERIAL PRIMARY KEY,
    AlbumID INT,
    ArtistID INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

CREATE TABLE IF NOT EXISTS Tracks (
    TrackID SERIAL PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Duration INT,
    AlbumID INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

CREATE TABLE IF NOT EXISTS Compilations (
    CompilationID SERIAL PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ReleaseYear SMALLINT
);

CREATE TABLE IF NOT EXISTS CompilationTracks (
    CompilationTrackID SERIAL PRIMARY KEY,
    CompilationID INT,
    TrackID INT,
    FOREIGN KEY (CompilationID) REFERENCES Compilations(CompilationID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID)
);