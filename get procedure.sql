CREATE PROCEDURE dbo.sp_SetUser
    @user_id INT = NULL OUTPUT,
    @first_name VARCHAR(50) = NULL,
    @last_name VARCHAR(50) = NULL,
    @email VARCHAR(100) = NULL,
    @phone VARCHAR(15) = NULL,
    @date_of_birth DATE = NULL,
    @membership_start DATE = NULL,
    @membership_end DATE = NULL
AS
BEGIN
    BEGIN TRY
        IF @user_id IS NULL
        BEGIN
            SET @user_id = 1 + ISNULL((SELECT TOP(1) user_id FROM dbo.Users ORDER BY user_id DESC), 0)
            INSERT dbo.Users(user_id, first_name, last_name, email, phone, date_of_birth, membership_start, membership_end)
            VALUES(@user_id, @first_name, @last_name, @email, @phone, @date_of_birth, @membership_start, @membership_end)
        END
        ELSE
            UPDATE TOP(1) dbo.Users
            SET first_name = ISNULL(@first_name, first_name),
                last_name = ISNULL(@last_name, last_name),
                email = ISNULL(@email, email),
                phone = ISNULL(@phone, phone),
                date_of_birth = ISNULL(@date_of_birth, date_of_birth),
                membership_start = ISNULL(@membership_start, membership_start),
                membership_end = ISNULL(@membership_end, membership_end)
            WHERE user_id = @user_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetTrainer
    @trainer_id INT = NULL OUTPUT,
    @first_name VARCHAR(50) = NULL,
    @last_name VARCHAR(50) = NULL,
    @specialization VARCHAR(100) = NULL,
    @email VARCHAR(100) = NULL,
    @phone VARCHAR(15) = NULL,
    @salary DECIMAL(10, 2) = NULL
AS
BEGIN
    BEGIN TRY
        IF @trainer_id IS NULL
        BEGIN
            SET @trainer_id = 1 + ISNULL((SELECT TOP(1) trainer_id FROM dbo.Trainers ORDER BY trainer_id DESC), 0)
            INSERT dbo.Trainers(trainer_id, first_name, last_name, specialization, email, phone, salary)
            VALUES(@trainer_id, @first_name, @last_name, @specialization, @email, @phone, @salary)
        END
        ELSE
            UPDATE TOP(1) dbo.Trainers
            SET first_name = ISNULL(@first_name, first_name),
                last_name = ISNULL(@last_name, last_name),
                specialization = ISNULL(@specialization, specialization),
                email = ISNULL(@email, email),
                phone = ISNULL(@phone, phone),
                salary = ISNULL(@salary, salary)
            WHERE trainer_id = @trainer_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetMembership
    @membership_id INT = NULL OUTPUT,
    @membership_type VARCHAR(50) = NULL,
    @price DECIMAL(10, 2) = NULL,
    @description TEXT = NULL,
    @validity_period INT = NULL
AS
BEGIN
    BEGIN TRY
        IF @membership_id IS NULL
        BEGIN
            SET @membership_id = 1 + ISNULL((SELECT TOP(1) membership_id FROM dbo.Memberships ORDER BY membership_id DESC), 0)
            INSERT dbo.Memberships(membership_id, membership_type, price, description, validity_period)
            VALUES(@membership_id, @membership_type, @price, @description, @validity_period)
        END
        ELSE
            UPDATE TOP(1) dbo.Memberships
            SET membership_type = ISNULL(@membership_type, membership_type),
                price = ISNULL(@price, price),
                description = ISNULL(@description, description),
                validity_period = ISNULL(@validity_period, validity_period)
            WHERE membership_id = @membership_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetClassActivity
    @class_id INT = NULL OUTPUT,
    @class_name VARCHAR(100) = NULL,
    @class_type VARCHAR(20) = NULL,
    @schedule VARCHAR(50) = NULL,
    @duration INT = NULL,
    @capacity INT = NULL
AS
BEGIN
    BEGIN TRY
        IF @class_id IS NULL
        BEGIN
            SET @class_id = 1 + ISNULL((SELECT TOP(1) class_id FROM dbo.Class_Activities ORDER BY class_id DESC), 0)
            INSERT dbo.Class_Activities(class_id, class_name, class_type, schedule, duration, capacity)
            VALUES(@class_id, @class_name, @class_type, @schedule, @duration, @capacity)
        END
        ELSE
            UPDATE TOP(1) dbo.Class_Activities
            SET class_name = ISNULL(@class_name, class_name),
                class_type = ISNULL(@class_type, class_type),
                schedule = ISNULL(@schedule, schedule),
                duration = ISNULL(@duration, duration),
                capacity = ISNULL(@capacity, capacity)
            WHERE class_id = @class_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetClassSchedule
    @schedule_id INT = NULL OUTPUT,
    @class_id INT = NULL,
    @trainer_id INT = NULL,
    @date DATE = NULL,
    @time TIME = NULL
AS
BEGIN
    BEGIN TRY
        IF @schedule_id IS NULL
        BEGIN
            SET @schedule_id = 1 + ISNULL((SELECT TOP(1) schedule_id FROM dbo.Class_Schedule ORDER BY schedule_id DESC), 0)
            INSERT dbo.Class_Schedule(schedule_id, class_id, trainer_id, date, time)
            VALUES(@schedule_id, @class_id, @trainer_id, @date, @time)
        END
        ELSE
            UPDATE TOP(1) dbo.Class_Schedule
            SET class_id = ISNULL(@class_id, class_id),
                trainer_id = ISNULL(@trainer_id, trainer_id),
                date = ISNULL(@date, date),
                time = ISNULL(@time, time)
            WHERE schedule_id = @schedule_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetClassRegistration
    @registration_id INT = NULL OUTPUT,
    @user_id INT = NULL,
    @class_id INT = NULL,
    @registration_date DATE = NULL
AS
BEGIN
    BEGIN TRY
        IF @registration_id IS NULL
        BEGIN
            SET @registration_id = 1 + ISNULL((SELECT TOP(1) registration_id FROM dbo.Class_Registrations ORDER BY registration_id DESC), 0)
            INSERT dbo.Class_Registrations(registration_id, user_id, class_id, registration_date)
            VALUES(@registration_id, @user_id, @class_id, @registration_date)
        END
        ELSE
            UPDATE TOP(1) dbo.Class_Registrations
            SET user_id = ISNULL(@user_id, user_id),
                class_id = ISNULL(@class_id, class_id),
                registration_date = ISNULL(@registration_date, registration_date)
            WHERE registration_id = @registration_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetPayment
    @payment_id INT = NULL OUTPUT,
    @user_id INT = NULL,
    @membership_id INT = NULL,
    @amount DECIMAL(10, 2) = NULL,
    @payment_date DATE = NULL,
    @payment_method VARCHAR(50) = NULL
AS
BEGIN
    BEGIN TRY
        IF @payment_id IS NULL
        BEGIN
            SET @payment_id = 1 + ISNULL((SELECT TOP(1) payment_id FROM dbo.Payments ORDER BY payment_id DESC), 0)
            INSERT dbo.Payments(payment_id, user_id, membership_id, amount, payment_date, payment_method)
            VALUES(@payment_id, @user_id, @membership_id, @amount, @payment_date, @payment_method)
        END
        ELSE
            UPDATE TOP(1) dbo.Payments
            SET user_id = ISNULL(@user_id, user_id),
                membership_id = ISNULL(@membership_id, membership_id),
                amount = ISNULL(@amount, amount),
                payment_date = ISNULL(@payment_date, payment_date),
                payment_method = ISNULL(@payment_method, payment_method)
            WHERE payment_id = @payment_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetEquipmentRental
    @rental_id INT = NULL OUTPUT,
    @user_id INT = NULL,
    @equipment VARCHAR(100) = NULL,
    @rental_date DATE = NULL,
    @return_date DATE = NULL
AS
BEGIN
    BEGIN TRY
        IF @rental_id IS NULL
        BEGIN
            SET @rental_id = 1 + ISNULL((SELECT TOP(1) rental_id FROM dbo.Equipment_Rentals ORDER BY rental_id DESC), 0)
            INSERT dbo.Equipment_Rentals(rental_id, user_id, equipment, rental_date, return_date)
            VALUES(@rental_id, @user_id, @equipment, @rental_date, @return_date)
        END
        ELSE
            UPDATE TOP(1) dbo.Equipment_Rentals
            SET user_id = ISNULL(@user_id, user_id),
                equipment = ISNULL(@equipment, equipment),
                rental_date = ISNULL(@rental_date, rental_date),
                return_date = ISNULL(@return_date, return_date)
            WHERE rental_id = @rental_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetFeedback
    @feedback_id INT = NULL OUTPUT,
    @user_id INT = NULL,
    @trainer_id INT = NULL,
    @rating INT = NULL,
    @comments TEXT = NULL,
    @date DATE = NULL
AS
BEGIN
    BEGIN TRY
        IF @feedback_id IS NULL
        BEGIN
            SET @feedback_id = 1 + ISNULL((SELECT TOP(1) feedback_id FROM dbo.Feedback ORDER BY feedback_id DESC), 0)
            INSERT dbo.Feedback(feedback_id, user_id, trainer_id, rating, comments, date)
            VALUES(@feedback_id, @user_id, @trainer_id, @rating, @comments, @date)
        END
        ELSE
            UPDATE TOP(1) dbo.Feedback
            SET user_id = ISNULL(@user_id, user_id),
                trainer_id = ISNULL(@trainer_id, trainer_id),
                rating = ISNULL(@rating, rating),
                comments = ISNULL(@comments, comments),
                date = ISNULL(@date, date)
            WHERE feedback_id = @feedback_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetWorkoutProgram
    @program_id INT = NULL OUTPUT,
    @program_name VARCHAR(100) = NULL,
    @description TEXT = NULL,
    @trainer_id INT = NULL
AS
BEGIN
    BEGIN TRY
        IF @program_id IS NULL
        BEGIN
            SET @program_id = 1 + ISNULL((SELECT TOP(1) program_id FROM dbo.Workout_Programs ORDER BY program_id DESC), 0)
            INSERT dbo.Workout_Programs(program_id, program_name, description, trainer_id)
            VALUES(@program_id, @program_name, @description, @trainer_id)
        END
        ELSE
            UPDATE TOP(1) dbo.Workout_Programs
            SET program_name = ISNULL(@program_name, program_name),
                description = ISNULL(@description, description),
                trainer_id = ISNULL(@trainer_id, trainer_id)
            WHERE program_id = @program_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetProgramAssignment
    @assignment_id INT = NULL OUTPUT,
    @user_id INT = NULL,
    @program_id INT = NULL,
    @start_date DATE = NULL,
    @end_date DATE = NULL
AS
BEGIN
    BEGIN TRY
        IF @assignment_id IS NULL
        BEGIN
            SET @assignment_id = 1 + ISNULL((SELECT TOP(1) assignment_id FROM dbo.Program_Assignments ORDER BY assignment_id DESC), 0)
            INSERT dbo.Program_Assignments(assignment_id, user_id, program_id, start_date, end_date)
            VALUES(@assignment_id, @user_id, @program_id, @start_date, @end_date)
        END
        ELSE
            UPDATE TOP(1) dbo.Program_Assignments
            SET user_id = ISNULL(@user_id, user_id),
                program_id = ISNULL(@program_id, program_id),
                start_date = ISNULL(@start_date, start_date),
                end_date = ISNULL(@end_date, end_date)
            WHERE assignment_id = @assignment_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetEvent
    @event_id INT = NULL OUTPUT,
    @event_name VARCHAR(100) = NULL,
    @event_date DATE = NULL,
    @location VARCHAR(200) = NULL,
    @capacity INT = NULL,
    @description TEXT = NULL
AS
BEGIN
    BEGIN TRY
        IF @event_id IS NULL
        BEGIN
            SET @event_id = 1 + ISNULL((SELECT TOP(1) event_id FROM dbo.Events ORDER BY event_id DESC), 0)
            INSERT dbo.Events(event_id, event_name, event_date, location, capacity, description)
            VALUES(@event_id, @event_name, @event_date, @location, @capacity, @description)
        END
        ELSE
            UPDATE TOP(1) dbo.Events
            SET event_name = ISNULL(@event_name, event_name),
                event_date = ISNULL(@event_date, event_date),
                location = ISNULL(@location, location),
                capacity = ISNULL(@capacity, capacity),
                description = ISNULL(@description, description)
            WHERE event_id = @event_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetEventRegistration
    @registration_id INT = NULL OUTPUT,
    @user_id INT = NULL,
    @event_id INT = NULL,
    @registration_date DATE = NULL
AS
BEGIN
    BEGIN TRY
        IF @registration_id IS NULL
        BEGIN
            SET @registration_id = 1 + ISNULL((SELECT TOP(1) registration_id FROM dbo.Event_Registrations ORDER BY registration_id DESC), 0)
            INSERT dbo.Event_Registrations(registration_id, user_id, event_id, registration_date)
            VALUES(@registration_id, @user_id, @event_id, @registration_date)
        END
        ELSE
            UPDATE TOP(1) dbo.Event_Registrations
            SET user_id = ISNULL(@user_id, user_id),
                event_id = ISNULL(@event_id, event_id),
                registration_date = ISNULL(@registration_date, registration_date)
            WHERE registration_id = @registration_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END

CREATE PROCEDURE dbo.sp_SetNotification
    @notification_id INT = NULL OUTPUT,
    @user_id INT = NULL,
    @message TEXT = NULL,
    @notification_date DATE = NULL,
    @status VARCHAR(20) = NULL
AS
BEGIN
    BEGIN TRY
        IF @notification_id IS NULL
        BEGIN
            SET @notification_id = 1 + ISNULL((SELECT TOP(1) notification_id FROM dbo.Notifications ORDER BY notification_id DESC), 0)
            INSERT dbo.Notifications(notification_id, user_id, message, notification_date, status)
            VALUES(@notification_id, @user_id, @message, @notification_date, @status)
        END
        ELSE
            UPDATE TOP(1) dbo.Notifications
            SET user_id = ISNULL(@user_id, user_id),
                message = ISNULL(@message, message),
                notification_date = ISNULL(@notification_date, notification_date),
                status = ISNULL(@status, status)
            WHERE notification_id = @notification_id
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
