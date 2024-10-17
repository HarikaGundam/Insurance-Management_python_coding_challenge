CREATE DATABASE InsuranceManagementDB;
USE InsuranceManagementDB;

-- Create Users table
CREATE TABLE Users (
    userId INT PRIMARY KEY identity(101,1),
    username NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NOT NULL,
    role NVARCHAR(50) NOT NULL
);
INSERT INTO Users (username, password, role) VALUES
('Harika', 'harika123', 'admin'),
('Pooja', 'pooja456', 'customer'),
('Chandana', 'chandana789', 'agent'),
('Charitha', 'charitha012', 'manager')

-- Create Clients table
CREATE TABLE Clients (
    clientId INT PRIMARY KEY identity(201,1),
    clientName NVARCHAR(100) NOT NULL,
    contactInfo NVARCHAR(100) NOT NULL,
    policy NVARCHAR(100) NOT NULL
);


INSERT INTO Clients(clientname, contactinfo, policy) VALUES
('Rama', 'rama@email.com', 'Life Insurance'),
('Krishna', 'krishna@email.com', 'Auto Insurance'),
('Lakshmi', 'lakshmi@email.com', 'Home Insurance'),
('Likhith', 'likhith@email.com', 'Health Insurance')


-- Create Policies table
CREATE TABLE Policies (
    policyId INT PRIMARY KEY IDENTITY(1,1),
    policyName NVARCHAR(100) NOT NULL,
    policyDescription NVARCHAR(255) NOT NULL
);
-- Insert into Policies
INSERT INTO Policies (policyName, policyDescription)
VALUES ('Health Insurance', 'Covers medical expenses including hospital stays and treatments'),
       ('Auto Insurance', 'Covers damages to your car and third-party liability'),
       ('Life Insurance', 'Provides financial security to your family in case of your death'),
       ('Home Insurance', 'Covers damages to your home and belongings');
-- Create Claims table
CREATE TABLE Claims (
    claimId INT PRIMARY KEY identity(301,1),
    claimNumber NVARCHAR(100) NOT NULL,
    dateFiled DATE NOT NULL,
    claimAmount DECIMAL(10, 2) NOT NULL,
    status NVARCHAR(50) NOT NULL,
    clientId INT,
    policy NVARCHAR(100),
    FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);
INSERT INTO Claims (claimNumber, dateFiled, claimAmount, status, policy, clientId) VALUES
('CLM2024001', '2024-10-10', 1000.00, 'Aproved', 'Auto Insurance', 201),
('CLM2024002', '2024-10-15', 1500.00, 'Approved', 'Home Insurance', 202),
('CLM2024003', '2024-10-20', 3500.00, 'Rejected', 'Health Insurance', 203),
('CLM2024004', '2024-10-25', 5000.00, 'Pending', 'Life Insurance', 204)

-- Create Payments table
CREATE TABLE Payments (
    paymentId INT PRIMARY KEY identity(401,1),
    paymentDate DATE NOT NULL,
    paymentAmount DECIMAL(10, 2) NOT NULL,
    clientId INT,
    FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);
INSERT INTO Payments (paymentDate, paymentAmount, clientId) VALUES
('2024-10-01', 1500.00, 201),  -- Payment for Rama
('2024-10-02', 2500.00, 202),  -- Payment for krishna
('2024-10-03', 350.00, 203),   -- Payment for lakshmi
('2024-10-04', 4200.00, 204)   -- payment for likhith
SELECT * FROM Clients;
SELECT * FROM Users;
SELECT * FROM Claims;
SELECT * FROM Payments;
SELECT * FROM Policies;