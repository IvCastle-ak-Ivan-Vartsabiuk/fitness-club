INSERT INTO Users (first_name, last_name, email, phone, date_of_birth, membership_start, membership_end)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '1990-01-01', '2024-01-01', '2024-12-31'),
('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '1992-05-15', '2024-02-01', '2024-12-31');

INSERT INTO Trainers (first_name, last_name, specialization, email, phone, salary)
VALUES
('Alice', 'Green', 'Yoga', 'alice.green@example.com', '5551234567', 4000.00),
('Bob', 'Brown', 'Cardio', 'bob.brown@example.com', '5557654321', 3500.00);

INSERT INTO Memberships (membership_type, price, description, validity_period)
VALUES
('Monthly', 50.00, 'One-month membership', 30),
('Yearly', 500.00, 'Full-year membership with discount', 365);

INSERT INTO Gyms (gym_name, location, capacity, equipment)
VALUES
('Downtown Fitness', '123 Main St, City Center', 100, 'Treadmills, Weights, Yoga Mats'),
('East Side Gym', '456 Elm St, East Side', 50, 'Cardio Machines, Dumbbells');

INSERT INTO Class_Activities (class_name, class_type, schedule, duration, capacity)
VALUES
('Yoga Morning', 'Group', 'Mon, Wed, Fri 8:00 AM', 60, 20),
('Cardio Blast', 'Group', 'Tue, Thu 6:00 PM', 45, 30);

INSERT INTO Class_Schedule (class_id, trainer_id, date, time)
VALUES
(1, 1, '2024-01-03', '08:00:00'),
(1, 1, '2024-01-05', '08:00:00'),
(2, 2, '2024-01-04', '18:00:00');

INSERT INTO Class_Registrations (user_id, class_id, registration_date)
VALUES
(1, 1, '2024-01-02'),
(2, 2, '2024-01-03');

INSERT INTO Payments (user_id, membership_id, amount, payment_date, payment_method)
VALUES
(1, 2, 500.00, '2024-01-01', 'Credit Card'),
(2, 1, 50.00, '2024-01-02', 'PayPal');

INSERT INTO Equipment_Rentals (user_id, equipment, rental_date, return_date)
VALUES
(1, 'Yoga Mat', '2024-01-03', '2024-01-03'),
(2, 'Dumbbells', '2024-01-04', '2024-01-04');

INSERT INTO Feedback (user_id, trainer_id, rating, comments, date)
VALUES
(1, 1, 5, 'Great yoga session!', '2024-01-03'),
(2, 2, 4, 'Cardio class was intense!', '2024-01-04');

INSERT INTO Workout_Programs (program_name, description, trainer_id)
VALUES
('Beginner Yoga', 'Yoga program for beginners', 1),
('Advanced Cardio', 'Intense cardio program', 2);

INSERT INTO Program_Assignments (user_id, program_id, start_date, end_date)
VALUES
(1, 1, '2024-01-05', '2024-02-05'),
(2, 2, '2024-01-06', '2024-02-06');

INSERT INTO Events (event_name, event_date, location, capacity, description)
VALUES
('Fitness Marathon', '2024-02-10', '123 Main St, City Center', 100, 'A day-long fitness event with multiple activities'),
('Yoga Workshop', '2024-03-15', '456 Elm St, East Side', 50, 'Special yoga techniques for relaxation');

INSERT INTO Event_Registrations (user_id, event_id, registration_date)
VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-12');

INSERT INTO Notifications (user_id, message, notification_date, status)
VALUES
(1, 'Your membership is about to expire.', '2024-12-25', 'Unread'),
(2, 'Thank you for registering for the Yoga Workshop.', '2024-01-12', 'Read');
