USE master;
GO

USE HospitalAdmissionsManagementDB;
GO

CREATE TABLE [dbo].[People](
	[PersonId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL
);
GO

CREATE TABLE [dbo].[DoctorSpecialty](
	[DrSpecialtyId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[SpecialtyName] [varchar](120) NOT NULL
);
GO

CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[PersonId] [int] NOT NULL,
	[DrSpecialtyId] [int] NOT NULL,
	[DoctorImage] [varbinary](max) NULL
);
GO

ALTER TABLE [dbo].[Doctors]
	ADD CONSTRAINT FK_Doctors_People FOREIGN KEY(PersonId)
	REFERENCES [dbo].[People] (PersonId)
GO

CREATE TABLE [dbo].[PatientsMedicalCondition](
	[PatientId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[PersonId] [int],
	[MedicalCondition] [varchar](120)
);
GO

ALTER TABLE [dbo].[PatientsMedicalCondition]
	ADD CONSTRAINT FK_MedicalCondition_People FOREIGN KEY(PersonId)
	REFERENCES [dbo].[People] (PersonId)
GO

CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[RoleName] [varchar](120) NOT NULL
);
GO

CREATE TABLE [dbo].[PersonRole](
	[PersonRoleId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[RoleId] [int] NOT NULL,
	[PersonId] [int] NOT NULL
);
GO

ALTER TABLE [dbo].[PersonRole]
	ADD CONSTRAINT FK_Person FOREIGN KEY(PersonId)
	REFERENCES [dbo].[People] (PersonId)
GO

ALTER TABLE [dbo].[PersonRole]
	ADD CONSTRAINT FK_Role FOREIGN KEY(RoleId)
	REFERENCES [dbo].[Roles] (RoleId)
GO

CREATE TABLE [dbo].[Admissions](
	[AdmissionId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[PersonId] [int] NOT NULL,
	[DateOfAdmission] [date] NULL,
	[DateOfDischarge] [date] NULL
);
GO

DROP TABLE Admissions

ALTER TABLE [dbo].[Admissions]
	ADD CONSTRAINT FK_Patient_Admission FOREIGN KEY(PersonId)
	REFERENCES [dbo].[People] (PersonId)
GO

CREATE TABLE [dbo].[Wards](
	[WardId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[WardName] [varchar](120) NOT NULL,
	[BedCount] [int] NOT NULL
);
GO

CREATE TABLE [dbo].[HospitalBeds](
	[BedId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[WardId] [int] NOT NULL,
	[PersonId] [int] NULL
);
GO

ALTER TABLE [dbo].[HospitalBeds]
ADD CONSTRAINT AK_PersonId UNIQUE (PersonId);   
GO  

ALTER TABLE [dbo].[HospitalBeds]
	ADD CONSTRAINT FK_Ward FOREIGN KEY(WardId)
	REFERENCES [dbo].[Wards] (WardId)
GO

ALTER TABLE [dbo].[HospitalBeds]
	ADD CONSTRAINT FK_Patient_Bed FOREIGN KEY(PersonId)
	REFERENCES [dbo].[People] (PersonId)
GO

select * from Wards

select * from HospitalBeds



