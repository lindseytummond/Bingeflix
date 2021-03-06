DROP DATABASE IF EXISTS reviews_db;
CREATE DATABASE reviews_db;

USE reviews_db;

CREATE TABLE Users (
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  createdAt datetime,
  updatedAt datetime,
  PRIMARY KEY (id)
);


CREATE TABLE Reviews (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  description VARCHAR(300) NOT NULL,
  createdAt datetime,
  updatedAt datetime,
  hostId INT,
  UserId INT,
  PRIMARY KEY (id),
  FOREIGN KEY (hostId) REFERENCES Users (id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (UserId) REFERENCES Users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE UserReviews (
  id INT NOT NULL AUTO_INCREMENT,
  createdAt datetime,
  updatedAt datetime,
  ReviewId INTEGER, 
  UserId INTEGER,
  PRIMARY KEY (id), 
  FOREIGN KEY (ReviewId) REFERENCES Reviews (id) ON DELETE CASCADE ON UPDATE CASCADE, 
  FOREIGN KEY (UserId)  REFERENCES Users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

