DROP DATABASE IF EXISTS bingeflix_db;
CREATE DATABASE bingeflix_db;

USE bingeflix_db;

CREATE TABLE Users (
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(50) NOT NULL,
  createdAt datetime,
  updatedAt datetime,
  PRIMARY KEY (id)
);