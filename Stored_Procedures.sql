USE master;
GO

USE HospitalAdmissionsManagementDB;
GO

CREATE PROCEDURE [dbo].[AddPatient]
(
	@FirstName varchar(50),
	@LastName varchar(50),
	@DateOfBirth date,
	@MedicalCondition varchar(120),
	@WardId int,
	@AdmissionDate date,
	@DischargeDate date
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @PersonId int
			
			INSERT INTO [dbo].[People] (FirstName, LastName, DateOfBirth)
			VALUES (@FirstName, @LastName, @DateOfBirth)
			
			SET @PersonId = SCOPE_IDENTITY()
			
			INSERT INTO [dbo].[PatientsMedicalCondition] (PersonId, MedicalCondition)
			VALUES (@PersonId, @MedicalCondition)
			
			INSERT INTO [dbo].[Admissions] (PersonId, DateOfAdmission, DateOfDischarge)
			VALUES (@PersonId, @AdmissionDate, @DischargeDate)
			
			UPDATE [dbo].[HospitalBeds]
			SET PersonId = @PersonId
			WHERE WardId = @WardId AND PersonId IS NULL
			
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			
		THROW
	END CATCH
END

EXEC [dbo].[AddPatient] 
	'John', 
	'Doe', 
	'2000-01-01', 
	'Flu', 
	1, 
	'2023-02-10', 
	NULL
GO

CREATE PROCEDURE [dbo].[GetPatientInfo] (@PersonId int)
AS
BEGIN
    SELECT p.FirstName, p.LastName, p.DateOfBirth, mc.MedicalCondition, a.DateOfAdmission, a.DateOfDischarge, b.WardId
    FROM [dbo].[People] p
    INNER JOIN [dbo].[PatientsMedicalCondition] mc ON p.PersonId = mc.PersonId
    INNER JOIN [dbo].[Admissions] a ON p.PersonId = a.PersonId
    INNER JOIN [dbo].[HospitalBeds] b ON p.PersonId = b.PersonId
    WHERE p.PersonId = @PersonId
END

EXEC [dbo].[GetPatientInfo] @PersonId = 1