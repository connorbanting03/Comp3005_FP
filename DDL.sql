CREATE TABLE Clubs (
    Club_ID SERIAL PRIMARY KEY,
    ClubName VARCHAR(100) NOT NULL
);

CREATE TABLE Class (
    Class_ID SERIAL PRIMARY KEY,
    Class_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Trainers (
    Trainer_ID SERIAL PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Club_ID INT REFERENCES Clubs(Club_ID)
);

CREATE TABLE Members (
    Member_ID SERIAL PRIMARY KEY,
    Club_ID INT REFERENCES Clubs(Club_ID),
    Trainer_ID INT REFERENCES Trainers(Trainer_ID),
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE Membership_Details (
    Member_ID INT REFERENCES Members(Member_ID),
    Membership_Type VARCHAR(50) NOT NULL,
    Loyalty_Points INT DEFAULT 0,
    Account_Balance DECIMAL(10, 2) DEFAULT 0.00,
    Details_Backup_ID SERIAL PRIMARY KEY
);

CREATE TABLE Goals (
    Goal_ID SERIAL PRIMARY KEY,
    Member_ID INT REFERENCES Members(Member_ID),
    Goal_Desc TEXT NOT NULL,
    Timeline DATE NOT NULL
);


CREATE TABLE Takes (
    Class_ID INT REFERENCES Class(Class_ID),
    Member_ID INT REFERENCES Members(Member_ID)
);

CREATE TABLE Tasks (
    Task_ID SERIAL PRIMARY KEY,
    Trainer_ID INT REFERENCES Trainers(Trainer_ID),
    Money_Owed DECIMAL(10, 2) NOT NULL,
    Due_Date DATE NOT NULL,
    Task_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Teaches (
    Trainer_ID INT REFERENCES Trainers(Trainer_ID),
    Class_ID INT UNIQUE REFERENCES Class(Class_ID),
    PRIMARY KEY (Trainer_ID, Class_ID)
);

CREATE TABLE Workouts (
    Member_ID INT REFERENCES Members(Member_ID),
    Trainer_ID INT REFERENCES Trainers(Trainer_ID),
    WorkoutName VARCHAR(255) NOT NULL
);


