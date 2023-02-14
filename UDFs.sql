USE master;
GO

USE HospitalAdmissionsManagementDB;
GO

CREATE FUNCTION [dbo].[CountAdmissionsForDate] (@Date date)
RETURNS INT
AS
BEGIN
DECLARE @AdmissionCount INT
SELECT @AdmissionCount = COUNT(*)
FROM [dbo].[Admissions]
WHERE [DateOfAdmission] = @Date
RETURN @AdmissionCount
END
GO

SELECT dbo.CountAdmissionsForDate('2022-11-11');
GO
