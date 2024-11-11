CREATE DATABASE FinancialOptimizationDB;
GO
USE FinancialOptimizationDB;
GO

--Creating all the necessary tables for the Finance and  Accounting Department
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY,
    DepartmentName NVARCHAR(100) NOT NULL,
    ManagerName NVARCHAR(100),
    Budget FLOAT
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    TransactionDate DATE NOT NULL,
    Amount FLOAT NOT NULL,
    Description NVARCHAR(255),
    ApprovalStatus NVARCHAR(50) DEFAULT 'Pending'
);

CREATE TABLE Budgets (
    BudgetID INT PRIMARY KEY IDENTITY,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    Year INT,
    AllocatedBudget FLOAT,
    ActualSpent FLOAT DEFAULT 0
);

CREATE TABLE ForecastedTransactions (
    ForecastID INT PRIMARY KEY IDENTITY,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    ForecastDate DATE,
    ForecastedAmount FLOAT
);

CREATE TABLE AuditLog (
    LogID INT PRIMARY KEY IDENTITY,
    UserID NVARCHAR(50),
    Action NVARCHAR(255),
    ActionTime DATETIME DEFAULT GETDATE()
);

CREATE TABLE ExceptionReports (
    ExceptionID INT PRIMARY KEY IDENTITY,
    ErrorMessage NVARCHAR(255),
    ErrorTime DATETIME DEFAULT GETDATE()
);