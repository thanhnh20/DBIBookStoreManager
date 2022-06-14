CREATE DATABASE BookStoreManager

CREATE TABLE tblAccount(
	username varchar(50) NOT NULL,
	password varchar(20) NOT NULL,
	fullName nvarchar(50) NOT NULL,
	isRole bit NOT NULL,
	PRIMARY KEY(username)
);

CREATE TABLE tblUser(
	userID int identity(1,1) NOT NULL,
	address nvarchar(200) ,
	birthday date ,
	phoneNumber varchar(10),
	username varchar(50) NOT NULL UNIQUE,
	PRIMARY KEY(userID)
);



ALTER TABLE tblUser
ADD CONSTRAINT FK_USER_ACCOUNT FOREIGN KEY(username)
REFERENCES tblAccount(username)

CREATE TABLE tblOrder(
	orderID char(6) NOT NULL,
	purchaseDate date NOT NULL,
	username varchar(50) NOT NULL,
	PRIMARY KEY(orderID) 
);

ALTER TABLE tblOrder
ADD CONSTRAINT FK_ORDER_ACCOUNT FOREIGN KEY(username)
REFERENCES tblAccount(username)


CREATE TABLE tblBook(
	bookID varchar(50) NOT NULL,
	bookName varchar(100) NOT NULL,
	imagePath varchar(300) NOT NULL,
	quantity int NOT NULL,
	price int NOT NULL,
	status bit NOT NULL,
	PRIMARY KEY(bookID)
);

CREATE TABLE tblOrder_Details(
	idOrder_Details int identity (1,1) NOT NULL,
	quantity int NOT NULL,
	totalPrice int NOT NULL,
	orderID char(6) NOT NULL,
	bookID varchar(50) NOT NULL,
	PRIMARY KEY(idOrder_Details)
);

ALTER TABLE tblOrder_Details
ADD CONSTRAINT FK_ORDER_DETAILS_ORDERS FOREIGN KEY(orderID)
REFERENCES tblOrder(orderID)


ALTER TABLE tblOrder_Details
ADD CONSTRAINT FK_ORDER_DETAILS_BOOK FOREIGN KEY(bookID)
REFERENCES tblBook(bookID)