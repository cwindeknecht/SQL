PRAGMA foreign_keys = ON; 

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(64) NOT NULL
);
CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    content VARCHAR(1024) NOT NULL,
    date DATETIME DEFAULT current_timestamp,
    author_id INTEGER REFERENCES author(id)
);

--Insert authors to the author table.
INSERT INTO author (name) VALUES ("Cody");
INSERT INTO author (name) VALUES ("Lars");
INSERT INTO author (name) VALUES ("Fat Mike");
INSERT INTO author (name) VALUES ("El Hefe");
INSERT INTO author (name) VALUES ("Tim");

--Insert notes to the note table.
INSERT INTO note (title, content, author_id) VALUES ("Rock","Out",1);
INSERT INTO note (title, content, author_id) VALUES ("Smoke","Too many cigarettes",1);
INSERT INTO note (title, content, author_id) VALUES ("Skins","And Punkx",2);
INSERT INTO note (title, content, author_id) VALUES ("Frederickson","And the Bastards",2);
INSERT INTO note (title, content, author_id) VALUES ("Liza","And Louise",3);
INSERT INTO note (title, content, author_id) VALUES ("Hotdog","Down a Hallway",3);
INSERT INTO note (title, content, author_id) VALUES ("Can't","Play",4);
INSERT INTO note (title, content, author_id) VALUES ("Kid","Has to go to Hospital",4);
INSERT INTO note (title, content, author_id) VALUES ("Ruby","Soho",5);
INSERT INTO note (title, content, author_id) VALUES ("Black Coat","White Shoes, Black Hat, Cadillac",5);

--Select all notes by an author's name.
SELECT title,content date FROM note,author WHERE author_id = author.id AND author.name = "Fat Mike";

--Select author for a particular note by note ID.
SELECT name FROM note,author WHERE author_id =author.id AND note.id = 3;

--Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)
SELECT name,COUNT(*) FROM note,author WHERE author_id = author.id GROUP BY author_id;

--Delete authors from the author table.
--DELETE FROM author WHERE author.name = "Fat Mike";

--What happens when you try to delete an author with an existing note?
--Foreign Key Constraint.

--How can you prevent this?
DELETE FROM note WHERE author_id = 3;
DELETE FROM author WHERE id = 3;

SELECT * FROM author;
SELECT * FROM note;


