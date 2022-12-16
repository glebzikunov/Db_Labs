USE ServiceStation

GO

CREATE PROCEDURE AddUser
(
	@role VARCHAR(50),
	@fullname VARCHAR(50),
	@phone VARCHAR(50),
	@email VARCHAR(50),
	@password VARCHAR(255),
	@status VARCHAR(100)
)
AS
BEGIN
	INSERT INTO Users(Role_id, FullName, Phone, Email, Password, Status)
	VALUES ((SELECT Id FROM Roles WHERE Name=@role), @fullname, @phone, @email, @password, @status)
	PRINT 'New User data added.'
END;

GO

CREATE PROCEDURE AddVehicleType
(
	@name VARCHAR(50)
)
AS
BEGIN
	INSERT INTO Vehicle_Type(Name)
	VALUES (@name)
	PRINT 'New Vehicle Type data added.'
END;

GO

CREATE PROCEDURE AddVehicle
(
	@user_id INT,
	@vehicle_type_id INT,
	@brand VARCHAR(50),
	@vehicle_number VARCHAR(50)
)
AS
BEGIN
	INSERT INTO Vehicles(User_Id, Vehicle_Type_Id, Brand, Vehicle_Number)
	VALUES (@user_id, @vehicle_type_id, @brand, @vehicle_number)
	PRINT 'New Vehicle data added.'
END;

GO

CREATE PROCEDURE AddOrder
	@user_id INT,
	@number VARCHAR(10),
	@price DECIMAL
AS
BEGIN
	INSERT INTO Orders(User_Id, Number, Price)
	VALUES(@user_id, @number, @price)
	PRINT 'New Order data added.'
END; 

GO

CREATE PROCEDURE DeleteVehicleType
(
	@name VARCHAR(50)
)
AS
BEGIN
	DELETE Vehicle_Type
	WHERE Name = @name;
	PRINT 'Vehicle Type data deleted.'
END;

GO

CREATE PROCEDURE DeleteVehicle
(
	@id INT
)
AS
BEGIN
	DELETE Vehicles
	WHERE Id = @id;
	PRINT 'Vehicle data deleted.'
END;

GO

CREATE PROCEDURE DeleteOrder
(
	@number VARCHAR(10)
)
AS
BEGIN
	DELETE Orders
	WHERE Number = @number;
	PRINT 'Order data deleted.'
END;

GO

CREATE PROCEDURE UserSummary
AS
BEGIN
	SELECT Email, Password,
	(SELECT Name FROM Roles WHERE Role_id = Roles.Id) AS Role
	FROM Users
END;

GO

CREATE PROC VehiclesSummary
AS
BEGIN 
	SELECT User_Id, Vehicle_Type_Id, Brand, Vehicle_Number FROM Vehicles
	WHERE Vehicle_Type_Id = 1
END;

GO

CREATE PROCEDURE ShowLogs
AS
BEGIN
	SELECT User_id, Message
	FROM User_Logs
END;