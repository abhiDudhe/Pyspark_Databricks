SELECT name FROM sys. databases;

SELECT name FROM sys. tables;

use AdventureDb;

--find employee who are married
select * from HumanResources.Employee where MaritalStatus ='m'

-- find all employees under job title Marketing
select * from HumanResources.Employee where jobtitle ='marketing Specialist'

select * from HumanResources.Employee where jobtitle like 'marketing%'

-- find all employees under gender is male
select count(*) from HumanResources.Employee
select count(*) from HumanResources.Employee where gender = 'm'

-- find all employees under gender is female
select count(*) from HumanResources.Employee where gender = 'f'

--Q1.Find the employees having salaried flag is 1
select * from HumanResources.Employee where SalariedFlag=1

--Q2.Find the employees having vacation hr more than 70
select * from HumanResources.Employee where VacationHours > 70

--Q3.Find the employees having vacation hr more than 70 but less than 90
select * from HumanResources.Employee where VacationHours between 70 and 89

--Q4.Find all jobs having title as designer
select * from HumanResources.Employee where JobTitle like '%Design%'

--Q5.Find total employee works as technician
select * from HumanResources.Employee where JobTitle like '%technician%'


--Q6.Display data having nationalidnumber,job title,marital status,gender for all under
--marketing job title
select NationalIDNumber,JobTitle,MaritalStatus,gender from HumanResources.Employee where JobTitle  like 'marketing%'


--Q6.Find all unique marital status
select distinct(maritalstatus) from HumanResources.Employee  

--Q7.Find max vacation hours
select max(VacationHours) from HumanResources.Employee 

--Q8.Find the less sick leaves hours
select min(SickLeaveHours) from HumanResources.Employee 

--select max(VacationHours) from HumanResources.Employee  
--select min(SickLeaveHours) from HumanResources.Employee 


select * from HumanResources.Department;

--Q9.find all employee from production department
select * from HumanResources.Department where name='production'


--Q10.find all employee from production department where id is 7
select  * from HumanResources.Employee where BusinessEntityID in
(select BusinessEntityID from HumanResources.EmployeeDepartmentHistory where DepartmentID=7)

--11.find all department under reserch and dev
select * from HumanResources.Department  where GroupName = 'Research and Development'

--12.find all emp under and research and dev
select * from HumanResources.EmployeeDepartmentHistory where DepartmentID in (select DepartmentID from HumanResources.Department  where GroupName = 'Research and Development')
select * from HumanResources.Employee where BusinessEntityID in (select BusinessEntityID from HumanResources.EmployeeDepartmentHistory where DepartmentID in (select DepartmentID from HumanResources.Department  where GroupName = 'Research and Development'))

--13.find  all employees who work in day shift
  select * from HumanResources.Shift
 select * from HumanResources.EmployeeDepartmentHistory;
  select * from HumanResources.EmployeePayHistory
 select *  from HumanResources.Employee where BusinessEntityID in (select BusinessEntityID from HumanResources.EmployeeDepartmentHistory where ShiftID =(select ShiftID from HumanResources.Shift where Name='day'))

 --Q14.Find all employees where pay frequency is 1
 select *  from HumanResources.Employee where BusinessEntityID in( select BusinessEntityID from HumanResources.EmployeePayHistory where PayFrequency='1')

   


--15.find out all employee who are not placed
--1st way 
select * from HumanResources.JobCandidate where  BusinessEntityID is null

--2nd way 

select * from HumanResources.JobCandidate a where a.JobCandidateID not in (select JobCandidateID from HumanResources.JobCandidate b where BusinessEntityID  in (select BusinessEntityID from HumanResources.Employee))

--16.find the address of employee
select * from  person.Address 
select * from  HumanResources.Employee 
select * from Person.BusinessEntityAddress

select * from  person.Address where AddressID 
in (select AddressID from Person.BusinessEntityAddress where BusinessEntityID in (select BusinessEntityID from humanResources.Employee))



--Q17.Find the name for employees working in group research and development
select FirstName,MiddleName,LastName from Person.Person 
where BusinessEntityID in(
select BusinessEntityID from HumanResources.EmployeeDepartmentHistory 
where DepartmentID in
(select DepartmentID
from HumanResources.Department 
where GroupName = 'Research and Development'));