USE ServiceStation

CREATE TABLE Roles
(
	Id INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50) NOT NULL
)

CREATE TABLE Users
(
	Id INT PRIMARY KEY IDENTITY,
	Role_id INT NOT NULL,
	FullName VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Password VARCHAR(255) NOT NULL,
	Status VARCHAR(100) NOT NULL,
	FOREIGN KEY (Role_id) REFERENCES Roles(Id) ON DELETE CASCADE
)

CREATE TABLE User_Logs
(
	Id INT PRIMARY KEY IDENTITY,
	User_id INT NOT NULL,
	Message VARCHAR(300),
	FOREIGN KEY (User_id) REFERENCES Users(Id) ON DELETE CASCADE
)

CREATE TABLE Vehicle_Type
(
	Id INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50) NOT NULL
)

CREATE TABLE Vehicles
(
	Id INT PRIMARY KEY IDENTITY,
	User_Id INT NOT NULL,
	Vehicle_Type_Id INT NOT NULL,
	Brand VARCHAR(50) NOT NULL,
	Vehicle_Number VARCHAR(50) NOT NULL,
	FOREIGN KEY (User_id) REFERENCES Users(Id) ON DELETE CASCADE,
	FOREIGN KEY (Vehicle_Type_id) REFERENCES Vehicle_Type(Id) ON DELETE CASCADE
)

CREATE TABLE Service_Type
(
	Id INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50) NOT NULL
)

CREATE TABLE Service_Description
(
	Id INT PRIMARY KEY IDENTITY,
	Start_Date DATE NOT NULL,
	End_Date DATE NOT NULL,
	Status VARCHAR(100) NOT NULL,
	Comment VARCHAR(300),
	Price DECIMAL NOT NULL,
)

CREATE TABLE Services
(
	Id INT PRIMARY KEY IDENTITY,
	Service_Type_Id INT NOT NULL,
	Service_Description_Id INT NOT NULL UNIQUE,
	Name VARCHAR(300) NOT NULL,
	FOREIGN KEY (Service_Type_Id) REFERENCES Service_Type(Id) ON DELETE CASCADE,
	FOREIGN KEY (Service_Description_Id) REFERENCES Service_Description(Id) ON DELETE CASCADE,
)

CREATE TABLE Vehicles_Services
(
	Id INT PRIMARY KEY IDENTITY,
	Vehicle_id INT NOT NULL,
	Service_id INT NOT NULL,
	FOREIGN KEY (Vehicle_id) REFERENCES Vehicles(Id) ON DELETE CASCADE,
	FOREIGN KEY (Service_id) REFERENCES Services(Id) ON DELETE CASCADE
)

CREATE TABLE Orders
(
	Id INT PRIMARY KEY IDENTITY,
	User_Id INT NOT NULL,
	Number VARCHAR(10) NOT NULL,
	Price DECIMAL NOT NULL,
	FOREIGN KEY (User_id) REFERENCES Users(Id) ON DELETE CASCADE
)

CREATE TABLE Orders_Services
(
	Id INT PRIMARY KEY IDENTITY,
	Order_id INT NOT NULL,
	Service_id INT NOT NULL,
	FOREIGN KEY (Order_id) REFERENCES Orders(Id) ON DELETE CASCADE,
	FOREIGN KEY (Service_id) REFERENCES Services(Id) ON DELETE CASCADE
)