USE ServiceStation

INSERT INTO Roles (Name) VALUES ('Admin')
INSERT INTO Roles (Name) VALUES ('Moderator')
INSERT INTO Roles (Name) VALUES ('Customer')

INSERT INTO Users (FullName, Phone, Email, Password, Status, Role_id) VALUES
(
	'Zikunov Gleb',
	'+375297153247',
	'zikunovga@gmail.com', 
	'adminpassword',
	'Active', 
	1
)/*admin*/

INSERT INTO Users (FullName, Phone, Email, Password, Status, Role_id) VALUES
(
	'Dolgih Pavel',
	'+375291234567',
	'dolgihpavel@gmail.com',
	'Pavel_Password',
	'Active', 
	2
)

INSERT INTO Users (FullName, Phone, Email, Password, Status, Role_id) VALUES
(
	'Dolgih Dmitriy',
	'+375292345678',
	'dolgihdmitriy@gmail.com',
	'Dmitriy_Password', 
	'Active', 
	2
)

INSERT INTO Users (FullName, Phone, Email, Password, Status, Role_id) VALUES
(
	'Sakov Nikolai',
	'+375293456789',
	'sakovnikolai@gmail.com',
	'Nikolai_Password', 
	'Not Active', 
	3
)

INSERT INTO Users (FullName, Phone, Email, Password, Status, Role_id) VALUES
(
	'Vladislav Gorojankin',
	'+375294567890',
	'gorojankinvladislav@gmail.com',
	'Vladislav_Password', 
	'Not Active', 
	3
)

INSERT INTO User_Logs (User_id, Message) VALUES (1, 'Admin added vehicle')
INSERT INTO User_Logs (User_id, Message) VALUES (2, 'Moderator changed vehicle')
INSERT INTO User_Logs (User_id, Message) VALUES (3, 'Moderator changed service')
INSERT INTO User_Logs (User_id, Message) VALUES (4, 'User checked service status')

INSERT INTO Vehicle_Type(Name) VALUES
(
	'Car'
)

INSERT INTO Vehicle_Type(Name) VALUES
(
	'Motorcycle'
)

INSERT INTO Vehicles(User_id, Vehicle_Type_Id, Brand, Vehicle_Number) VALUES
(
	'4',
	'1',
	'Audi Q8',
	'1234 AB-1' 
)

INSERT INTO Vehicles(User_id, Vehicle_Type_Id, Brand, Vehicle_Number) VALUES
(
	'4',
	'2',
	'Suzuki ZRX',
	'2345 BC-2' 
)

INSERT INTO Vehicles(User_id, Vehicle_Type_Id, Brand, Vehicle_Number) VALUES
(
	'5',
	'1',
	'BMW M5',
	'3456 CD-3' 
)

INSERT INTO Service_Type(Name) VALUES
(
	'Inside'
)

INSERT INTO Service_Type(Name) VALUES
(
	'Outside'
)

INSERT INTO Service_Description(Start_Date, End_Date, Status, Comment, Price) VALUES
(
	'2022-12-06',
	'2022-12-07',
	'Not ready',
	'Comment one',
	'100'
)

INSERT INTO Service_Description(Start_Date, End_Date, Status, Comment, Price) VALUES
(
	'2022-12-07',
	'2022-12-08',
	'Not ready',
	'Comment two',
	'150'
)

INSERT INTO Services(Service_Type_Id, Service_Description_Id, Name) VALUES
(
	'2',
	'1',
	'Change vehicle color' 
)

INSERT INTO Services(Service_Type_Id, Service_Description_Id, Name) VALUES
(
	'1',
	'2',
	'Repair engine' 
)

INSERT INTO Vehicles_Services(Vehicle_id, Service_id) VALUES ('1', '1')
INSERT INTO Vehicles_Services(Vehicle_id, Service_id) VALUES ('2', '1')

INSERT INTO Orders(User_Id, Number, Price) VALUES
(
	'4',
	'123456789',
	'100' 
)

INSERT INTO Orders(User_Id, Number, Price) VALUES
(
	'5',
	'234567890',
	'150' 
)

INSERT INTO Orders_Services(Order_id, Service_id) VALUES ('1', '1')
INSERT INTO Orders_Services(Order_id, Service_id) VALUES ('2', '2')