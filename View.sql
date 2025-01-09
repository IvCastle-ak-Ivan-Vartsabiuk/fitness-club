-- �������� ���� � �� ������� �� ���������
CREATE VIEW View_UserClasses AS
SELECT 
    U.user_id,
    U.first_name AS User_FirstName, 
    U.last_name AS User_LastName, 
    T.trainer_id,
    T.first_name AS Trainer_FirstName, 
    T.last_name AS Trainer_LastName, 
    CA.class_name, 
    CS.date AS Class_Date, 
    CS.time AS Class_Time
FROM 
    Class_Registrations CR
JOIN 
    Users U ON CR.user_id = U.user_id
JOIN 
    Class_Activities CA ON CR.class_id = CA.class_id
JOIN 
    Class_Schedule CS ON CA.class_id = CS.class_id
JOIN 
    Trainers T ON CS.trainer_id = T.trainer_id;

-- �������� ����� ������� ������������
CREATE VIEW View_UserPayments AS
SELECT 
    U.user_id,
    U.first_name AS User_FirstName, 
    U.last_name AS User_LastName, 
    M.membership_type, 
    P.amount, 
    P.payment_date, 
    P.payment_method
FROM 
    Payments P
JOIN 
    Users U ON P.user_id = U.user_id
JOIN 
    Memberships M ON P.membership_id = M.membership_id;

-- �������� �������� ������� �� ��������
CREATE VIEW View_TrainerRatings AS
SELECT 
    T.trainer_id,
    T.first_name AS Trainer_FirstName, 
    T.last_name AS Trainer_LastName, 
    AVG(F.rating) AS Average_Rating, 
    COUNT(F.feedback_id) AS Total_Feedbacks
FROM 
    Feedback F
JOIN 
    Trainers T ON F.trainer_id = T.trainer_id
GROUP BY 
    T.trainer_id, T.first_name, T.last_name
HAVING 
    COUNT(F.feedback_id) > 0;

-- �������� ������������, �� ����������� �� ��䳿
CREATE VIEW View_EventParticipants AS
SELECT 
    U.user_id,
    U.first_name AS User_FirstName, 
    U.last_name AS User_LastName, 
    E.event_id,
    E.event_name, 
    E.event_date, 
    E.location
FROM 
    Event_Registrations ER
JOIN 
    Users U ON ER.user_id = U.user_id
JOIN 
    Events E ON ER.event_id = E.event_id;

-- �������� ����������, ��� ���������� �����������
CREATE VIEW View_EquipmentRentals AS
SELECT 
    U.user_id,
    U.first_name AS User_FirstName, 
    U.last_name AS User_LastName, 
    ER.equipment, 
    ER.rental_date, 
    ER.return_date
FROM 
    Equipment_Rentals ER
JOIN 
    Users U ON ER.user_id = U.user_id;


