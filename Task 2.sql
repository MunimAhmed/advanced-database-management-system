/* Creating User*/

CREATE USER Manager IDENTIFIED BY Health_Gym;

/*Creating Table Trainer and inserting values*/

CREATE TABLE Trainer (
  t_id NUMBER(5) PRIMARY KEY,
  t_name VARCHAR2(255),
  t_address VARCHAR2(255),
  salary NUMBER(10, 2),
  specialty VARCHAR2(255)
);

INSERT INTO Trainer (t_id, t_name, t_address, salary, specialty)
VALUES (1, 'Rahim', 'Banani', 5000, 'Body building');

INSERT INTO Trainer (t_id, t_name, t_address, salary, specialty)
VALUES (2, 'Karim', 'Gulshan', 5000, 'weight_loss_transformation');

INSERT INTO Trainer (t_id, t_name, t_address, salary, specialty)
VALUES (3, 'Prioty', 'Dhanmondi', 6000, 'fitness');

/*Creating Table Member and inserting values*/

CREATE TABLE Member (
  m_id INT PRIMARY KEY,
  m_name VARCHAR(255),
  m_address VARCHAR(255),
  bill INT,
  t_id INT,
  FOREIGN KEY (t_id) REFERENCES Trainer(t_id)
);


/*Creating Sequence*/

CREATE SEQUENCE member_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 67
NOCACHE
NOCYCLE;

/*Inserting values into member table*/

INSERT INTO Member (m_id, m_name, m_address, bill, t_id)
VALUES (member_seq.NEXTVAL, 'Asif', 'Dhanmondi', 500, 2);

INSERT INTO Member (m_id, m_name, m_address, bill, t_id)
VALUES (member_seq.NEXTVAL, 'Rifat', 'Gulshan', 800, 1);

INSERT INTO Member (m_id, m_name, m_address, bill, t_id)
VALUES (member_seq.NEXTVAL, 'Sadia', 'Basundhora', 600, 3);

INSERT INTO Member (m_id, m_name, m_address, bill, t_id)
VALUES (member_seq.NEXTVAL, 'Redowan', 'Basundhora', 700, 1);

INSERT INTO Member (m_id, m_name, m_address, bill, t_id)
VALUES (member_seq.NEXTVAL, 'Fahmida', 'Khilkhet', 400, 3);

INSERT INTO Member (m_id, m_name, m_address, bill, t_id)
VALUES (member_seq.NEXTVAL, 'Afifa', 'Uttara', 500, 3);

INSERT INTO Member (m_id, m_name, m_address, bill, t_id)
VALUES (member_seq.NEXTVAL, 'Sayed', 'Dhanmondi', 500, 2);

/*Member table name change*/

ALTER TABLE Member RENAME TO Members;

/*Member who pay highest bill*/

SELECT m_name FROM Members WHERE bill = (SELECT MAX(bill) FROM Members);

/*Member name by ascending order of bill*/

SELECT m_name FROM Members ORDER BY bill;

/*Member name starts with A*/

SELECT m_name FROM Members WHERE m_name LIKE 'A%';

/*Trainer name, specialty and member name whose t_id is 3*/

SELECT t.t_name AS trainer_name, t.specialty, m.m_name AS member_name
FROM Members m
JOIN Trainer t
ON m.t_id = t.t_id
WHERE m.t_id = 3;

/*member name, address whose trainer name Prioty*/

SELECT m.m_name AS member_name, m.m_address
FROM Members m
JOIN Trainer t
ON t.t_id = m.t_id
WHERE t.t_name = 'Prioty';


/*view named trainer_vw based on trainer table which shows the trainer id, name, specialty */

CREATE VIEW trainer_vw AS
SELECT t_id, t_name, specialty
FROM Trainer;

/*trainer_vw display all trainer names and specialty */

FROM trainer_vw;
SELECT t_name, specialty
FROM trainer_vw;

/*Creating Info view that contains the trainer name, specialty, member name as Trainer, Specialty, Member. */

CREATE VIEW Info AS
SELECT t.t_name AS Trainer, t.specialty AS Specialty, m.m_name AS Member
FROM Trainer t
JOIN Members m ON t.t_id = m.t_id;

