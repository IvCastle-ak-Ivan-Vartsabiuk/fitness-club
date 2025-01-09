-- Перегляд користувачів та їх тренерів за розкладом
SELECT 
    U.first_name AS User_FirstName, 
    U.last_name AS User_LastName, 
    T.first_name AS Trainer_FirstName, 
    T.last_name AS Trainer_LastName, 
    CA.class_name, 
    CS.date, 
    CS.time
FROM 
    Class_Registrations CR
JOIN 
    Users U ON CR.user_id = U.user_id
JOIN 
    Class_Activities CA ON CR.class_id = CA.class_id
JOIN 
    Class_Schedule CS ON CA.class_id = CS.class_id
JOIN 
    Trainers T ON CS.trainer_id = T.trainer_id
ORDER BY 
    CS.date, CS.time;

-- Історія платежів користувачів
SELECT 
    U.first_name, 
    U.last_name, 
    M.membership_type, 
    P.amount, 
    P.payment_date, 
    P.payment_method
FROM 
    Payments P
JOIN 
    Users U ON P.user_id = U.user_id
JOIN 
    Memberships M ON P.membership_id = M.membership_id
ORDER BY 
    P.payment_date DESC;

-- Рейтинг тренерів з відгуками
SELECT 
    T.first_name AS Trainer_FirstName, 
    T.last_name AS Trainer_LastName, 
    AVG(F.rating) AS Average_Rating, 
    COUNT(F.feedback_id) AS Total_Feedbacks
FROM 
    Feedback F
JOIN 
    Trainers T ON F.trainer_id = T.trainer_id
GROUP BY 
    T.first_name, T.last_name
HAVING 
    COUNT(F.feedback_id) > 0
ORDER BY 
    Average_Rating DESC;

-- юзери які записані на події
SELECT 
    U.first_name AS User_FirstName, 
    U.last_name AS User_LastName, 
    E.event_name, 
    E.event_date, 
    E.location
FROM 
    Event_Registrations ER
JOIN 
    Users U ON ER.user_id = U.user_id
JOIN 
    Events E ON ER.event_id = E.event_id
ORDER BY 
    E.event_date;

-- Список екіпи яку орендували
SELECT 
    U.first_name AS User_FirstName, 
    U.last_name AS User_LastName, 
    ER.equipment, 
    ER.rental_date, 
    ER.return_date
FROM 
    Equipment_Rentals ER
JOIN 
    Users U ON ER.user_id = U.user_id
ORDER BY 
    ER.rental_date DESC;

