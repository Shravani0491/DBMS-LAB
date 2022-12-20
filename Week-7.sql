create database Supplier;
use Supplier;
create table Supplier
(sid int,
sname varchar(20),
city varchar(10),
primary key(sid));
create table Parts
(pid int,
pname varchar(20),
color varchar(10),
primary key(pid));
create table Catalog
(sid int,
pid int,
cost int,
primary key(sid,pid),
foreign key(sid) references Supplier(sid),
foreign key(pid) references Parts(pid));
insert into Supplier values(10001,'Acme Widget','Bangalore'),(10002,'Johns','Kolkata'),(10003,'Vimal','Mumbai'),(10004,'Reliance','Delhi');
insert into Parts values(20001,'Book','Red'),(20002,'Pen','Red'),(20003,'Pencil','Green'),(20004,'Mobile','Green'),(20005,'Charger','Black');
insert into Catalog values(10001,20001,10),(10001,20002,10),(10001,20003,30),(10001,20004,10),(10001,20005,10),(10002,20001,10),(10002,20002,20),(10003,20003,30),(10004,20003,40);
select * from Supplier;
select * from Parts;
select * from Catalog;
select distinct p.pname from Parts p,Catalog c where p.pid=c.pid;
select s.sname from Supplier s where not exists((select p.pid from Parts p) MINUS (select c.pid from Catalog c where c.sid=s.sid)); 
select distinct c.sid from Catalog c where c.cost>(select avg(c1.cost) from Catalog c1 where c1.pid=c.pid);
select p.pid,s.sname from Parts p,Supplier s,Catalog c where c.pid=p.pid and c.sid=s.sid and c.cost=(select max(c1.cost) from Catalog c1 where c1.pid=p.pid);
select pname from Parts where pid in (select w.pid from (select pid from Catalog group by pid having count(distinct sid)=1) w, Catalog c1,Supplier s1  where w.pid=c1.pid and c1.sid=s1.sid and s1.sname='Acme widget');
select sname from Supplier where sid in (select sid from Catalog group by sid having count(distinct pid)=(select count(pid) from Parts));
select sname from Supplier where sid in (select sid from Catalog c,Parts p where c.pid=p.pid and p.color='Red' group by sid having count(distinct p.pid)=(select count(*) from Parts where color='Red'));