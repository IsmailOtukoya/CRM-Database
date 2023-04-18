CREATE DATABASE CRM;
GO

USE CRM;
GO

CREATE TABLE Customers (
    CustomerID int PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Email varchar(100) NOT NULL,
    Phone varchar(20) NOT NULL,
    Address varchar(200) NOT NULL,
    City varchar(50) NOT NULL,
    State varchar(50) NOT NULL,
    ZipCode varchar(10) NOT NULL
);
GO

CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    CustomerID int NOT NULL,
    OrderDate date NOT NULL,
    TotalAmount decimal(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

CREATE TABLE OrderDetails (
    OrderDetailID int PRIMARY KEY,
    OrderID int NOT NULL,
    ProductName varchar(100) NOT NULL,
    Quantity int NOT NULL,
    Price decimal(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
GO
