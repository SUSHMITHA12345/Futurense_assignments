create database company;
use company;
create table company.employ(
 EId int primary key,
 Ename varchar(50) not null,
 nmbr bigint 
);
insert into employ values(369,'Sush',9493473888),(373,'Nand',9493473999),(381,'Divs',9493473777);
insert into employ (EId,Ename) values(392,'Freet');
insert into employ (EId,Ename,DOB) values(312,'F','2020-01-20');

alter table employ add column DOB datetime not null;
alter table employ modify column DOB date not null;
set SQL_SAFE_UPDATES=0;
update employ set DOB='2001-02-24' where Ename='Sush';
alter table employ modify column EId int auto_increment;
alter table employ modify column DOB date auto_increment;
alter table employ add column loc varchar(30) default 'Bangalore';
update employ set loc='Hyd' where Ename='Sush';
select * from employ  where dob='2001-02-24';
select loc,count(EId) from employ group by loc;
select loc,count(EId) as sum from employ group by loc ;
select * from employ where EId between 349 and 352;
select * from employ where dob between '2000-12-12' and '2002-03-24';
select loc,count(EId) as sum from employ having sum>3;
select * from employ where EId in  (349 ,350, 351, 370) and  loc ='Bangalore';
select * from employ where EId in(select EId from employ where loc ='Bangalore');
select * from employ where Ename like '%a%' or Ename like '%u%' and  Ename like 'f%';
select * from employ where DOB like '____-02-__';
select * from employ where Ename like 'F_%';
select * from employ where Ename like '__n%';
select * from employ having loc='Bangalore';
select *,count(*) from employ group by loc;
select * from employ;

create table SALARY(
SL_NO int primary key,
EID int not null,
AMT float not null,
SALARY_DATE date 
 ); 
 alter table SALARY modify column SL_NO int auto_increment;
alter table SALARY modify column SALARY_DATE date  default '2022-05-05';
insert into SALARY (SL_NO,EID,AMT) values(1,101,50000),(2,109,60000),(3,111,75000);
select * from SALARY where SALARY_DATE>current_date;
select Ename from employ inner join SALARY on employ.Ename=SALARY.SALARY_DATE where SALARY_DATE>current_date;
select Ename from company.employ where EID in(select EID from company.SALARY  where SALARY_DATE>current_date);



select EId,loc,AMT from(select EID,avg(AMT) over (partition by loc) as avg_sal,loc,AMT from 
(select s.EID,e.Ename,s.AMT,e.loc from Company.SALARY s inner join Company.employ e on s.EID=e.EId)X)Y where avg_sal<= AMT;


select * from employ e1 join SALARY s1 on e1.EId=s1.EID where s1.AMT>(select avg(s.AMT) as AVG_AMT
 from employ e join SALARY s on e.EId=s.EID where e1.loc=e.loc group by e.loc);



