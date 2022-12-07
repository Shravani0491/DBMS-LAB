create database employee;
use employee;
create table Project
(pno int,
ploc varchar(20),
pname varchar(20),
primary key(pno));
create table Dept
(deptno int,
dname varchar(15),
dloc varchar(20),
primary key(deptno));
create table Employee
(empno int,
ename varchar(10),
mgr_no int,
hiredate date,
sal int,
deptno int,
primary key(empno,deptno),
foreign key(deptno) references Dept(deptno));
create table Assigned_to
(empno int,
pno int,
job_role varchar(20),
primary key(empno,pno),
foreign key(empno) references Employee(empno),
foreign key(pno) references Project(pno));
create table Incentives
(empno int,
incentive_date date,
incentive_amount int,
primary key(empno,incentive_date),
foreign key(empno) references Employee(empno));
insert into Project values(1,'Bengaluru','Small_Steel'),(2,'Chennai','Silly_Jazz'),(3,'Hyderabad','Othello'),(4,'Mysuru','Hornets'),(5,'Delhi','Moonshot'),(6,'Mumbai','Masque'),(7,'Kolkata','Malibu');
insert into Dept values(1,'HR','Bengaluru'),(2,'IT','Mysuru'),(3,'AccFin','Mumbai'),(4,'Production','Kolkata'),(5,'R&D','Delhi'),(6,'Marketing','Hyderabad');
insert into Employee values(1,'Dinesh',2,'2008-02-11',100000,3),(2,'Ramesh',4,'2009-01-12',150000,4),(3,'Suresh',5,'2010-10-09',250000,2),(4,'Rahul',6,'2004-02-19',500000,1),(5,'Nikil',1,'2005-04-12',50000,6),(6,'Mohan',3,'2012-05-14',80000,5);
select * from Employee;
insert into Assigned_to values(1,6,'System-analyst'),(2,3,'Software_architect'),(3,2,'Project_manager'),(4,5,'Team_leader'),(5,4,'Planner'),(6,1,'Software_engineer');
insert into Incentives values(1,'2009-01-12',40000),(2,'2012-02-19',35000),(3,'2015-10-12',50000),(4,'2004-10-20',100000);
select empno from Employee where empno not in(select Incentives.empno from Employee cross join Incentives on Employee.empno=Incentives.empno);
