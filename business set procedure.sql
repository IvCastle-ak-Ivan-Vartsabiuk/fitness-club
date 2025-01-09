-- Реєстрація клієнтів
CREATE PROCEDURE dbo.sp_RegisterNewMember
    @member_id INT = NULL OUTPUT,
    @first_name NVARCHAR(50),
    @last_name NVARCHAR(50),
    @email VARCHAR(100),
    @phone VARCHAR(15),
    @date_of_birth DATE,
    @membership_start DATE,
    @membership_end DATE,
    @access_level INT,
    @card_key VARCHAR(20)
AS
BEGIN
BEGIN TRY
    IF @member_id IS NULL
    BEGIN
        SET @member_id = 1 + ISNULL((SELECT TOP(1) member_id FROM dbo.Members ORDER BY member_id DESC), 0)
        INSERT dbo.Members(member_id, first_name, last_name, email, phone, date_of_birth, membership_start, membership_end, access_level, card_key)
        VALUES(@member_id, @first_name, @last_name, @email, @phone, @date_of_birth, @membership_start, @membership_end, @access_level, @card_key)
    END
    ELSE
        UPDATE TOP(1) dbo.Members
        SET first_name = ISNULL(@first_name, first_name),
            last_name = ISNULL(@last_name, last_name),
            email = @email,
            phone = @phone,
            date_of_birth = ISNULL(@date_of_birth, date_of_birth),
            membership_start = ISNULL(@membership_start, membership_start),
            membership_end = ISNULL(@membership_end, membership_end),
            access_level = ISNULL(@access_level, access_level),
            card_key = ISNULL(@card_key, card_key)
        WHERE member_id = @member_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Адміністрування членства
CREATE PROCEDURE dbo.sp_ManageMembership
    @member_id INT,
    @membership_type VARCHAR(50),
    @price DECIMAL(10, 2),
    @renew_date DATE,
    @new_contact_info VARCHAR(100)
AS
BEGIN
BEGIN TRY
    UPDATE TOP(1) dbo.Members
    SET membership_type = @membership_type,
        price = @price,
        membership_end = @renew_date,
        contact_info = ISNULL(@new_contact_info, contact_info)
    WHERE member_id = @member_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Класові заняття
CREATE PROCEDURE dbo.sp_ScheduleClass
    @class_id INT = NULL OUTPUT,
    @class_name VARCHAR(100),
    @class_type VARCHAR(20),
    @schedule VARCHAR(50),
    @duration INT,
    @capacity INT
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

-- Особисті тренування
CREATE PROCEDURE dbo.sp_BookPersonalTraining
    @session_id INT = NULL OUTPUT,
    @user_id INT,
    @trainer_id INT,
    @date DATE,
    @time TIME
AS
BEGIN
BEGIN TRY
    IF @session_id IS NULL
    BEGIN
        SET @session_id = 1 + ISNULL((SELECT TOP(1) session_id FROM dbo.Personal_Training ORDER BY session_id DESC), 0)
        INSERT dbo.Personal_Training(session_id, user_id, trainer_id, date, time)
        VALUES(@session_id, @user_id, @trainer_id, @date, @time)
    END
    ELSE
        UPDATE TOP(1) dbo.Personal_Training
        SET user_id = @user_id,
            trainer_id = @trainer_id,
            date = ISNULL(@date, date),
            time = ISNULL(@time, time)
        WHERE session_id = @session_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Обладнання та інфраструктура
CREATE PROCEDURE dbo.sp_ManageEquipment
    @equipment_id INT = NULL OUTPUT,
    @name VARCHAR(100),
    @type VARCHAR(50),
    @status VARCHAR(20),
    @purchase_date DATE,
    @maintenance_date DATE
AS
BEGIN
BEGIN TRY
    IF @equipment_id IS NULL
    BEGIN
        SET @equipment_id = 1 + ISNULL((SELECT TOP(1) equipment_id FROM dbo.Equipment ORDER BY equipment_id DESC), 0)
        INSERT dbo.Equipment(equipment_id, name, type, status, purchase_date, maintenance_date)
        VALUES(@equipment_id, @name, @type, @status, @purchase_date, @maintenance_date)
    END
    ELSE
        UPDATE TOP(1) dbo.Equipment
        SET name = ISNULL(@name, name),
            type = ISNULL(@type, type),
            status = ISNULL(@status, status),
            purchase_date = ISNULL(@purchase_date, purchase_date),
            maintenance_date = ISNULL(@maintenance_date, maintenance_date)
        WHERE equipment_id = @equipment_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Залучення клієнтів
CREATE PROCEDURE dbo.sp_MarketingActivities
    @activity_id INT = NULL OUTPUT,
    @activity_name VARCHAR(100),
    @description TEXT,
    @discount DECIMAL(5, 2),
    @start_date DATE,
    @end_date DATE
AS
BEGIN
BEGIN TRY
    IF @activity_id IS NULL
    BEGIN
        SET @activity_id = 1 + ISNULL((SELECT TOP(1) activity_id FROM dbo.Marketing_Activities ORDER BY activity_id DESC), 0)
        INSERT dbo.Marketing_Activities(activity_id, activity_name, description, discount, start_date, end_date)
        VALUES(@activity_id, @activity_name, @description, @discount, @start_date, @end_date)
    END
    ELSE
        UPDATE TOP(1) dbo.Marketing_Activities
        SET activity_name = ISNULL(@activity_name, activity_name),
            description = ISNULL(@description, description),
            discount = ISNULL(@discount, discount),
            start_date = ISNULL(@start_date, start_date),
            end_date = ISNULL(@end_date, end_date)
        WHERE activity_id = @activity_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Зберігання даних і аналітика
CREATE PROCEDURE dbo.sp_AnalyzeClientProgress
    @user_id INT,
    @progress_date DATE,
    @workout_description TEXT,
    @goals VARCHAR(100)
AS
BEGIN
BEGIN TRY
    INSERT dbo.Client_Progress(user_id, progress_date, workout_description, goals)
    VALUES(@user_id, @progress_date, @workout_description, @goals)
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Обслуговування клієнтів
CREATE PROCEDURE dbo.sp_CustomerSupport
    @ticket_id INT = NULL OUTPUT,
    @user_id INT,
    @issue_description TEXT,
    @resolution TEXT,
    @status VARCHAR(20),
    @create_date DATE
AS
BEGIN
BEGIN TRY
    IF @ticket_id IS NULL
    BEGIN
        SET @ticket_id = 1 + ISNULL((SELECT TOP(1) ticket_id FROM dbo.Customer_Support ORDER BY ticket_id DESC), 0)
        INSERT dbo.Customer_Support(ticket_id, user_id, issue_description, resolution, status, create_date)
        VALUES(@ticket_id, @user_id, @issue_description, @resolution, @status, @create_date)
    END
    ELSE
        UPDATE TOP(1) dbo.Customer_Support
        SET user_id = @user_id,
            issue_description = ISNULL(@issue_description, issue_description),
            resolution = ISNULL(@resolution, resolution),
            status = ISNULL(@status, status),
            create_date = ISNULL(@create_date, create_date)
        WHERE ticket_id = @ticket_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Фінансовий облік
CREATE PROCEDURE dbo.sp_FinancialAccounting
    @transaction_id INT = NULL OUTPUT,
    @user_id INT,
    @amount DECIMAL(10, 2),
    @transaction_date DATE,
    @description TEXT
AS
BEGIN
BEGIN TRY
    IF @transaction_id IS NULL
    BEGIN
        SET @transaction_id = 1 + ISNULL((SELECT TOP(1) transaction_id FROM dbo.Financial_Transactions ORDER BY transaction_id DESC), 0)
        INSERT dbo.Financial_Transactions(transaction_id, user_id, amount, transaction_date, description)
        VALUES(@transaction_id, @user_id, @amount, @transaction_date, @description)
    END
    ELSE
        UPDATE TOP(1) dbo.Financial_Transactions
        SET user_id = @user_id,
            amount = ISNULL(@amount, amount),
            transaction_date = ISNULL(@transaction_date, transaction_date),
            description = ISNULL(@description, description)
        WHERE transaction_id = @transaction_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Планування і управління заходами
CREATE PROCEDURE dbo.sp_OrganizeEvent
    @event_id INT = NULL OUTPUT,
    @event_name VARCHAR(100),
    @event_date DATE,
    @location VARCHAR(100),
    @description TEXT
AS
BEGIN
BEGIN TRY
    IF @event_id IS NULL
    BEGIN
        SET @event_id = 1 + ISNULL((SELECT TOP(1) event_id FROM dbo.Events ORDER BY event_id DESC), 0)
        INSERT dbo.Events(event_id, event_name, event_date, location, description)
        VALUES(@event_id, @event_name, @event_date, @location, @description)
    END
    ELSE
        UPDATE TOP(1) dbo.Events
        SET event_name = ISNULL(@event_name, event_name),
            event_date = ISNULL(@event_date, event_date),
            location = ISNULL(@location, location),
            description = ISNULL(@description, description)
        WHERE event_id = @event_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Планування і управління програмами харчування та тренувань
CREATE PROCEDURE dbo.sp_ManageNutritionAndTrainingPrograms
    @program_id INT = NULL OUTPUT,
    @program_name VARCHAR(100),
    @description TEXT,
    @nutrition_plan TEXT,
    @exercise_plan TEXT,
    @client_id INT,
    @start_date DATE,
    @end_date DATE
AS
BEGIN
BEGIN TRY
    IF @program_id IS NULL
    BEGIN
        SET @program_id = 1 + ISNULL((SELECT TOP(1) program_id FROM dbo.Nutrition_Training_Programs ORDER BY program_id DESC), 0)
        INSERT dbo.Nutrition_Training_Programs(program_id, program_name, description, nutrition_plan, exercise_plan, client_id, start_date, end_date)
        VALUES(@program_id, @program_name, @description, @nutrition_plan, @exercise_plan, @client_id, @start_date, @end_date)
    END
    ELSE
        UPDATE TOP(1) dbo.Nutrition_Training_Programs
        SET program_name = ISNULL(@program_name, program_name),
            description = ISNULL(@description, description),
            nutrition_plan = ISNULL(@nutrition_plan, nutrition_plan),
            exercise_plan = ISNULL(@exercise_plan, exercise_plan),
            client_id = ISNULL(@client_id, client_id),
            start_date = ISNULL(@start_date, start_date),
            end_date = ISNULL(@end_date, end_date)
        WHERE program_id = @program_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Залучення нових клієнтів
CREATE PROCEDURE dbo.sp_AttractNewClients
    @promotion_id INT = NULL OUTPUT,
    @promotion_name VARCHAR(100),
    @description TEXT,
    @discount DECIMAL(5, 2),
    @start_date DATE,
    @end_date DATE,
    @target VARCHAR(50)
AS
BEGIN
BEGIN TRY
    IF @promotion_id IS NULL
    BEGIN
        SET @promotion_id = 1 + ISNULL((SELECT TOP(1) promotion_id FROM dbo.Promotions ORDER BY promotion_id DESC), 0)
        INSERT dbo.Promotions(promotion_id, promotion_name, description, discount, start_date, end_date, target)
        VALUES(@promotion_id, @promotion_name, @description, @discount, @start_date, @end_date, @target)
    END
    ELSE
        UPDATE TOP(1) dbo.Promotions
        SET promotion_name = ISNULL(@promotion_name, promotion_name),
            description = ISNULL(@description, description),
            discount = ISNULL(@discount, discount),
            start_date = ISNULL(@start_date, start_date),
            end_date = ISNULL(@end_date, end_date),
            target = ISNULL(@target, target)
        WHERE promotion_id = @promotion_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Організація заходів для мотивації клієнтів
CREATE PROCEDURE dbo.sp_OrganizeClientMotivationEvents
    @event_id INT = NULL OUTPUT,
    @event_name VARCHAR(100),
    @event_date DATE,
    @location VARCHAR(100),
    @description TEXT,
    @incentive TEXT
AS
BEGIN
BEGIN TRY
    IF @event_id IS NULL
    BEGIN
        SET @event_id = 1 + ISNULL((SELECT TOP(1) event_id FROM dbo.Client_Motivation_Events ORDER BY event_id DESC), 0)
        INSERT dbo.Client_Motivation_Events(event_id, event_name, event_date, location, description, incentive)
        VALUES(@event_id, @event_name, @event_date, @location, @description, @incentive)
    END
    ELSE
        UPDATE TOP(1) dbo.Client_Motivation_Events
        SET event_name = ISNULL(@event_name, event_name),
            event_date = ISNULL(@event_date, event_date),
            location = ISNULL(@location, location),
            description = ISNULL(@description, description),
            incentive = ISNULL(@incentive, incentive)
        WHERE event_id = @event_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

-- Клубні програми і спеціальні пропозиції
CREATE PROCEDURE dbo.sp_ManageClubProgramsAndOffers
    @program_id INT = NULL OUTPUT,
    @program_name VARCHAR(100),
    @description TEXT,
    @target_group VARCHAR(50),
    @benefits TEXT,
    @duration INT,
    @special_offer BIT,
    @start_date DATE,
    @end_date DATE
AS
BEGIN
BEGIN TRY
    IF @program_id IS NULL
    BEGIN
        SET @program_id = 1 + ISNULL((SELECT TOP(1) program_id FROM dbo.Club_Programs ORDER BY program_id DESC), 0)
        INSERT dbo.Club_Programs(program_id, program_name, description, target_group, benefits, duration, special_offer, start_date, end_date)
        VALUES(@program_id, @program_name, @description, @target_group, @benefits, @duration, @special_offer, @start_date, @end_date)
    END
    ELSE
        UPDATE TOP(1) dbo.Club_Programs
        SET program_name = ISNULL(@program_name, program_name),
            description = ISNULL(@description, description),
            target_group = ISNULL(@target_group, target_group),
            benefits = ISNULL(@benefits, benefits),
            duration = ISNULL(@duration, duration),
            special_offer = ISNULL(@special_offer, special_offer),
            start_date = ISNULL(@start_date, start_date),
            end_date = ISNULL(@end_date, end_date)
        WHERE program_id = @program_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


-- Підтримка здорового способу життя
CREATE PROCEDURE dbo.sp_PromoteHealthyLifestyle
    @session_id INT = NULL OUTPUT,
    @session_name VARCHAR(100),
    @date DATE,
    @time TIME,
    @topic TEXT,
    @speaker VARCHAR(50),
    @location VARCHAR(100)
AS
BEGIN
BEGIN TRY
    IF @session_id IS NULL
    BEGIN
        SET @session_id = 1 + ISNULL((SELECT TOP(1) session_id FROM dbo.Healthy_Lifestyle_Sessions ORDER BY session_id DESC), 0)
        INSERT dbo.Healthy_Lifestyle_Sessions(session_id, session_name, date, time, topic, speaker, location)
        VALUES(@session_id, @session_name, @date, @time, @topic, @speaker, @location)
    END
    ELSE
        UPDATE TOP(1) dbo.Healthy_Lifestyle_Sessions
        SET session_name = ISNULL(@session_name, session_name),
            date = ISNULL(@date, date),
            time = ISNULL(@time, time),
            topic = ISNULL(@topic, topic),
            speaker = ISNULL(@speaker, speaker),
            location = ISNULL(@location, location)
        WHERE session_id = @session_id
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END
