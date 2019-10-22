use MIST353MidtermRedd;

if (OBJECT_ID('Advisor') is not null)
	drop table Advisor;
if (OBJECT_ID('Student') is not null)
	drop table Student;
if (OBJECT_ID('Appointment') is not null)
	drop table Appointment;

if (OBJECT_ID('proSearchAppointments') is not null)
	drop procedure proSearchAppointments;
if (OBJECT_ID('fnSearchAppointments') is not null)
	drop procedure fnSearchAppointments;

if (OBJECT_ID('proMakeAppointment') is not null)
	drop procedure proMakeAppointment;

if (OBJECT_ID('trgUpdateAvailabiltyStatus') is not null)
	drop trigger trgUpdateAvailabiltyStatus;


go



create procedure proMakeAppointmet
(
	@appointmentDate date,
	@appointStartTime  time,
	@studentID int,
	@errorMessage value 
}
as begin 

declare @insertSucceeded bit;

set @errorMessage = 'Appointment made.';
--error catching (inserts, updates,)
begin try

insert into Appointment
(AppointmentDate,AppointmentStartTime,AppointmentStatus)
values
(@appointmentDate,@appointmentStartTime, DateADD

set @insertSucceeded = 1;

end try 

begin catch

	set @insertSucceeded = 0;
	if (Error_Message() like '%fkAppointmentToStudent%'
		set @errorMessage = 'Appointment not made due to error'







create function fnSearchAppointments
(
@studentName varchar(50) = null,
@appointmentDate date = null,
@advisorID int

)
return @studentAppointments table
(
StudentID int, StudentName varchar(50),
AppointmentDate date, AppointmentStartTime time,
AppointmentEndTime time, AppointmentStatus varchar(50)

)

as
begin

		insert into @StudentAppointments
		(StudentID, StudentName, AppointmentDate, AppointmentStartTime, AppointEndTime, AppointmentStatus
		on A.StundetID = S.StudentID
		where StudentName = ISNULL (@studentName,S.StudentName)
		and A.AppointmentDate = ISNULL(@appointmentDate)
		and S.AdvisorID = @advisorID;
		
		return
		end;


	
	create trigger trgUpdateAvailabiltyStatusForInsert
	on Appointment
	after insert
	as 
	begin

		update AdvisorAvailabilty
		set AvailabilityStatus = 'Appointment'
		from Inserted I join Student S
			on I.StudentID = S.StudentID
			join AdvisorAvailabilty AA
			on S.AdvisorID = AA.AdvisorID
			and AA.AvailabiltyDate = I.AppointmentDate
			and AA.AvailabiltyStartTime = I.AppointmentStartTime

end;



create procedure procSearchForAppointments
(   --parameters input & output. Majority are input parameters-- 
	@studentName varchar(50) = null,
	@appointmentDate date =null,
	@advisorID int
)

as 
begin

select S.StudentID, S.StudentName, A.AppointmentDate, A.AppointmentDate, A.AppointmentStartTime, A.AppointmentEndTime, A.AppointmentStatus
from  Student as S
	join Appointment as A
		on S.StudentID = A.StudentID	
	where S.StudentName = @StudentName
		and A.AppointmentDate = @AppointmentDate
	end
	
	
	execute procSearchForAppointments 
	@StudentName = 'Jevon Carter',
	 @AppointmentDate = '2018-01-01';
	




	
create procedure procSearchForNumberOfNoShows
(   --parameters input & output. Majority are input parameters-- 
	@AppointmentStatus varchar(30) = 'No show',
	
);

as 
begin

SELECT S.StudentID,S.StudentName,COUNT(A.NumberOfNoShows) 
    FROM Student AS S  
    INNER JOIN  Appointment AS A ON A.StudentID=S.StudentID 
    WHERE NumberOfNoShow=2 AND A.AppointmentStatus=@AppointmentStatus 
    Group BY A.NumberOfNoShows,S.StudentName



	end

		
	execute procSearchForNumberOfNoShows
	@AppointmentStatus = 'No Show';



	--creation of a trigger that Updates BookCopy
create trigger trgUpdateAppointments
on Appointment
after insert
as
begin


-- body of the trigger this reports the action being done--

	
	select StudentID--@ISBN = --ISBN
	from inserted;

	update 
	set (A.Student,A.AppointmentDate,A.AppointmentStartTime,A.AppointmentEndTime, A.AppointmentStatus) = (select (inserted.StudentID) -- provides accumulation of the BookCopy amount and add the number inserted without recounting--
	from Appointment as A inserted 
	where inserted.StudentID = A.StudentID

	);



--creation of a trigger that Updates BookCopy
create trigger trgUpdateAdvisorAppointments
on Advisor
after insert
as
begin


-- body of the trigger this reports the action being done--

	
	select AdvisorID--@ISBN = --ISBN
	from inserted;

	update 
	set (AdvisorAvailabilty) = (select (inserted.StudentID) -- provides accumulation of the BookCopy amount and add the number inserted without recounting--
	from inserted 
	where inserted.AdvisorID = S.AdvisorID

	);

end




create trigger trgUpdateStudentNoShows
on Appointment
after update -- Updated(deleted/ inserted)
as
begin

	--for updates, you have both an insert (new) and 
	declare @studentID int, @appointmentStatus varchar

	select


Create Procedure proUsingfunction
(
	@studentName varchar (50)= null,
	@appointmentDate date= null,
	@advisorID int 
)
as begin 
		select studentID, StudentName, count (*) as 'NumberOfNoShows'
		from fnSearchAppointments (@studentName,@appointmentDate, @advisorID)
		where AppointmentStatus = 'No Show'
		group by studentID,StudentName
		end;

		/*
		exectue proUsingFunction */
		
create trigger trgUpdateAvailabiltyStatusForDelete
		on Appointment
		after delete
		as
		begin

			update AdvisorAvailability
			set AvilabityStatus = 'Available'
			from deleted D join Student S
				on D.StudentID = S.StudentID
				join AdvisorAvailability AA
				on S.AdvisorID = AA.AdvisorID
				and AA.AvailabilityDate = D.AppointmentDate
				and AA.AvailabilityStartTime = D.AppointmentStartTime

		end;

