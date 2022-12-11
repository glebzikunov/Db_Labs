USE ServiceStation

SELECT * FROM Vehicles

SELECT Brand FROM Vehicles
WHERE Vehicle_Type_Id = 1

SELECT * FROM Users

SELECT 
'( ' + FullName + ' )' + ' ('+ Email +') ' + ' (' + Phone + ') 'AS Contact_Info,
Role_id
FROM Users

UPDATE Users
SET Password = 'Password_123456789'
WHERE FullName LIKE 'Sakov%'

SELECT * FROM Orders

UPDATE Orders
SET Price = Price + 100

SELECT Price FROM Orders
ORDER BY Price

SELECT * FROM Service_Description

UPDATE Service_Description
SET Status = 'Ready'
FROM 
(SELECT * FROM Service_Description WHERE Status = 'Not Ready') AS Selected
WHERE Service_Description.Id = Selected.Id 

SELECT Id, 
(SELECT FullName FROM Users WHERE Users.Id = Vehicles.User_Id) AS UserName
FROM Vehicles
ORDER BY UserName

SELECT * FROM Orders
WHERE Price BETWEEN 350 AND 420