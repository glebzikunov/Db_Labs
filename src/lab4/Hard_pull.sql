USE ServiceStation

--select users who placed order with price > avg
SELECT Users.Email, Price, Number, Roles.Name AS Role FROM Orders
LEFT JOIN Users ON Orders.User_Id = Users.id
LEFT JOIN Roles ON Users.Role_id = Roles.id
WHERE Price > (SELECT AVG(Price) FROM Orders)


--Users who placed more than 1 order
SELECT Email, COUNT(*) AS Orders_Count FROM Orders
LEFT JOIN Users ON Orders.User_Id = Users.Id
GROUP BY Email
HAVING COUNT(*) > 1


--Cross Join
SELECT Users.FullName AS UserName, Vehicles.Brand FROM Users
CROSS JOIN Vehicles
WHERE Role_id = 3


--Union select
SELECT Vehicles.Brand AS Vehicle FROM Vehicles
UNION SELECT Name FROM Vehicle_Type


--Select orders and show service names from the orders
SELECT Orders.Number, Users.FullName, Services.Name
FROM Orders
JOIN Users ON Users.id=Orders.User_Id
JOIN Orders_Services ON Orders_Services.Order_id=Orders.Id
JOIN Services ON Orders_Services.Service_id= Services.Id


--Select users and show count of orders of every user,who placed order
SELECT FullName, Email, COUNT(Orders.Id) as OrdersCount
FROM Users
JOIN Orders ON Orders.User_Id = Users.id
GROUP BY Users.Id, Users.FullName, Users.Email;


--Select users and show count of orders of every user
SELECT FullName, Email, COUNT(Orders.Id) as OrdersCount
FROM Users
LEFT JOIN Orders ON Orders.User_Id = Users.id
GROUP BY Users.Id, Users.FullName, Users.Email;


--Select every order and show who placed order
SELECT Orders.Id, Orders.Price, Users.Email
FROM Orders
INNER JOIN Users ON Orders.User_Id = Users.Id


--range services depending on status
SELECT Service_Description.Id, 
	CASE Status
		WHEN 'Not ready' THEN 'Still not ready'
		WHEN 'Ready' THEN 'Ready to take'
		ELSE 'Unknown'
	END AS ServiceStatus
FROM Service_Description


--range orders depending on price
SELECT Price, Number,
IIF(Price > 500,'Expensive','Cheap') AS Information
FROM Orders


--select logs, users who place order, role of user, order number, price
SELECT Message, Users.Email, Roles.Name AS Role, 
Orders.Number, Orders.Price
FROM User_Logs
JOIN Users ON User_Logs.User_id = Users.Id
RIGHT JOIN Roles ON Users.Role_id = Roles.Id
LEFT JOIN Orders ON Orders.User_Id = Users.id
WHERE Roles.name LIKE 'Customer'