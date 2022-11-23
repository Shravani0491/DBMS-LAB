create database Bank;
use Bank;
create table Branch
(branch_name varchar(20),
branch_city varchar(15),
assets int(6),
primary key(branch_name)
);
create table BankCustomer
(customer_name varchar(10),
customer_street varchar(20),
customer_city varchar(10),
primary key(customer_name)
);
create table BankAccount
(accno int,
branch_name varchar(20),
balance int,
primary key(accno,branch_name),
foreign key(branch_name) references Branch(branch_name)
);
create table Depositer
(customer_name varchar(10),
accno int,
primary key(customer_name,accno),
foreign key(customer_name) references BankCustomer(customer_name),
foreign key(accno) references BankAccount(accno));
create table Loan
(loan_number int,
branch_name varchar(20),
amount int,
primary key(loan_number,branch_name),
foreign key(branch_name) references Branch(branch_name));
insert into Branch values('SBI_Chamrajpet','Bangalore',50000),('SBI_ResidencyRoad','Bangalore',10000),('SBI_ParlimentRoad','Delhi',10000),('SBI_Jantarmantar','Delhi',20000);
select * from Branch;
insert into Branch values('SBI_ShivajiRoad','Bmbay',20000);
insert into BankCustomer values('Avinash','Bull_Temple_road','Bangalore'),('Dinesh','Bannergatta_Road','Bangalore'),('Nikil','Akbar_Road','Delhi'),('Ravi','Prithviraj_Road','Delhi');
insert into BankCustomer values('Mohan','NationalCollege_Road','Bangalore');
insert into BankAccount values(1,'SBI_Chamrajpet',2000),(2,'SBI_ResidencyRoad',5000),(3,'SBI_ShivajiRoad',6000),(4,'SBI_ParlimentRoad',9000),(5,'SBI_Jantarmantar',8000),(6,'SBI_ShivajiRoad',4000),(8,'SBI_ResidencyRoad',4000),(9,'SBI_ParlimentRoad',3000),(10,'SBI_ResidencyRoad',5000),(11,'SBI_Jantarmantar',2000);
insert into Depositer values('Avinash',1),('Dinesh',2),('Nikil',4),('Ravi',5),('Avinash',8),('Nikil',9),('Dinesh',10),('Nikil',11);
insert into Loan values(1,'SBI_Chamrajpet',1000),(2,'SBI_ResidencyRoad',2000),(3,'SBI_ShivajiRoad',3000),(4,'SBI_ParlimentRoad',4000),(5,'SBI_Jantarmantar',5000);
select * from Branch;
select * from BankCustomer;
select * from BankAccount;
select * from Depositer;
select * from BankCustomer;
select * from Loan;
alter Branch rename assets to assets_in_lakhs;
alter table Branch rename column assets to assets_in_lakh;
select branch_name,assets_in_lakh from Branch;
select assets_in_lakh/100000 from Branch;
select customer_name from Depositer d inner join BankAccount b on d.accno=b.accno and b.branch_name='SBI_ResidencyRoad' group by customer_name,branch_name having count(d.accno)>=2;
create view total_sum_loan as select branch_name,amount total_sum from Loan;
select * from total_sum_loan;
select a.branch_name,a.balance+1000 as updated_balance from BankAccount a,BankCustomer b,Depositer d where b.customer_name=d.customer_name and a.accno=d.accno and b.customer_city='Bangalore';
