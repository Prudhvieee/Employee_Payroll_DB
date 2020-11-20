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
