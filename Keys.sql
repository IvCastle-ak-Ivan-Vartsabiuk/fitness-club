
ALTER TABLE Class_Schedule
ADD CONSTRAINT fk_class_schedule_class_id
    FOREIGN KEY (class_id) REFERENCES Class_Activities(class_id)

ALTER TABLE Class_Schedule
ADD CONSTRAINT fk_class_schedule_trainer_id
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id);

ALTER TABLE Class_Registrations
ADD CONSTRAINT fk_class_registrations_user_id
    FOREIGN KEY (user_id) REFERENCES Users(user_id)

ALTER TABLE Class_Registrations
ADD CONSTRAINT fk_class_registrations_class_id
    FOREIGN KEY (class_id) REFERENCES Class_Activities(class_id);

ALTER TABLE Payments
ADD CONSTRAINT fk_payments_user_id
    FOREIGN KEY (user_id) REFERENCES Users(user_id)

ALTER TABLE Payments
ADD CONSTRAINT fk_payments_membership_id
    FOREIGN KEY (membership_id) REFERENCES Memberships(membership_id);

ALTER TABLE Equipment_Rentals
ADD CONSTRAINT fk_equipment_rentals_user_id
    FOREIGN KEY (user_id) REFERENCES Users(user_id);

ALTER TABLE Feedback
ADD CONSTRAINT fk_feedback_user_id
    FOREIGN KEY (user_id) REFERENCES Users(user_id)

ALTER TABLE Feedback
ADD CONSTRAINT fk_feedback_trainer_id
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id);

ALTER TABLE Workout_Programs
ADD CONSTRAINT fk_workout_programs_trainer_id
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id);

ALTER TABLE Program_Assignments
ADD CONSTRAINT fk_program_assignments_user_id
    FOREIGN KEY (user_id) REFERENCES Users(user_id)

ALTER TABLE Program_Assignments
ADD CONSTRAINT fk_program_assignments_program_id
    FOREIGN KEY (program_id) REFERENCES Workout_Programs(program_id);

ALTER TABLE Event_Registrations
ADD CONSTRAINT fk_event_registrations_user_id
    FOREIGN KEY (user_id) REFERENCES Users(user_id)

ALTER TABLE Event_Registrations
ADD CONSTRAINT fk_event_registrations_event_id
    FOREIGN KEY (event_id) REFERENCES Events(event_id);

ALTER TABLE Notifications
ADD CONSTRAINT fk_notifications_user_id
    FOREIGN KEY (user_id) REFERENCES Users(user_id);
