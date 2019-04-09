DROP DATABASE baghchal;
CREATE DATABASE baghchal;
USE baghchal;

CREATE TABLE User (
	userID int NOT NULL,
    emailAddress varchar(50) NOT NULL,
    timeZone varchar(20) NOT NULL,
    dob datetime NULL,
    gender ENUM('M', 'F', 'O', 'N/A') NOT NULL,
    primary key(userID)
) engine = InnoDB;

CREATE TABLE LogIn (
	userID int NOT NULL,
    username varchar(20),
    password varchar(20),
    primary key(userID),
    foreign key (userID) references User (userID)
) engine = InnoDB;

CREATE TABLE Post (
	postID int NOT NULL,
    userID int NOT NULL,
    timestampUTC datetime NOT NULL,
    textContent varchar(250) NOT NULL,
    primary key (postID),
    foreign key (userID) references User (userID)
) engine = InnoDB;

CREATE TABLE Share(
	shareID int NOT NULL,
    userID int NOT NULL,
    childPostID int NOT NULL,
    timestampUTC datetime NOT NULL,
    textContent varchar(250) NULL,
    primary key (shareID),
    foreign key (userID) references User (userID),
    foreign key (childPostID) references Post (postID)
) engine = InnoDB;

SELECT * FROM User;
SELECT * FROM LogIn;
SELECT * FROM Post;
SELECT * FROM Share;