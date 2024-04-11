use CourseP418

select * from Students;

select charindex('@', [Email]) from Students

select substring ([Email],charindex('@',[Email])+1,Len([Email])) from Students;

select substring ([Email],1,charindex('@',[Email])-1) from Students;