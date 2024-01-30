-- Inserting data for Patients
INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, ContactNumber, Email)
VALUES
  ('John', 'Doe', '1980-05-15', 'Male', '555-1234', 'john.doe@email.com'),
  ('Jane', 'Smith', '1992-08-22', 'Female', '555-5678', 'jane.smith@email.com'),
  ('Bob', 'Johnson', '1975-12-10', 'Male', '555-9876', 'bob.johnson@email.com'),
  ('Alice', 'Williams', '1988-03-25', 'Female', '555-3456', 'alice.w@email.com'),
  ('David', 'Brown', '1990-06-18', 'Male', '555-6789', 'david.brown@email.com'),
  ('Eva', 'Miller', '1982-09-30', 'Female', '555-2345', 'eva.miller@email.com'),
  ('Chris', 'Taylor', '1978-02-08', 'Male', '555-7890', 'chris.taylor@email.com'),
  ('Megan', 'Clark', '1995-11-15', 'Female', '555-4567', 'megan.clark@email.com'),
  ('Tom', 'Anderson', '1987-07-12', 'Male', '555-0123', 'tom.anderson@email.com'),
  ('Sophia', 'Moore', '1984-04-02', 'Female', '555-6781', 'sophia.moore@email.com');

-- Inserting data for Doctors
INSERT INTO Doctors (FirstName, LastName, Specialization, ContactNumber, Email)
VALUES
  ('Dr. Emily', 'Johnson', 'Cardiology', '555-8765', 'emily.johnson@email.com'),
  ('Dr. Michael', 'Davis', 'Pediatrics', '555-4321', 'michael.davis@email.com'),
  ('Dr. Sarah', 'White', 'Orthopedics', '555-7890', 'sarah.white@email.com');

-- Inserting data for Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDateTime, Status)
VALUES
  (1, 1, '2024-02-15 10:00:00', 'Confirmed'),
  (2, 2, '2024-02-16 14:30:00', 'Pending'),
  (3, 3, '2024-02-17 09:45:00', 'Confirmed'),
  (4, 1, '2024-02-18 11:30:00', 'Pending'),
  (5, 2, '2024-02-19 13:15:00', 'Confirmed'),
  (6, 3, '2024-02-20 16:00:00', 'Pending'),
  (7, 1, '2024-02-21 08:30:00', 'Confirmed'),
  (8, 2, '2024-02-22 12:45:00', 'Pending'),
  (9, 3, '2024-02-23 15:30:00', 'Confirmed'),
  (10, 1, '2024-02-24 07:15:00', 'Pending');

-- Inserting data for Medical Records
INSERT INTO MedicalRecords (PatientID, DoctorID, Date, Diagnosis, Prescription)
VALUES
  (1, 1, '2024-02-15', 'Hypertension', 'Medication A, Exercise'),
  (2, 2, '2024-02-16', 'Common Cold', 'Rest, Fluids, Medication B'),
  (3, 3, '2024-02-17', 'Fractured Arm', 'Cast and Pain Medication'),
  (4, 1, '2024-02-18', 'Skin Allergy', 'Topical Cream and Antihistamine'),
  (5, 2, '2024-02-19', 'Gastritis', 'Diet Modification, Medication C'),
  (6, 3, '2024-02-20', 'Migraine', 'Pain Medication and Rest'),
  (7, 1, '2024-02-21', 'Breast Cancer', 'Chemotherapy and Radiation'),
  (8, 2, '2024-02-22', 'Anxiety', 'Therapy and Medication D'),
  (9, 3, '2024-02-23', 'Diabetes', 'Insulin and Dietary Changes'),
  (10, 1, '2024-02-24', 'Urinary Tract Infection', 'Antibiotics and Hydration');

-- Inserting data for Ward Occupancy
INSERT INTO WardOccupancy (OccupancyStatus, PatientID, AdmissionDate, DischargeDate)
VALUES
  ('Occupied', 1, '2024-02-15', '2024-02-20'),
  ('Vacant', NULL, NULL, NULL),
  ('Occupied', 3, '2024-02-17', '2024-02-25'),
  ('Vacant', NULL, NULL, NULL),
  ('Occupied', 5, '2024-02-19', '2024-02-22'),
  ('Occupied', 6, '2024-02-20', '2024-02-28'),
  ('Occupied', 7, '2024-02-21', '2024-03-10'),
  ('Vacant', NULL, NULL, NULL),
  ('Occupied', 9, '2024-02-23', '2024-03-05'),
  ('Vacant', NULL, NULL, NULL);