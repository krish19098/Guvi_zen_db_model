CREATE DATABASE Guvi_Zen_Class;

USE Guvi_Zen_Class;

CREATE TABLE Batches (
    id INT PRIMARY KEY AUTO_INCREMENT,
    batch_number INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    time TIME NOT NULL,
    UNIQUE (batch_number)
);

CREATE TABLE Mentors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mentor VARCHAR(255) NOT NULL,
    UNIQUE (mentor)
);

CREATE TABLE Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student VARCHAR(255) NOT NULL,
    batch_id INT NOT NULL,
    FOREIGN KEY (batch_id) REFERENCES Batches(id),
    UNIQUE (student)
);

CREATE TABLE Days (
    id INT PRIMARY KEY AUTO_INCREMENT,
    day INT NOT NULL,
    topic VARCHAR(255) NOT NULL,
    task TEXT NOT NULL,
    session_id INT,
    UNIQUE (day),
    FOREIGN KEY (session_id) REFERENCES Sessions(id)
);

CREATE TABLE Sessions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    day_id INT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    topic_covered VARCHAR(255) NOT NULL,
    FOREIGN KEY (day_id) REFERENCES Days(id)
);

CREATE TABLE MentorDays (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mentor_id INT NOT NULL,
    day_id INT NOT NULL,
    FOREIGN KEY (mentor_id) REFERENCES Mentors(id),
    FOREIGN KEY (day_id) REFERENCES Days(id),
    UNIQUE (mentor_id, day_id)
);

CREATE TABLE StudentDays (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    day_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (day_id) REFERENCES Days(id),
    UNIQUE (student_id, day_id)
);

CREATE TABLE MentorConnections (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mentor_id INT NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (mentor_id) REFERENCES Mentors(id),
    FOREIGN KEY (student_id) REFERENCES Students(id),
    UNIQUE (mentor_id, student_id)
);
