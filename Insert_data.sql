USE master;
GO

USE HospitalAdmissionsManagementDB;
GO

INSERT INTO [dbo].[People](
	[FirstName],
	[LastName],
	[DateOfBirth]
)
VALUES('Mary', 'Sithole', '1980-05-06'),
	('Sipho', 'Ngubane', '1975-10-10'),
	('Pule', 'Maseko', '1991-02-24'),
	('John', 'Duck', '1960-06-14'),
	('Neo', 'Mokoena', '1996-12-06'),
	('James', 'Smith', '1984-07-15'),
	('Sarah', 'Johnson', '1979-03-20')
GO

INSERT INTO [dbo].[Admissions](
	[PersonId],
	[DateOfAdmission],
	[DateOfDischarge]
)
VALUES(1,'2022-11-11','2023-01-12'),
	(2,'2022-10-14','2022-10-30'),
	(3,'2022-06-12','2022-06-21'),
	(4,'2022-08-17','2022-10-05'),
	(5,'2023-01-25','2023-02-05')
GO

INSERT INTO [dbo].[DoctorSpecialty](
	[SpecialtyName]
)
VALUES('Allergies and Immunology'),
	('Dermatology'),
	('Diagnostic radiology'),
	('Neurology'),
	('Obstetrics and gyneacology'),
	('Pathology'),
	('Pediatrics'),
	('Psychiatry'),
	('Radiation oncology'),
	('Surgery'),
	('Urology')
GO

INSERT INTO [dbo].[Doctors](
	[PersonId],
	[DrSpecialtyId]
	--[DoctorImage]
)
VALUES(6, 6),
	(7, 3)
GO

INSERT INTO [dbo].[Wards](
	[WardName],
	[BedCount]
)
VALUES('Aged Care', 50),
	('Emergency', 25),
	('High Dependency Care', 20),
	('Intensive Care', 30),
	('Medical Ward', 50),
	('Mental Health', 30),
	('Neuroscience', 25),
	('Nursery', 25),
	('Pediatrics', 100),
	('Surgery', 10),
	('Rehabilitation', 60),
	('Special Unit', 25),
	('Maternity', 60)
GO

INSERT INTO [dbo].[HospitalBeds](
	[WardId],
	[PersonId]
)
VALUES(1,1),
	(1,2),
	(6,3),
	(7,4),
	(5,5)
GO

INSERT INTO [dbo].[PatientsMedicalCondition](
	[PersonId],
	[MedicalCondition]
)
VALUES(1,'stroke'),
	(2, 'burns'),
	(3,'Diabetes'),
	(4, 'lung cancer'),
	(5, 'Hypertension')
GO

INSERT INTO [dbo].[Roles](
	[RoleName]
)
VALUES('Doctor'),
	('Nurse'),
	('Patient')
GO

INSERT INTO [dbo].[PersonRole](
	[PersonId],
	[RoleId]
)
VALUES(1,3),
	(2,3),
	(3,3),
	(4,3),
	(5,3),
	(6,1),
	(7,1)
GO