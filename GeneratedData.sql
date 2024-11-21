
INSERT INTO address (id, zip_code, street, city) VALUES
(1, '12345', 'Main Street 1', 'Stockholm'),
(2, '23456', 'Second Avenue 2', 'Gothenburg'),
(3, '34567', 'Oak Lane 3', 'Malmö');

INSERT INTO contact_person (phone_number, first_name, last_name, email) VALUES
('1234567890', 'John', 'Doe', 'john.doe@example.com'),
('0987654321', 'Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO instructor (id, first_name, last_name, phone_number, email, person_number, can_teach_ensemble, address_id) VALUES
(1, 'Alice', 'Johnson', '1234567890', 'alice.johnson@example.com', '198705151234', 'YES', 1),
(2, 'Bob', 'Brown', '9876543210', 'bob.brown@example.com', '198602225678', 'NO', 2);

INSERT INTO instrument_taught (id, name) VALUES
(1, 'Piano'),
(2, 'Guitar'),
(3, 'Drums');

INSERT INTO place (id, room_capacity) VALUES
(1, 30),
(2, 50);

INSERT INTO pricing_scheme (id, lesson_level, lesson_type, pricing_period, price) VALUES
(1, 'Beginner', 'Group', '2024-01-01 00:00:00', 400.00),
(2, 'Advanced', 'Individual', '2024-02-01 00:00:00', 600.00);

INSERT INTO student (id, skill_level, monthly_payment_status, first_name, last_name, phone_number, email, person_number, contact_person_phone_number, address_id) VALUES
(1, 'Intermediate', 'Paid', 'Charlie', 'Davis', '1112233445', 'charlie.davis@example.com', '200010109876', '1234567890', 1),
(2, 'Beginner', 'Pending', 'Diana', 'Evans', '2233445566', 'diana.evans@example.com', '200105054321', '0987654321', 2);

INSERT INTO student_sibling (student_id, sibling_id) VALUES
(1, 2);

INSERT INTO availability (start_time, instructor_id, end_time) VALUES
('2024-01-01 09:00:00', 1, '2024-01-01 10:00:00'),
('2024-01-02 10:00:00', 2, '2024-01-02 11:00:00');

INSERT INTO ensemble (id, target_genre, schedule_time_slot, min_enrollment, max_capacity, pricing_scheme_id, instructor_id) VALUES
(1, 'Jazz', '2024-01-10 18:00:00', 5, 20, 1, 1),
(2, 'Rock', '2024-01-12 19:00:00', 6, 25, 2, 2);

INSERT INTO ensemble_place (place_id, ensemble_id) VALUES
(1, 1),
(2, 2);

INSERT INTO group_lesson (id, min_enrollment, schedule_time_slot, max_capacity, instrument_taught, level, pricing_scheme_id, instructor_id) VALUES
(1, 5, '2024-01-01 14:00:00', 15, 'Piano', 'Beginner', 1, 1),
(2, 3, '2024-01-02 15:00:00', 10, 'Guitar', 'Intermediate', 2, 2);

INSERT INTO group_lesson_place (place_id, group_lesson_id) VALUES
(1, 1),
(2, 2);

INSERT INTO individual_lesson (id, appointment_time, instrument_taught, level, pricing_scheme_id, instructor_id, student_id) VALUES
(1, '2024-01-05 10:00:00', 'Guitar', 'Beginner', 1, 1, 1),
(2, '2024-01-06 11:00:00', 'Drums', 'Intermediate', 2, 2, 2);

INSERT INTO individual_lesson_place (place_id, individual_lesson_id) VALUES
(1, 1),
(2, 2);

INSERT INTO instructor_instrument_taught (instrument_taught_id, instructor_id) VALUES
(1, 1),
(2, 2);

INSERT INTO instruments (instrument_type, ensemble_id) VALUES
('Piano', 1),
('Guitar', 2);

INSERT INTO rental (start_date, student_id, end_date) VALUES
('2024-01-01 00:00:00', 1, '2024-02-01 00:00:00'),
('2024-02-01 00:00:00', 2, '2024-03-01 00:00:00');

INSERT INTO student_ensemble (student_id, ensemble_id) VALUES
(1, 1),
(2, 2);

INSERT INTO student_group_lesson (student_id, group_lesson_id) VALUES
(1, 1),
(2, 2);

INSERT INTO instrument (id, rental_price, brand, rental_student_id, quantity_stock, instrument_name, rental_start_date) VALUES
(1, 200.00, 'Yamaha', 1, 10, 'Piano', '2024-01-01 00:00:00'),
(2, 150.00, 'Fender', 2, 5, 'Guitar', '2024-02-01 00:00:00');