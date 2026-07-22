create database BankingDB;
use BankingDB;
create table Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    City VARCHAR(50),
    IFSCCode VARCHAR(20)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(12,2),
    OpenDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    BranchID INT,
    EmployeeName VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(20),
    Amount DECIMAL(12,2),
    TransactionDate DATETIME,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanAmount DECIMAL(12,2),
    InterestRate DECIMAL(5,2),
    LoanType VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Customers
VALUES
(1,'Rahul','Patel','Male','1995-05-15','9876543210','rahul@gmail.com','Ahmedabad'),
(2,'Priya','Sharma','Female','1998-03-10','9876543211','priya@gmail.com','Vadodara');

select * from customers;
INSERT INTO Branches
VALUES
(101,'Main Branch','Ahmedabad','SBIN0001234'),
(102,'City Branch','Vadodara','SBIN0005678');

select * from Branches;

INSERT INTO Accounts
VALUES
(1001,1,101,'Savings',50000,'2025-01-01'),
(1002,2,102,'Current',120000,'2025-02-15');

INSERT INTO Transactions
VALUES
(1,1001,'Deposit',10000,'2025-07-01 10:30:00'),
(2,1002,'Withdrawal',5000,'2025-07-02 15:45:00');

INSERT INTO Employees
VALUES
(501,101,'Rakesh Kumar','Manager',65000),

(502,102,'Neha Patel','Cashier',35000);
SELECT * FROM Employees;
SELECT * FROM Transactions;
SELECT * FROM Accounts;

SHOW TABLES;

INSERT INTO Loans
VALUES
(1,1,500000,8.5,'Home Loan'),

(2,2,250000,10.5,'Car Loan');

SELECT * FROM Loans;

SELECT * FROM Customers
WHERE Address='Ahmedabad';

SELECT * FROM Accounts
WHERE Balance>50000;

SELECT EmployeeName,Salary
FROM Employees;

SELECT *
FROM Customers
ORDER BY FirstName;

SELECT COUNT(*) AS TotalCustomers
FROM Customers;
SELECT MAX(Balance)
FROM Accounts;
select min(Balance)
from Accounts;
select avg(Balance)
from Accounts;
SELECT SUM(Balance)
FROM Accounts;
SELECT
Customers.FirstName,
Accounts.AccountType,
Accounts.Balance
FROM Customers
JOIN Accounts
ON Customers.CustomerID=Accounts.CustomerID;
select 
Branches.Branchname,
employees.employeename
from branches
join employees
on branches.branchID=employees.branchID;
DESC Customers;
DESC Branches;
