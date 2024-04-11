use CourseP418

select * from Employees;

alter table Employees add  default 'xxx' for [Surname];

insert into Employees
    ([Name],[Email])
values
    ('Oruc', 'oruc@gmail.com')

alter table Employees
add [Age] int check (Age >18);

insert into Employees
    ([Name],[Email],[Age])
values
    ('Oruc', 'oruc11@gmail.com' , 19)



select Count (*) as 'Employees count' from Employees;

select Sum (Age) as 'Employees age sum ' from Employees;

select Avg (Age) as 'Employees avg age' from Employees;

select Max (Age) as 'Employees max age' from Employees;

select Min (Age) as 'Employees min age' from Employees;



select SUBSTRING('Semed bey ' ,1,3);

select REPLACE('Salamlar' ,'s','d');

select SUBSTRING([Surname],1,4) from Employees;



declare @avgAge int = (select AVG(age) from Employees)
declare @sumAge int = (select Sum(age) from Employees)

if @sumAge>@avgAge
   print 'Yes'
else 
   print 'No'


drop table Students;

create table Countries(
[Id] int primary key identity (1,1),
[Name] nvarchar (50)
)

insert into Countries([Name])
values ('Azerbaycan'),
       ('Turkiye'),
       ('Ispanya'),
       ('Almanya')


select * from Countries


create table Cities(
[Id] int primary key identity (1,1),
[Name] nvarchar (50),
[CountryId] int,
foreign key (CountryId) references Countries(id)
)

insert into Cities([Name],[CountryId])
values ('Baku',1),
       ('Madrid',3),
       ('Ankara',2),
       ('Frankfurt',4),
       ('Berlin',4)


select * from Cities

select * from Cities where CountryId=1


create table Students(
[Id] int primary key identity (1,1),
[Fullname] nvarchar (50),
[Age] int,
[Address] nvarchar (50),
[Email] nvarchar (50),
[CityId] int,
foreign key (CityId) references Cities(Id)
)


select * from Students




create table Teachers(
[Id] int primary key identity (1,1),
[FullName] nvarchar (50),
[Salary] float ,
[Age] int ,
[CityId] int,
foreign key (CityId) references Cities(id)
)


select * from Teachers;



create table TeachersStudent(
[Id] int primary key identity (1,1),
[TeacherId] int ,
[StudentId] int ,
foreign key (TeacherId) references Teachers(id),
foreign key (StudentId) references Students(id)
)

select * from TeachersStudent;




seLect ct.Name as 'City', co.Name as 'Country' from Countries co
inner join Cities ct
on co.Id = ct.CountryId


seLect co.Name as 'Country', ct.Name as 'City' from Countries co
left join Cities ct
on co.Id = ct.CountryId


seLect co.Name as 'Country', ct.Name as 'City' from Countries co
right join Cities ct
on co.Id = ct.CountryId


seLect co.Name as 'Country', ct.Name as 'City' from Countries co
full join Cities ct
on co.Id = ct.CountryId


seLect st.Fullname as 'Student Fullname', st.Age as 'Student age' , st.Address as 'Student Address', ct.Name as 'City name', co.Name as 'Country name' , t.FullName as 'Teacher Fullnames' from Students st
inner join Cities ct
on ct.Id = st.CityId
inner join Countries co
on ct.CountryId = co.id
inner join TeachersStudent ts
on st.id = ts.StudentId
inner join Teachers t
on t.Id = ts.TeacherId
where t.id=1
