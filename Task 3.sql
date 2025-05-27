-- Table 1: Events
CREATE TABLE Events (
    Event_Id INT PRIMARY KEY,
    Event_Name TEXT,
    Event_Date DATE,
    Event_Location TEXT,
    Event_Description TEXT
);

-- Table 2: Attendees
CREATE TABLE Attendees (
    Attendee_Id INT PRIMARY KEY,
    Attendee_Name TEXT,
    Attendee_Phone TEXT,
    Attendee_Email TEXT,
    Attendee_City TEXT
);

-- Table 3: Registrations
CREATE TABLE Registrations (
    Registration_id INT PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount NUMERIC,
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

-- Insert into Events
INSERT INTO Events VALUES
(1, 'Tech Conference', '2024-08-10', 'New York', 'Annual technology meetup'),
(2, 'Art Expo', '2024-09-15', 'Chicago', 'Modern art exhibition'),
(3, 'Music Fest', '2024-10-05', 'Los Angeles', 'Live music and food');

-- Insert into Attendees
INSERT INTO Attendees VALUES
(101, 'Alice', '1234567890', 'alice@mail.com', 'New York'),
(102, 'Bob', '2345678901', 'bob@mail.com', 'Chicago'),
(103, 'Charlie', '3456789012', 'charlie@mail.com', 'LA');

-- Insert into Registrations
INSERT INTO Registrations VALUES
(1001, 1, 101, '2024-07-01', 100),
(1002, 2, 102, '2024-08-01', 50),
(1003, 3, 103, '2024-09-01', 75),
(1004, 1, 102, '2024-07-15', 100);


--a)
INSERT INTO Events VALUES
(4, 'Health Summit', '2024-11-10', 'Boston', 'Healthcare innovation event');

--b)
UPDATE Events
SET Event_Location = 'San Francisco'
WHERE Event_Id = 3;

--c)
DELETE FROM Events
WHERE Event_Id = 4;


-- step 4 


--a)
INSERT INTO Attendees VALUES
(104, 'Diana', '4567890123', 'diana@mail.com', 'Boston');

--b)
INSERT INTO Registrations VALUES
(1005, 2, 104, '2024-08-10', 60);


-- step 5


--a)
SELECT * FROM Events;


--b)
SELECT a.Attendee_Name, a.Attendee_Email
FROM Attendees a
JOIN Registrations r ON a.Attendee_Id = r.Attendee_Id
WHERE r.Event_Id = 1;


--c)
SELECT e.Event_Name, COUNT(r.Attendee_Id) AS total_attendees
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Name;


--d)
SELECT e.Event_Name, SUM(r.Registration_Amount) AS total_revenue
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Name;


--e)
SELECT e.Event_Name, e.Event_Date
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
WHERE r.Attendee_Id = 102;
