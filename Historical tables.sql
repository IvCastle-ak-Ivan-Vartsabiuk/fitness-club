-- Оновлюємо таблицю Memberships для підтримки SYSTEM VERSIONED
ALTER TABLE Memberships ADD
    ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN
        CONSTRAINT DF_Memberships_ValidFrom DEFAULT SYSUTCDATETIME(),
    ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN
        CONSTRAINT DF_Memberships_ValidTo DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
    PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo);
GO

-- Вмикаємо system-versioning з історичною таблицею
ALTER TABLE Memberships
    SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Memberships_History));
GO

-- Оновлюємо таблицю Class_Activities для підтримки SYSTEM VERSIONED
ALTER TABLE Class_Activities ADD
    ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN
        CONSTRAINT DF_Class_Activities_ValidFrom DEFAULT SYSUTCDATETIME(),
    ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN
        CONSTRAINT DF_Class_Activities_ValidTo DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
    PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo);
GO

-- Вмикаємо system-versioning з історичною таблицею
ALTER TABLE Class_Activities
    SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Class_Activities_History));
GO

-- Оновлюємо таблицю Trainers для підтримки SYSTEM VERSIONED
ALTER TABLE Trainers ADD
    ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN
        CONSTRAINT DF_Trainers_ValidFrom DEFAULT SYSUTCDATETIME(),
    ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN
        CONSTRAINT DF_Trainers_ValidTo DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
    PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo);
GO

-- Вмикаємо system-versioning з історичною таблицею
ALTER TABLE Trainers
    SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Trainers_History));
GO

SELECT *
FROM Class_Activities
WHERE ValidTo = '9999-12-31 23:59:59.9999999';

SELECT *
FROM Class_Activities_History
WHERE class_id = 1;

SELECT *
FROM Class_Activities
FOR SYSTEM_TIME FROM '2024-01-01 00:00:00' TO '2024-12-31 23:59:59';

SELECT 
    membership_id, 
    membership_type, 
    price, 
    ValidFrom, 
    ValidTo
FROM Memberships_History
WHERE membership_type = 'Premium';

SELECT 
    trainer_id, 
    first_name, 
    last_name, 
    specialization, 
    ValidFrom, 
    ValidTo
FROM Trainers_History
WHERE trainer_id = 3;






