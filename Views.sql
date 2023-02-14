USE master;
GO

USE HospitalAdmissionsManagementDB;
GO

CREATE VIEW [dbo].[vPatientsInWard]
AS
SELECT [FirstName],
	[LastName]
FROM People
INNER JOIN HospitalBeds
ON People.PersonId = HospitalBeds.PersonId
WHERE HospitalBeds.WardId = 1
GO

CREATE VIEW [dbo].[vPatientList] AS
SELECT p.PersonId, p.FirstName, p.LastName, p.DateOfBirth, mc.MedicalCondition, a.DateOfAdmission, a.DateOfDischarge, b.WardId
FROM [dbo].[People] p
INNER JOIN [dbo].[PatientsMedicalCondition] mc ON p.PersonId = mc.PersonId
INNER JOIN [dbo].[Admissions] a ON p.PersonId = a.PersonId
INNER JOIN [dbo].[HospitalBeds] b ON p.PersonId = b.PersonId
WHERE a.DateOfDischarge IS NULL




