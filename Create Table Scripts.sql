-- Creating Patients table
CREATE TABLE Patients (
  PatientID INT PRIMARY KEY IDENTITY(1,1),
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  DateOfBirth DATE,
  Gender VARCHAR(10),
  ContactNumber VARCHAR(15),
  Email VARCHAR(100)
);

-- Creating Doctors table
CREATE TABLE Doctors (
  DoctorID INT PRIMARY KEY IDENTITY(1,1),
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Specialization VARCHAR(50),
  ContactNumber VARCHAR(15),
  Email VARCHAR(100)
);

-- Creating Appointments table
CREATE TABLE Appointments (
  AppointmentID INT PRIMARY KEY IDENTITY(1,1),
  PatientID INT,
  DoctorID INT,
  AppointmentDateTime DATETIME,
  Status VARCHAR(20),
  FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
  FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Creating MedicalRecords table
CREATE TABLE MedicalRecords (
  RecordID INT PRIMARY KEY IDENTITY(1,1),
  PatientID INT,
  DoctorID INT,
  Date DATE,
  Diagnosis VARCHAR(100),
  Prescription VARCHAR(200),
  FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
  FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Creating WardOccupancy table
CREATE TABLE WardOccupancy (
  WardID INT PRIMARY KEY IDENTITY(1,1),
  OccupancyStatus VARCHAR(20),
  PatientID INT,
  AdmissionDate DATE,
  DischargeDate DATE,
  FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);