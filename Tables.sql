
CREATE TABLE Users (
    user_id INT NOT NULL IDENTITY PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    date_of_birth DATE,
    membership_start DATE,
    membership_end DATE,
);

CREATE TABLE Trainers (
    trainer_id INT NOT NULL IDENTITY PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    salary DECIMAL(10, 2),
);

CREATE TABLE Memberships (
    membership_id INT NOT NULL IDENTITY PRIMARY KEY,
    membership_type VARCHAR(50),
    price DECIMAL(10, 2),
    description TEXT,
    validity_period INT,
);

CREATE TABLE Class_Activities (
    class_id INT NOT NULL IDENTITY PRIMARY KEY,
    class_name VARCHAR(100),
    class_type VARCHAR(20),
    schedule VARCHAR(50),
    duration INT,
    capacity INT,
);

CREATE TABLE Class_Schedule (
    schedule_id INT NOT NULL IDENTITY PRIMARY KEY,
    class_id INT,
    trainer_id INT,
    date DATE,
    time TIME,
);

CREATE TABLE Class_Registrations (
    registration_id INT NOT NULL IDENTITY PRIMARY KEY,
    user_id INT,
    class_id INT,
    registration_date DATE,
);

CREATE TABLE Payments (
    payment_id INT NOT NULL IDENTITY PRIMARY KEY,
    user_id INT,
    membership_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method VARCHAR(50),
);

CREATE TABLE Gyms (
    gym_id INT NOT NULL IDENTITY PRIMARY KEY,
    gym_name VARCHAR(100),
    location VARCHAR(200),
    capacity INT,
    equipment TEXT,
);

CREATE TABLE Equipment_Rentals (
    rental_id INT NOT NULL IDENTITY PRIMARY KEY,
    user_id INT,
    equipment VARCHAR(100),
    rental_date DATE,
    return_date DATE,
);

CREATE TABLE Feedback (
    feedback_id INT NOT NULL IDENTITY PRIMARY KEY,
    user_id INT,
    trainer_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comments TEXT,
    date DATE,
);

CREATE TABLE Workout_Programs (
    program_id INT NOT NULL IDENTITY PRIMARY KEY,
    program_name VARCHAR(100),
    description TEXT,
    trainer_id INT,
);

CREATE TABLE Program_Assignments (
    assignment_id INT NOT NULL IDENTITY PRIMARY KEY,
    user_id INT,
    program_id INT,
    start_date DATE,
    end_date DATE,
);

CREATE TABLE Events (
    event_id INT NOT NULL IDENTITY PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE,
    location VARCHAR(200),
    capacity INT,
    description TEXT,
);

CREATE TABLE Event_Registrations (
    registration_id INT NOT NULL IDENTITY PRIMARY KEY,
    user_id INT,
    event_id INT,
    registration_date DATE,
);

CREATE TABLE Notifications (
    notification_id INT NOT NULL IDENTITY PRIMARY KEY,
    user_id INT,
    message TEXT,
    notification_date DATE,
    status VARCHAR(20),
);
