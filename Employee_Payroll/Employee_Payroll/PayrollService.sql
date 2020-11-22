/*UC-1
  Creating Payroll service database
*/
create database PayrollService;
use PayrollService;
/*UC-2 
  Creating table 
*/
create table employee_payroll
(
id int identity(1,1) not null,
name varchar(25) not null,
salary money not null,
start_date date not null
)
/*
UC-3
 Inserting Data to table
*/
insert into employee_payroll values
('Bill',100000.00,'2020-01-03'),
('Terissa',200000.00,'2019-01-13'),
('Charlie',300000.00,'2018-04-21');
/*
UC-4
Displaying data in table
*/
select * from employee_payroll;
/*
UC-5 
Displaying particular data
*/
select salary from employee_payroll where name = 'Bill';
select * from employee_payroll where start_date between CAST('2018-01-01' as date) AND SYSDATETIME();
/*
UC-6 
Adding column to table and updating data.
*/
Alter table employee_payroll add Gender char;

Update employee_payroll set Gender = 'M' where name = 'Bill' or name = 'Charlie';
Update employee_payroll set Gender = 'F' where name = 'Terissa';
/*
UC-7 
Using math functions to find SUM AVERAGE MINIMUM MAXIMUM
*/
select Gender,SUM(salary) as sum from employee_payroll group by Gender;
select Gender,AVG(salary) as avg from employee_payroll group by Gender;
select Gender,MIN(salary) as min from employee_payroll group by Gender;
select Gender,MAX(salary) as max from employee_payroll group by Gender;
select Gender,COUNT(gender) as count from employee_payroll group by Gender;
/*
UC-8
 Adding More Columns to table
*/
Alter table Employee_Payroll Add Employee_Address varchar(200), Department Varchar(50), Phone_Number Varchar(12);
Update employee_payroll set Employee_Address = 'Brihimgham', Department = 'HR',Phone_Number = '9876543210' where name = 'Bill';
Update employee_payroll set Employee_Address = 'California', Department = 'Technical',Phone_Number = '9871234560' where name = 'Terissa';
Update employee_payroll set Employee_Address = 'Vegas', Department = 'Testing',Phone_Number = '9182736450'  where name = 'Charlie';
/*
UC-9 
 Adding more columns
*/
alter table Employee_Payroll Add Basic_Pay money null default 0,  Deductions money null default 0, Taxable_Pay money null default 0, Income_Tax money null default 0, Net_Pay money null default 0;
/*
 UC-10
  Making Terissa as a part of sales department
 */
 insert into Employee_Payroll(name,salary,start_date,Gender,Employee_Address,Department,Phone_Number) values ('Terissa','200000.00','2019-01-13','F','Newyork','Sales & Marketing','9871234560');
 /*
  UC-11
  Implementing ER Diagram
*/
create table Employee
(
Employee_Id int PRIMARY KEY identity(1,1) not null,
Name varchar(25) not null,
Start_Date date not null,
Gender varchar(10) not null,
Address varchar(100) not null,
Dept_no int not null,
Phone_Number varchar(10) not null
);
alter table Employee
Add FOREIGN KEY (Dept_no) REFERENCES Department(Dept_no);

insert into Employee values
('Bill','2020-01-03','M', 'Paris', 1,'9876543210'),
('Terissa','2019-01-13','F', 'France', 2,'8765432109'),
('Charlie','2018-04-21','M', 'London', 3,'7654321098');

Select * from Employee
/*
 Performing uc-7 with employee table
*/
select Gender,COUNT(gender) as count from Employee group by Gender;

create table Department
(
Dept_no int primary key identity(1,1) not null,
Dept_name varchar(30) not null,
Dept_location varchar(50) not null,
);
alter table Department add
FOREIGN KEY (Employee_Id) REFERENCES Employee (Employee_Id);

select * from Department;
insert into Department values
('Marketing','Paris'),
('Sales','France'),
('HR','London');

create table Salary(
Salary_id int PRIMARY KEY identity(1,1) not null,
Employee_Id int not null,
Basic_pay money not null,
Deductions money not null,
Taxable_pay money not null,
Income_tax money not null,
Net_pay money not null,
FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id)
);

select * from Salary
insert into Salary values
(1,50000.00, 512.00, 530.00, 780.00,43500.00),
(2,41000.00, 503.00, 506.00, 580.00,1500.00),
(3,9000.00, 501.00, 508.00, 560.00,1400.00);

/*
 UC-12
 retriving data from the created tables
*/

/* Retrieve all records for employee*/
select emp.Employee_Id, emp.Name, emp.Start_Date, emp.Gender, emp.Address, emp.Phone_Number,
dept.Dept_no, dept.Dept_name,dept.Dept_location,
sal.Salary_id, sal.Basic_pay, sal.Deductions, sal.Taxable_pay, sal.Income_tax, sal.Net_pay
from Employee emp, Department dept, Salary sal
where emp.Employee_Id = dept.Employee_Id and sal.Employee_Id = emp.Employee_Id;
/* Retriving all the records for a particular employee*/
select emp.Employee_Id, emp.Name, emp.Start_Date, emp.Gender, emp.Address, emp.Phone_Number,
sal.Salary_id, sal.Basic_pay, sal.Deductions, sal.Taxable_pay, sal.Income_tax, sal.Net_pay
from Employee emp, Salary sal
where emp.Employee_Id = sal.Employee_Id and emp.Name = 'Bill';
/*Getting data in a particular time frame*/
select * from Employee emp, Department dept, Salary sal
where emp.Employee_Id = dept.Employee_Id and sal.Employee_Id = emp.Employee_Id and
emp.Start_Date between CAST('2018-04-21' as date) and SYSDATETIME();

/*Performing math operations*/
SELECT Sum(Net_pay) FROM Salary INNER JOIN Employee 
ON Salary.Employee_Id=Employee.Employee_Id WHERE Gender='M' GROUP BY Gender;

SELECT Avg(Net_pay) FROM Salary INNER JOIN Employee 
ON Salary.Employee_Id=Employee.Employee_Id WHERE Gender='M' GROUP BY Gender;

SELECT Min(Net_pay) FROM Salary INNER JOIN Employee 
ON Salary.Employee_Id=Employee.Employee_Id WHERE Gender='M' GROUP BY Gender;

SELECT Max(Net_pay) FROM Salary INNER JOIN Employee 
ON Salary.Employee_Id=Employee.Employee_Id WHERE Gender='M' GROUP BY Gender;