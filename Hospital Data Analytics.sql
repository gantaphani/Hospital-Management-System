--Hospital Management System
/*
List average age of male and female patients.
*/
SELECT Gender,Avg(DATEDIFF(YEAR,DateOfBirth,getdate())) AS [Average age]
FROM Patients
group by Gender

/*
List doctors with the highest number of scheduled appointments and list their name and the count of appointments.
*/
with cte as(
SELECT FirstName +' '+LastName as Name,count(distinct PatientID) as [Count of Scheduled Appointments]
FROM Doctors d
JOIN Appointments a on d.DoctorID=a.DoctorID
WHERE Status='Confirmed'
GROUP BY FirstName,LastName
)
,result as
(
SELECT *,dense_rank() over(order by [Count of Scheduled Appointments] desc) as [rank_Count of Scheduled Appointments]
FROM CTE
)
SELECT Name,[Count of Scheduled Appointments] FROM result WHERE [rank_Count of Scheduled Appointments]=1

/* 
List the patients with their diagnosis in one record
*/
SELECT p.FirstName+' '+p.LastName as Name
,STUFF((SELECT ','+Diagnosis FROM MedicalRecords temp WHERE temp.PatientID=res.PatientID FOR XML PATH('')),1,1,'') AS [Diagnosis_List]
FROM MedicalRecords res
RIGHT JOIN Patients p ON res.PatientID=p.PatientID
GROUP BY res.PatientID,p.FirstName,p.LastName

/*
Longest Occupied Wards:
Find the patient names and ward occupancy duration for the top 3 longest occupied wards.
*/
with cte as(
SELECT p.FirstName+' '+p.LastName as Name,
DATEDIFF(HOUR,AdmissionDate,DischargeDate) as [Occupancy time]
FROM WardOccupancy w
JOIN Patients p ON p.PatientID=w.PatientID
)
SELECT TOP 3 * FROM cte order by [Occupancy time] desc

/*
Patients Without Appointments:
Find the names and contact information of patients who do not have any scheduled appointments.
*/
SELECT p.FirstName+' '+p.LastName as Name,
p.ContactNumber,
p.Email
FROM patients p
LEFT JOIN Appointments a on a.PatientID=p.PatientID
WHERE a.AppointmentID IS NUll

/*
List the patients who have appointments with doctors of different specialties on the same day.
Display their names along with the conflicting details.
*/
SELECT p.FirstName +' '+p.LastName as [Patient Name],
FORMAT(a.AppointmentDateTime,'dd-MM-yyyy') as [Appointment Date],
d.FirstName+' '+d.LastName as [Doctor Name],
d.Specialization
FROM Patients p
JOIN Appointments a on p.PatientID=a.PatientID
JOIN Doctors d on a.DoctorID=d.DoctorID
JOIN Appointments a1 on a1.PatientID=a.PatientID
AND FORMAT(a.AppointmentDateTime,'dd-MM-yyyy') = FORMAT(a1.AppointmentDateTime,'dd-MM-yyyy') AND a.DoctorID<>a1.DoctorID
JOIN Doctors d1 on a1.DoctorID=d1.DoctorID
WHERE d.Specialization<>d1.Specialization
Order by p.patientid

/*
Ward Occupancy Analysis:
Find the total number of vacant wards and the average duration of occupancy for occupied wards.
*/
SELECT 
SUM(CASE WHEN OccupancyStatus='Vacant' THEN 1 ELSE 0 END) as [Count of vacant wards],
Avg(DATEDIFF(day,AdmissionDate,DischargeDate)) AS [Average duration of occupancy in days]
FROM WardOccupancy

/*
List doctors who have treated patients with the most diverse range of diagnoses.
Display their names and the count of distinct diagnoses.
*/
with cte as(
SELECT d.FirstName+' '+d.LastName as [Doctor Name],
COUNT(distinct Diagnosis) as [count of distinct diagnoses] 
FROM Doctors d
JOIN MedicalRecords m on m.DoctorID=d.DoctorID
Group by d.FirstName,d.LastName
)
,result as
(
SELECT *,dense_rank() over(order by [count of distinct diagnoses] desc) as [rank_count of distinct diagnoses]
FROM CTE
)
SELECT [Doctor Name],[count of distinct diagnoses] FROM result WHERE [rank_count of distinct diagnoses]=1

/*
List all doctors who have pending appointments
*/
SELECT DISTINCT d.* from Appointments a
JOIN Doctors d on d.DoctorID=a.DoctorID
WHERE a.Status='Pending'

/*
List all patients with their latest medical records
*/
with cte as(
SELECT PatientID,MAX(RecordID) as RecordID
FROM medicalrecords m
GROUP BY PatientID
)
SELECT p.FirstName+' '+p.LastName as Name,m.Date,m.Diagnosis,m.Prescription
FROM cte c
JOIN MedicalRecords m on c.PatientID=m.PatientID AND c.RecordID=m.RecordID
RIGHT JOIN Patients p ON p.PatientID=m.PatientID
ORDER BY p.PatientID