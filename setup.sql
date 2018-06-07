PRAGMA foreign_keys = ON; 

CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    release_year INTEGER
);

CREATE TABLE artist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    album_id INTEGER REFERENCES album(id)
);

-- Many to Many join table
CREATE TABLE artist_album (
    artist_id INTEGER REFERENCES artist(id),
    album_id INTEGER REFERENCES album(id)
);

INSERT INTO album (title, release_year) VALUES ("Super Awesome Album", 1990);
INSERT INTO album (title) VALUES ("Super Funky Album");
INSERT INTO album (title, release_year) VALUES ("Super Disco Album", 1978);
INSERT INTO album (title, release_year) VALUES ("Super Hairband Album", 1984);
INSERT INTO album (title) VALUES ("Super Dubstep Album");

INSERT INTO artist (name) VALUES ("Luke and the Droidtones");
INSERT INTO artist (name) VALUES ("Leia and the Ewoks");
INSERT INTO artist (name) VALUES ("Han Solo");

INSERT INTO artist_album (artist_id, album_id) VALUES (1, 5);
INSERT INTO artist_album (artist_id, album_id) VALUES (1, 2);
INSERT INTO artist_album (artist_id, album_id) VALUES (2, 1);
INSERT INTO artist_album (artist_id, album_id) VALUES (2, 2);
INSERT INTO artist_album (artist_id, album_id) VALUES (3, 3);
INSERT INTO artist_album (artist_id, album_id) VALUES (3, 4);

INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 1", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 2", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 3", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 4", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 5", 1);

INSERT INTO track (title, album_id) VALUES ("Super Funky Track 1", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 2", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 3", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 4", 2);

INSERT INTO track (title, album_id) VALUES ("Super Disco Track 1", 3);
INSERT INTO track (title, album_id) VALUES ("Super Disco Track 2", 3);
INSERT INTO track (title, album_id) VALUES ("Super Disco Track 3", 3);

INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 1", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 2", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 3", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 4", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 5", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 6", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 7", 4);

INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 1", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 2", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 3", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 4", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 5", 5);

--Show all albums
SELECT * FROM album;

--Show all albums between 75' and 90'
SELECT * FROM album 
    WHERE release_year >= 1975 
    AND release_year <= 1990;
--Or SELECT title FROM album WHERE release_year BETWEEN 1975 AND 1990;

--Show all albums starting with Super D
SELECT * FROM album 
    WHERE title LIKE 'SUPER D%';

--Show all albums with no release year
SELECT * FROM album 
    WHERE release_year IS NULL; 

--All tracks from Super Funky Album
SELECT track.title FROM album,track 
    WHERE track.album_id = album.id 
    AND album.title = "Super Funky Album";

--Rename to Track_Title
SELECT track.title AS "Track_Title" FROM album,track 
    WHERE track.album_id = album.id 
    AND album.title = "Super Funky Album";

--All albums by Han Solo
SELECT album.title FROM album,artist,artist_album 
    WHERE artist_album.album_id = album.id 
    AND artist_album.artist_id = artist.id 
    AND artist.name = "Han Solo";

--Average year
SELECT CAST(AVG(release_year) AS int) AS "Average Year" FROM album;

--Average Year of Leia Albums
SELECT CAST(AVG(release_year) AS int) AS "Average Leia Album Release" FROM album, artist_album, artist
    WHERE artist_album.album_id = album.id AND
    artist_album.artist_id = artist.id AND
    artist.name = "Leia and the Ewoks";

--Select the number of artists.
SELECT COUNT(*) FROM artist;

--Select the number of tracks on `Super Dubstep Album`.
SELECT COUNT(*) FROM album,track WHERE track.album_id = album.id AND album.title = "Super Dubstep Album";

-- For joins, compare the foreign key with the primary key of the other






    



