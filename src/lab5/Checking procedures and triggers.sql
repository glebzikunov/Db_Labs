USE ServiceStation

EXEC AddUser 'Customer', 'New User FIO', '+375291234567', 'email@email.email', '12345', 'Not Active'

EXEC AddVehicleType 'Plane'

EXEC AddVehicle 1074, 1, 'Boing', '1234'

EXEC AddOrder 1074, '123abc', 100

EXEC DeleteVehicle 1026

EXEC DeleteVehicleType 'Plane'

EXEC DeleteOrder '123abc'

EXEC UserSummary

EXEC VehiclesSummary

EXEC ShowLogs