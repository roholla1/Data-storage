CREATE TABLE address (
 id INT   NOT NULL,
 zip_code VARCHAR(10),
 street VARCHAR(100),
 city VARCHAR(50)
);

ALTER TABLE address ADD CONSTRAINT PK_address PRIMARY KEY (id);


CREATE TABLE contact_person (
 phone_number VARCHAR(10) NOT NULL,
 first_name VARCHAR(30) NOT NULL,
 last_name VARCHAR(30) NOT NULL,
 email VARCHAR(50)
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (phone_number);


CREATE TABLE instructor (
 id  INT   NOT NULL,
 first_name VARCHAR(30) NOT NULL,
 last_name VARCHAR(30) NOT NULL,
 phone_number VARCHAR(10) NOT NULL,
 email VARCHAR(50) NOT NULL,
 person_number  VARCHAR(12) NOT NULL UNIQUE,
 can_teach_ensemble VARCHAR(10) NOT NULL,
 address_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id );


CREATE TABLE instrument_taught (
 id INT   NOT NULL,
 name VARCHAR(50)
);

ALTER TABLE instrument_taught ADD CONSTRAINT PK_instrument_taught PRIMARY KEY (id);


CREATE TABLE place (
 id INT   NOT NULL,
 room_capacity INT NOT NULL
);

ALTER TABLE place ADD CONSTRAINT PK_place PRIMARY KEY (id);


CREATE TABLE pricing_scheme (
 id INT   NOT NULL,
 lesson_level VARCHAR(100),
 lesson_type VARCHAR(100),
 pricing_period TIMESTAMP(6),
 price FLOAT(10)
);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (id);

/*
CREATE TABLE rules  (
 siblings_discount VARCHAR(100),
 max_rented_instrument INT,
 max_instrument_lease  INT,
 levels VARCHAR(100)
);
*/

CREATE TABLE student (
 id INT   NOT NULL,
 skill_level VARCHAR(50) NOT NULL,
 monthly_payment_status VARCHAR(50),
 first_name VARCHAR(30) NOT NULL,
 last_name VARCHAR(30) NOT NULL,
 phone_number VARCHAR(10),
 email VARCHAR(50) NOT NULL,
 person_number   VARCHAR(12) NOT NULL UNIQUE,
 contact_person_phone_number VARCHAR(10) NOT NULL,
 address_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_sibling (
 student_id INT NOT NULL,
 sibling_id INT NOT NULL
);

ALTER TABLE student_sibling ADD CONSTRAINT PK_student_sibling PRIMARY KEY (student_id,sibling_id);


CREATE TABLE availability (
 start_time TIMESTAMP(6) NOT NULL,
 instructor_id INT NOT NULL,
 end_time TIMESTAMP(6) NOT NULL
);

ALTER TABLE availability ADD CONSTRAINT PK_availability PRIMARY KEY (start_time,instructor_id);


CREATE TABLE ensemble (
 id INT   NOT NULL,
 target_genre VARCHAR(50) NOT NULL,
 schedule_time_slot TIMESTAMP(6) NOT NULL,
 min_enrollment INT NOT NULL,
 max_capacity INT NOT NULL,
 pricing_scheme_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);


CREATE TABLE ensemble_place (
 place_id INT NOT NULL,
 ensemble_id INT NOT NULL
);

ALTER TABLE ensemble_place ADD CONSTRAINT PK_ensemble_place PRIMARY KEY (place_id,ensemble_id);


CREATE TABLE group_lesson (
 id  INT   NOT NULL,
 min_enrollment INT NOT NULL,
 schedule_time_slot TIMESTAMP(6) NOT NULL,
 max_capacity INT NOT NULL,
 instrument_taught VARCHAR(10) NOT NULL,
 level VARCHAR(50) NOT NULL,
 pricing_scheme_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id );


CREATE TABLE group_lesson_place (
 place_id INT NOT NULL,
 group_lesson_id INT NOT NULL
);

ALTER TABLE group_lesson_place ADD CONSTRAINT PK_group_lesson_place PRIMARY KEY (place_id,group_lesson_id);


CREATE TABLE individual_lesson (
 id INT   NOT NULL,
 appointment_time TIMESTAMP(6) NOT NULL,
 instrument_taught  VARCHAR(10) NOT NULL,
 level VARCHAR(50) NOT NULL,
 pricing_scheme_id INT NOT NULL,
 instructor_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (id);


CREATE TABLE individual_lesson_place (
 place_id INT NOT NULL,
 individual_lesson_id INT NOT NULL
);

ALTER TABLE individual_lesson_place ADD CONSTRAINT PK_individual_lesson_place PRIMARY KEY (place_id,individual_lesson_id);


CREATE TABLE instructor_instrument_taught (
 instrument_taught_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_instrument_taught ADD CONSTRAINT PK_instructor_instrument_taught PRIMARY KEY (instrument_taught_id,instructor_id);


CREATE TABLE instruments (
 instrument_type VARCHAR(50) NOT NULL,
 ensemble_id INT NOT NULL
);

ALTER TABLE instruments ADD CONSTRAINT PK_instruments PRIMARY KEY (instrument_type,ensemble_id);


CREATE TABLE rental (
 start_date TIMESTAMP(6) NOT NULL,
 student_id INT NOT NULL,
 end_date TIMESTAMP(6) NOT NULL
);

ALTER TABLE rental ADD CONSTRAINT PK_rental PRIMARY KEY (start_date,student_id);


CREATE TABLE student_ensemble (
 student_id INT NOT NULL,
 ensemble_id INT NOT NULL
);

ALTER TABLE student_ensemble ADD CONSTRAINT PK_student_ensemble PRIMARY KEY (student_id,ensemble_id);


CREATE TABLE student_group_lesson (
 student_id INT NOT NULL,
 group_lesson_id INT NOT NULL
);

ALTER TABLE student_group_lesson ADD CONSTRAINT PK_student_group_lesson PRIMARY KEY (student_id,group_lesson_id);


CREATE TABLE instrument (
 id INT   NOT NULL,
 rental_price FLOAT(10) NOT NULL,
 brand  VARCHAR(50),
 rental_student_id INT NOT NULL,
 quantity_stock INT,
 instrument_name VARCHAR(50),
 rental_start_date TIMESTAMP(6) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (address_id) REFERENCES address (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (contact_person_phone_number) REFERENCES contact_person (phone_number);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (address_id) REFERENCES address (id);


ALTER TABLE student_sibling ADD CONSTRAINT FK_student_sibling_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_sibling ADD CONSTRAINT FK_student_sibling_1 FOREIGN KEY (sibling_id) REFERENCES student (id);


ALTER TABLE availability ADD CONSTRAINT FK_availability_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id );


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_scheme (id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id );


ALTER TABLE ensemble_place ADD CONSTRAINT FK_ensemble_place_0 FOREIGN KEY (place_id) REFERENCES place (id);
ALTER TABLE ensemble_place ADD CONSTRAINT FK_ensemble_place_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_scheme (id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id );


ALTER TABLE group_lesson_place ADD CONSTRAINT FK_group_lesson_place_0 FOREIGN KEY (place_id) REFERENCES place (id);
ALTER TABLE group_lesson_place ADD CONSTRAINT FK_group_lesson_place_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (id );


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_scheme (id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id );
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE individual_lesson_place ADD CONSTRAINT FK_individual_lesson_place_0 FOREIGN KEY (place_id) REFERENCES place (id);
ALTER TABLE individual_lesson_place ADD CONSTRAINT FK_individual_lesson_place_1 FOREIGN KEY (individual_lesson_id) REFERENCES individual_lesson (id);


ALTER TABLE instructor_instrument_taught ADD CONSTRAINT FK_instructor_instrument_taught_0 FOREIGN KEY (instrument_taught_id) REFERENCES instrument_taught (id);
ALTER TABLE instructor_instrument_taught ADD CONSTRAINT FK_instructor_instrument_taught_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id );


ALTER TABLE instruments ADD CONSTRAINT FK_instruments_0 FOREIGN KEY (ensemble_id) REFERENCES ensemble (id);


ALTER TABLE rental ADD CONSTRAINT FK_rental_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (id);


ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (id );


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (rental_student_id,rental_start_date) REFERENCES rental (student_id,start_date);


