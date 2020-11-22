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