-- create database
create database realestate;
use realestate;

-- creating a tables
create table properties(PropertyID int primary key auto_increment,Address varchar(100),City varchar(50),State varchar(50),ZipCode varchar(50),Type varchar(50),
				        Size int,Price decimal,Status varchar(50),AgentID int);
insert into properties values(1, '12 MG Road', 'Bengaluru', 'KA', '560001', 'Apartment', 1200, 5500000, 'Available', 1),
(2, '45 T Nagar Main Rd', 'Chennai', 'TN', '600017', 'House', 1800, 7500000, 'Sold', 2),
(3, '23 Kakkanad Lane', 'Kochi', 'KL', '682030', 'Villa', 2500, 9500000, 'Available', 3),
(4, '56 Banjara Hills', 'Hyderabad', 'TG', '500034', 'Apartment', 1600, 6800000, 'Sold', 4),
(5, '78 Vizag Beach Rd', 'Visakhapatnam', 'AP', '530001', 'House', 2000, 8200000, 'Available', 5);
                         
truncate table properties;                             
select *  from properties;
create table Agents(AgentID int primary key auto_increment,FirstName varchar(50),LastName varchar(50),Email varchar(70),Phone varchar(20),CommissionRate decimal(3,2));
insert into agents values (1, 'Arun', 'Kumar', 'arun.kumar@mail.com', '9001002001', 0.05),
(2, 'Divya', 'Ramesh', 'divya.ramesh@mail.com', '9002003002', 0.04),
(3, 'Suresh', 'Nair', 'suresh.nair@mail.com', '9003004003', 0.06),
(4, 'Meena', 'Ravi', 'meena.ravi@mail.com', '9004005004', 0.05),
(5, 'Vignesh', 'Shetty', 'vignesh.shetty@mail.com', '9005006005', 0.03);

select *  from clients;
truncate table agents;
drop table agents;

create table Clients(ClientID int primary key auto_increment,FirstName varchar(50),LastName varchar(50),Email varchar(50),Phone varchar(50));
insert into clients values(1, 'Karthik', 'Raja', 'karthik.raja@mail.com', '9884012345'),
(2, 'Anjali', 'Menon', 'anjali.menon@mail.com', '9876012345'),
(3, 'Praveen', 'Naidu', 'praveen.naidu@mail.com', '9865012345'),
(4, 'Revathi', 'Pillai', 'revathi.pillai@mail.com', '9854012345'),
(5, 'Manoj', 'Gowda', 'manoj.gowda@mail.com', '9843012345');


show tables;

create table Transactions(TransactionID int primary key auto_increment,PropertyID int,ClientID int,AgentID int,SalePrice decimal(3,2),SaleDate date,
				         Commission decimal(3,2),foreign key(PropertyID)references properties(PropertyID),foreign key(ClientID) references Clients(ClientID), 
                         foreign key(AgentID)  references Agents(AgentID));
insert into Transactions values (1, 2, 1, 2, 7600000, '2025-02-10', 304000),
(2, 4, 2, 4, 6900000, '2025-03-05', 345000),
(3, 2, 3, 2, 7550000, '2025-04-15', 302000),
(4, 4, 4, 4, 7000000, '2025-05-20', 350000),
(5, 2, 5, 2, 7700000, '2025-06-10', 308000);

alter table Transactions modify saleprice decimal;
alter table Transactions modify commission decimal;

select * from  Transactions;

--   using joins
 
select p.PropertyID, p.address,p.city, a.firstname AgentName,c.firstname as ClientName,t.saleprice,t.saledate from transactions t
join properties p on p.propertyid = t.propertyid
join agents a on a.agentid = t.agentid
join clients c on c.clientid = t.clientid;  

-- creating view
create view SoldPropertyStatus
as
select p.address,p.city, a.firstname agentsName,t.saleprice,t.commission from properties p
join transactions t on p.propertyid = t.propertyid
join agents a on t.agentid = a.agentid 
where p.status ="sold";

select * from soldpropertystatus;
drop view soldpropertystatus;

-- subquery
select propertyid,saleprice from transactions 
where saleprice >(select avg(saleprice) from transactions);


-- creating trigger
delimiter &&
create trigger beforeinsertTransactions
before insert on transactions
for each row
begin
declare rate decimal(5,2);
select CommissionRate into rate from agents
where agentid =new.agentid;

set new.commission = new.saleprice * rate;
end&&
delimiter ;
delimiter &&
 -- creating store procedure
create procedure countsoldproperties(in agent_id int)
begin
   select count(*) as totalsold
   from transactions 
   where agentid = agent_id;
   
   end&&
   delimiter ;
    call countsoldproperties(2);