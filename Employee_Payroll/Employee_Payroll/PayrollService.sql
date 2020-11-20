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