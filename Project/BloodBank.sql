drop table BB_Manager;
drop table City;
drop table Recipient;
drop table BloodSpecimen;
drop table Donor;
drop table Staff;
drop table DiseaseFinder;
drop table Hospital_Info;



 CREATE TABLE BB_Manager
 ( mid int NOT NULL PRIMARY KEY,
   mName varchar(30) NOT NULL,
   mPhNo bigint
 ); 
 
  CREATE TABLE City
 ( 	cid int NOT NULL PRIMARY KEY,
  	cName varchar(30) NOT NULL
 );
 
 CREATE TABLE Recipient
 ( 	rid int NOT NULL PRIMARY KEY,
	rName varchar(30) NOT NULL,
 	rage varchar(5),
 	rBgrp varchar(10),
 	rBqnty float,
  	rPhNo bigint,
  	sid int NOT NULL,
  	cid int NOT NULL, 
 	mid int NOT NULL,
  	rsex varchar(10),
  	rdate date,
  	FOREIGN KEY (sid) REFERENCES Staff(sid),
  	FOREIGN KEY (cid) REFERENCES City(cid),
  	FOREIGN KEY (mid) REFERENCES BB_Manager(mid)
 );
 
 CREATE TABLE Donor
 ( 	did int NOT NULL PRIMARY KEY,
	dName varchar(30) NOT NULL,
 	dage varchar(5),
	dsex varchar(10),
 	dBgroup varchar(10),
 	ddate date,
  	rid int NOT NULL,
  	cid int NOT NULL,
  	FOREIGN KEY (rid) REFERENCES Recipient(rid),
 	FOREIGN KEY (cid) REFERENCES City(cid)
  );
  
  
 CREATE TABLE BloodSpecimen
 ( 	sNo int NOT NULL PRIMARY KEY,
  	bGrp varchar(10) NOT NULL,
	status int,
 	dfid int NOT NULL,
 	mid int NOT NULL,
  	FOREIGN KEY (dfid) REFERENCES DiseaseFinder(dfid),
  	FOREIGN KEY (mid) REFERENCES BB_Manager(mid)
 );
 
 
  CREATE TABLE DiseaseFinder
 ( 	dfid int NOT NULL PRIMARY KEY,
	dfName varchar(30) NOT NULL,
 	dfPhNo bigint
 );
 
 
  CREATE TABLE Staff
 ( 	sid int NOT NULL PRIMARY KEY,
	sName varchar(30) NOT NULL,
 	sPhNo bigint
 );
 
 
 CREATE TABLE Hospital_Info1
 ( 	hid int NOT NULL PRIMARY KEY,
	hName varchar(30) NOT NULL,
  	cid int NOT NULL, 
  	mid int NOT NULL,
  	FOREIGN KEY (cid) REFERENCES City(cid),
  	FOREIGN KEY (mid) REFERENCES BB_Manager(mid)
 );
 
 CREATE TABLE Hospital_Info2
( 	hid int NOT NULL,
	hName varchar(30) NOT NULL,
 	hBgrp varchar(10),
 	hBqnty int,
 	primary key(hid,hBgrp)
);
 
 
 
 