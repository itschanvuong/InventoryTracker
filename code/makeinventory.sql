CREATE DATABASE inventory;
USE inventory;
CREATE TABLE inventorytable(
	ID INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(255) NOT NULL,
    Quantity INT,
    Date VARCHAR(255),
    PRIMARY KEY (ID)
);

INSERT INTO inventorytable(Name)
VALUE ('PC'),('Monitor'),('Keyboard'),('Mouse'),('Phone');

INSERT INTO inventorytable(Quantity)
VALUE (0),(0),(0),(0),(0);

SELECT * FROM inventorytable;
