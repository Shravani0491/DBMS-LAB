create database insurance5;
use insurance5;
create table person
(driver_id char(10),
name varchar(20),
address varchar(20),
primary key(driver_id)
);
desc person;
create table car
(reg_num char(10),
model varchar(10),
year year(4),
primary key(reg_num)
);
create table owns
(driver_id char(10),
reg_num char(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num)
);
create table participated 
(driver_id char(10),
reg_num char(10),
report_num int(4),
damage_amount int(6),
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num)
);
create table accident 
(report_num int(4),
accident_date date,
location varchar(20),
primary key(report_num)
);
desc accident;
insert into person values('A01','Richard','Srinivas nagar'),('A02','Pradeep','Rajaji nagar'),('A03','Smith','Ashok nagar'),('A04','Venu','N R Colony'),('A05','Jhon','Hanumanth nagar');
select * from person;
insert into car values('KA052250','Indica',1990);
select * from car;
insert into car values('KA031181','Lancer',1957),('KA095477','Toyota',1998),('KA053408','Honda',2008),('KA041702','Audi',2005);

insert into owns values('A01','KA052250'),('A02','KA053408'),('A03','KA031181'),('A04','KA095477'),('A05','KA041702');
select * from owns;
insert into accident values(11,'2001-01-03','Mysore Road');
select * from accident;
insert into accident values(12,'2002-02-04','South end Circle'),(13,'2021-01-03','Bull temple Road'),(14,'2017-02-08','Mysore Road'),(15,'2004-03-05','Kanakpura Road');
insert into participated values('A01','KA052250',11,10000);
insert into participated values('A02','KA053408',12,50000),('A03','KA095477',13,25000),('A04','KA031181',14,3000),('A05','KA041702',15,5000);
select * from person where name like '%d';
select * from car where year>=1995;
select * from car where reg_num NOT IN ('KA052250','KA053408');
select distinct location from accident;
select accident_date,location from accident;
update participated set damage_amount=25000
where reg_num='KA053408' AND report_num=12;
select * from participated;
insert into accident values(16,'2008-03-08','Domlur');
select * from accident;
select * from participated order by damage_amount desc;
select max(damage_amount) from participated;
select avg(damage_amount) from participated;
select * from person where name like '%d';
select distinct location from accident; 
