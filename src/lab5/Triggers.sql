USE ServiceStation

GO

CREATE TRIGGER USER_INSERT
ON Users
AFTER INSERT
AS
INSERT INTO User_Logs(User_id, Message)
SELECT Id, 'Created User ' +  Email
FROM INSERTED

GO

CREATE TRIGGER STATUS_UPDATE
ON Users
AFTER UPDATE
AS
INSERT INTO User_Logs(User_id, Message)
SELECT Id, 'User is ' + Status
FROM INSERTED

GO

CREATE TRIGGER ORDER_INSERT
ON Orders
AFTER INSERT
AS
INSERT INTO User_Logs(User_id, Message)
SELECT User_Id, 'Order created by ' +  (SELECT Email FROM Users WHERE User_Id = Users.Id)
FROM INSERTED

GO

CREATE TRIGGER VEHICLE_DELETE
ON Vehicles
AFTER DELETE
AS
INSERT INTO User_Logs(User_id, Message)
SELECT User_Id, 'Vehicle deleted by ' +  (SELECT Email FROM Users WHERE User_Id = Users.Id)
FROM DELETED

GO

CREATE TRIGGER ORDER_DELETE
ON Orders
AFTER DELETE
AS
INSERT INTO User_Logs(User_id, Message)
SELECT User_Id, 'Deleted order ' +  Number
FROM DELETED