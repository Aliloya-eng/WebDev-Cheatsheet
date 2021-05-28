
////////////*/*/*/*/*/*/*/*/*/*     	SQL  SYNTAX			/*/*/*/*/*/*/*/*/////////////////////////////

	1- (database adress+username+password); 											-- link to the data base

	2- SHOW DATABASES; 																	-- show all databases

	3- CREATE DATABASE name_of_database DEFAULT CHARACTER SET utf8; 					-- create a database that accept characters from all languages

	4- USE name_of_database; 															-- used in command line only, to enter the database so you can deal with it

	5- CREATE TABLE name_of_table ( 													-- create a table inside the database we are using (we are in)
		name_of_column1 type_of_data_in_column1(size_of_data_in_column1),
		name_of_column2 type_of_data_in_column2(size_of_data_in_column2),
	);
	/* exp
	CREATE TABLE users (
		name VARCHAR(128),
		email VARCHAR(128)
	); 	*/

	6- DESCRIBE users; 																	-- show the table named users

	7- INSERT INTO name_of_table (name_of_column1,name_of_column2) VALUES (value1,value2);
	/* exp: INSERT INTO users (name,email) VALUES (ali,alihassan.courses@gmail.com); 	-- insert a row into the table 										*/

	8- UPDATE name_of_table SET name_of_columnX='new value' WHERE name_of_columnZ='the value in columnZ of the row we want to change';
	/* exp:  UPDATE users SET email='ali.was.as@gmail.com' WHERE name='ali' ; 			-- change the value of a cell in a row 								*/

	9- DELETE FROM name_of_table WHERE name_of_columnX='the value in columnX of the row we want to delete';
	/* exp: DELETE FROM users WHERE email='ali.was.as@gmail.com'; 						-- delete a row from the table 										*/

	10- SELECT * FROM name_of_table WHERE name_of_columnX='the value in columnX of the row we want to select (or read)';
	/*exp: SELECT * FROM users;
	  exp: SELECT * FROM users ORDER BY email;
	  exp: SELECT * FROM users WHERE name='ali'; 										-- reading a set of rows from a table 								*/

	11- SELECT * FROM name_of_table WHERE name_of_columnX LIKE '% any part of the values in columnX of the rows we want to select (or read) %';
	/* exp: SELECT * FROM users WHERE email LIKE '%s%'; 								-- select all the rows that contains this string in the columnX 	*/

	12- SELECT * FROM name_of_table ORDER BY name_of_columnX DESC LIMIT n,m;
	/*exp: SELECT * FROM users ORDER BY email DESC LIMIT 2,5; 	-- select the first 5 rows starting from the 2ed row after ordering them descendantly by email
	  exp: SELECT * FROM users WHERE email LIKE '%s%' LIMIT 2; 	-- select the first 2 rows that have the letter 's' in the email cell 						*/

	13- SELECT COUNT(*) FROM name_of_table;
	/*exp: SELECT COUNT(*) FROM users; 													-- return the number of rows that match the condition 				*/

	14- ALTER TABLE name_of_table ADD INDEX (name_of_columnX);
	/*exp: ALTER TABLE users ADD INDEX (email); 										-- add an index 													*/


///////////////////*/*/*/*/*/*/*/*/*/*     	TYPES OF DATA in Tables			/*/*/*/*/*/*/*/*/////////////////////////////

	1- INT = integer
	2- UNSIGNED = positive (cant be negative)
	3- NOT NULL = cant be empty
	4- AUTO_INCREMENT = generate this number automatically be adding 1 to the previuos

	5- PRIMARY KEY(name_of_columnX) = this column is the primary key in this table
	6- INDEX(name_of_columnZ) = we will search alot in this table depending on this column


///////////*/*/*/*/*/*/*/*/*/*     Building Relational Database	(JOINING TABLES)			/*/*/*/*/*/*/*/*////////////////////////

	Building Relational Database

	when we want to build relational databases first we look for the main unit of the whole system ( what is the main interface? what is the system about? )
	then we think about the relational database tabels and the relations between them and we drow them on paper, finaly we start coding and we build the far tables first then we build closer and closer to the root (the main table that contains the the main unit that we chose in our first step), and we link tables as we build them with the following instruction :
	CONSTRAINT FOREIGN KEY (foreign_key) REFERENCES table_of_primary_key (primary_key) ON DELETE (CASCADE|RESTRICT|SETT NULL) ON UPDATE CASCADE,
	-- it is a good idea to give the same name for the foreign and the primary key 									
	
	*****

1- one to many
	
	CREATE DATABASE Music DEFAULT CHARACTER SET utf8;

	USE Music;  (Command line only);

	CREATE TABLE Artist (
	  artist_id INTEGER NOT NULL AUTO_INCREMENT,
	  name VARCHAR(255),
	  PRIMARY KEY(artist_id)
	) ENGINE = InnoDB;

	CREATE TABLE Album (
	  album_id INTEGER NOT NULL AUTO_INCREMENT,
	  title VARCHAR(255),
	  artist_id INTEGER,

	  PRIMARY KEY(album_id),
	  INDEX USING BTREE (title),

	  CONSTRAINT FOREIGN KEY (artist_id)
	    REFERENCES Artist (artist_id)
	    ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE = InnoDB;

	CREATE TABLE Genre (
	  genre_id INTEGER NOT NULL AUTO_INCREMENT,
	  name VARCHAR(255),
	  PRIMARY KEY(genre_id)
	) ENGINE = InnoDB;

	CREATE TABLE Track (
	  track_id INTEGER NOT NULL AUTO_INCREMENT,
	  title VARCHAR(255),
	  len INTEGER,
	  rating INTEGER,
	  count INTEGER,
	  album_id INTEGER,
	  genre_id INTEGER,

	  PRIMARY KEY(track_id),
	  INDEX USING BTREE (title),

	  CONSTRAINT FOREIGN KEY (album_id) REFERENCES Album (album_id)
	    ON DELETE CASCADE ON UPDATE CASCADE,
	  CONSTRAINT FOREIGN KEY (genre_id) REFERENCES Genre (genre_id)
	    ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE = InnoDB;


	INSERT INTO Artist (name) VALUES ('Led Zepplin');
	INSERT INTO Artist (name) VALUES ('AC/DC');

	INSERT INTO Genre (name) VALUES ('Rock');
	INSERT INTO Genre (name) VALUES ('Metal');

	INSERT INTO Album (title, artist_id) VALUES ('Who Made Who', 2);
	INSERT INTO Album (title, artist_id) VALUES ('IV', 1);

	INSERT INTO Track (title, rating, len, count, album_id, genre_id)
	    VALUES ('Black Dog', 5, 297, 0, 2, 1);
	INSERT INTO Track (title, rating, len, count, album_id, genre_id)
	    VALUES ('Stairway', 5, 482, 0, 2, 1);
	INSERT INTO Track (title, rating, len, count, album_id, genre_id)
	    VALUES ('About to Rock', 5, 313, 0, 1, 2);
	INSERT INTO Track (title, rating, len, count, album_id, genre_id)
	    VALUES ('Who Made Who', 5, 207, 0, 1, 2);

	SELECT Album.title, Artist.name FROM Album JOIN Artist ON
	    Album.artist_id = Artist.artist_id;

	SELECT Album.title, Album.artist_id, Artist.artist_id, Artist.name 
	    FROM Album JOIN Artist ON Album.artist_id = Artist.artist_id;

	SELECT Track.title, Track.genre_id, Genre.genre_id, Genre.name 
	    FROM Track JOIN Genre;

	SELECT Track.title, Genre.name FROM Track JOIN Genre ON 
	    Track.genre_id = Genre.genre_id;

	SELECT Track.title, Artist.name, Album.title, Genre.name 
	    FROM Track JOIN Genre JOIN Album JOIN Artist 
	    ON Track.genre_id = Genre.genre_id AND Track.album_id = 
	    Album.album_id AND Album.artist_id = Artist.artist_id;

	DELETE FROM Genre WHERE name = 'Metal';

	DROP TABLE Track; DROP TABLE Album; DROP TABLE Genre; DROP TABLE Artist;
**********************************************************************************************************************************************************
2- many to many

	CREATE DATABASE Learning DEFAULT CHARACTER SET utf8 ;

	USE Learning;   (Command line only)

	CREATE TABLE Account (
	    account_id  INTEGER NOT NULL AUTO_INCREMENT,
	    email       VARCHAR(128) UNIQUE,
	    name        VARCHAR(128),
	    PRIMARY KEY(account_id)
	) ENGINE=InnoDB CHARACTER SET=utf8;

	CREATE TABLE Course (
	    course_id     INTEGER NOT NULL AUTO_INCREMENT,
	    title         VARCHAR(128) UNIQUE,
	    PRIMARY KEY(course_id)
	) ENGINE=InnoDB CHARACTER SET=utf8;

	CREATE TABLE Member (
	    account_id    INTEGER,
	    course_id     INTEGER,
	    role          INTEGER,
	    -- role=1(stands for teacher) ,, role=0(stands for student)

	    CONSTRAINT FOREIGN KEY (account_id) REFERENCES Account (account_id)
	      ON DELETE CASCADE ON UPDATE CASCADE,
	    CONSTRAINT FOREIGN KEY (course_id) REFERENCES Course (course_id)
	       ON DELETE CASCADE ON UPDATE CASCADE,

	    PRIMARY KEY (account_id, course_id)
	) ENGINE=InnoDB CHARACTER SET=utf8;

	INSERT INTO Account (name, email) VALUES ('Jane', 'jane@tsugi.org');
	INSERT INTO Account (name, email) VALUES ('Ed', 'ed@tsugi.org');
	INSERT INTO Account (name, email) VALUES ('Sue', 'sue@tsugi.org');

	INSERT INTO Course (title) VALUES ('Python');
	INSERT INTO Course (title) VALUES ('SQL');
	INSERT INTO Course (title) VALUES ('PHP');

	INSERT INTO Member (account_id, course_id, role) VALUES (1, 1, 1);
	INSERT INTO Member (account_id, course_id, role) VALUES (2, 1, 0);
	INSERT INTO Member (account_id, course_id, role) VALUES (3, 1, 0);

	INSERT INTO Member (account_id, course_id, role) VALUES (1, 2, 0);
	INSERT INTO Member (account_id, course_id, role) VALUES (2, 2, 1);

	INSERT INTO Member (account_id, course_id, role) VALUES (2, 3, 1);
	INSERT INTO Member (account_id, course_id, role) VALUES (3, 3, 0);

	SELECT Account.name, Member.role, Course.title
	  FROM Account JOIN Member JOIN Course
	  ON Member.account_id = Account.account_id
	    AND Member.course_id = Course.course_id
	  ORDER BY Course.title, Member.role DESC, Account.name