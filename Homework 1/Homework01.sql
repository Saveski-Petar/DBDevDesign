CREATE TABLE IF NOT EXISTS Student (
	ID serial PRIMARY KEY NOT NULL,
	FirstName varchar(100) NOT NULL,
	LastName varchar(100) NOT NULL, 
	DateOfBirth DATE NOT NULL,
	EnrolledDate DATE NOT NULL,
	Gender varchar(5) CHECK(gender='Male' or gender='Female'),
	NationalIDNumber varchar(13) NOT NULL,
	StudentCardNumber varchar(7) NOT NULL


);
CREATE TABLE IF NOT EXISTS Teacher (
	ID serial PRIMARY KEY NOT NULL,
	FirstName varchar(100) NOT NULL, 
	LastName varchar(100) NOT NULL, 
	DateOfBirth DATE NOT NULL, 
	AcademicRank varchar(20),
	HireDate DATE NOT NULL
);
CREATE TABLE IF NOT EXISTS GradeDetails (
	 ID serial PRIMARY KEY NOT NULL, 
	 GradeID INTEGER NOT NULL,
	 AchievementTypeID INTEGER NOT NULL,
	 AchievementPoints INTEGER NOT NULL,
	 AchievementMaxPoints INTEGER NOT NULL,
	 AchievementDate DATE NOT NULL
);
CREATE TABLE IF NOT EXISTS Course (
	ID serial PRIMARY KEY NOT NULL,
	Name varchar(100) NOT NULL,
	Credit smallint NOT NULL,
	AcademicYear DATE,
	Semester varchar(20)
);
CREATE TABLE IF NOT EXISTS Grade (
	ID serial PRIMARY KEY NOT NULL,
	StudentID INTEGER NOT NULL ,
	CourseID INTEGER NOT NULL,
	TeacherID INTEGER NOT NULL,
	Grade smallint not null,
	Comment varchar(500),
	CreatedDate DATE
);
CREATE TABLE IF NOT EXISTS AchievementType (
	ID serial PRIMARY KEY NOT NULL,
	Name varchar(20),
	Description varchar(500),
	ParticipationRate decimal(5,2)
);

