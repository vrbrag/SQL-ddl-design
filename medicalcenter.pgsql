DROP DATABASE medical_db;

CREATE DATABASE medical_db;

\c medical_db

CREATE TABLE doctors(
   id SERIAL PRIMARY KEY,
   name VARCHAR(30) NOT NULL,
   specialty VARCHAR(30) NOT NULL
);

CREATE TABLE patients(
   id SERIAL PRIMARY KEY,
   name VARCHAR(15) NOT NULL,
   birthday DATE
);

CREATE TABLE visits(
   id SERIAL PRIMARY KEY,
   doctorid INTEGER REFERENCES doctors(id),
   patientid INTEGER REFERENCES patients(id),
   date DATE
);

CREATE TABLE diseases(
   id SERIAL PRIMARY KEY,
   name VARCHAR(15) NOT NULL,
   description TEXT
);

CREATE TABLE diagnoses(
   id SERIAL PRIMARY KEY,
   visitid INTEGER REFERENCES visits(id),
   diseaseid INTEGER REFERENCES diseases(id)
);


INSERT INTO doctors (name, specialty) VALUES ('Derek Manns', 'Nurse'), ('Andrea Salz', 'Surgical Physician'), ('Lisa Kudrow', 'MD Resident');

INSERT INTO patients (name, birthday) VALUES ('John Quin', '1990-12-02'), ('Sara J. Parker', '1993-03-22'), ('Bobby Lee', '2003-09-16');

INSERT INTO visits (doctorid, patientid) VALUES (1, 1), (1, 2), (1, 3);

INSERT INTO diseases (name, description) VALUES ('Asthma', 'Shortness of breath'), ('Epilepsy', 'Light sensitivity'), ('Hiccups', 'Dehydration');

INSERT INTO diagnoses (visitid, diseaseid) VALUES (1, 1), (2, 2), (3, 3);