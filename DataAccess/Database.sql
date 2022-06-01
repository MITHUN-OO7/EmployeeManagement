Alter Proc Proc_Employee
@Id int=0,
@FirstName Varchar(500),
@LastName Varchar(500),
@DOB DateTime,
@Email Varchar(150),
@EmploymentDate DateTime,
@Address Varchar(500),
@City  Varchar(500),
@State  Varchar(500),
@Country Varchar(500),
@Skills Varchar(500),
@Flag int=0
AS
BEGIN
	IF @Flag = 0
		BEGIN
			IF NOT EXISTS (Select Id from Employees where Email=@Email)
				BEGIN
					Insert into Employees([EmployeeId], [FirstName], [LastName], [DOB], [Email], [EmploymentDate], [Address], [City], [State], [Country])
					Values(1,@FirstName, @LastName,@DOB,@Email,@EmploymentDate,@Address,@City,@State,@Country)
					Insert into EmployeeSkills(EmployeeID, SkillId) SELECT @@IDENTITY ,value FROM STRING_SPLIT('2,5,3', ',')
				END
		END
	IF @Flag = 1
		BEGIN
			IF EXISTS (Select Id from Employees where Email=@Email)
				BEGIN
					Update Employees SET [FirstName]=@FirstName, [LastName]=@LastName, [DOB]=@DOB, [Email]=@Email, [EmploymentDate]=@EmploymentDate, 
					[Address]=@Address, [City]=@City, [State]=@State, [Country]=@Country where Id=@Id;
				END
		END
	IF @Flag = 2
		BEGIN
			IF EXISTS (Select Id from Employees where Email=@Email)
				BEGIN
					Delete from Employees where Id=@Id;
				END
		END
END
go
Insert into Skills(Name) values('DotNet Core'),('Dot Net'),('Java Script'),('Java'),('JQuery'),('CSS'),('Angular'),('React')

