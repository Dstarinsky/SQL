DROP TABLE IF EXISTS employee;
CREATE TABLE "employee" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"phone"	INTEGER NOT NULL,
	"department"	TEXT NOT NULL,
	"name"	TEXT NOT NULL,
	"title"	TEXT NOT NULL 
	
);
DROP TABLE IF EXISTS cars;
CREATE TABLE "cars" (
	"renter_name"	TEXT ,
	"licence_number"	INTEGER NOT NULL UNIQUE,
	"manifacturer"	TEXT NOT NULL,
	"seats"	INTEGER NOT NULL,
	"color"	TEXT NOT NULL,
	"year"	INTEGER NOT NULL,
	"garage" TEXT ,
	"model"	TEXT NOT NULL,
	PRIMARY KEY("licence_number"),
	FOREIGN KEY("renter_name") REFERENCES "employee"("id") on delete set null,
	FOREIGN KEY("garage") REFERENCES "garage"("name") on delete set null
);
DROP TABLE IF EXISTS managers;
CREATE TABLE "managers" (
	"name"	INTEGER NOT NULL,
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"phone"	INTEGER NOT NULL
);
DROP TABLE IF EXISTS garage;
CREATE TABLE "garage" (
	"name"	TEXT NOT NULL,
	"phone"	INTEGER,
	"manager_name"	TEXT NOT NULL,
	PRIMARY KEY("name"),
	FOREIGN KEY("manager_name") REFERENCES "managers"("name") on update cascade
);
INSERT INTO employee ( name , phone , department , title ) 
VALUES ('ron' , '0546704534' , 'cleaning' , 'boss' );
INSERT INTO employee ( name , phone , department , title ) 
VALUES ('Ami' , '0506235494' , 'financial' , 'accountist' );
INSERT INTO cars ( renter_name, licence_number , manifacturer , seats , color , year , model ) 
VALUES ( '1' , '85647364' , 'ford' , '5' , 'yellow', '2020' , 'explorer' );
INSERT INTO cars ( renter_name, licence_number , manifacturer , seats , color , year , model ) 
VALUES ( '2' , '7765436' , 'ford' , '5' , 'red', '2020' , 'fiesta' );
INSERT INTO cars ( renter_name, licence_number , manifacturer , seats , color , year , model ) 
VALUES ( '3' , '687589123' , 'subaro' , '5' , 'blue', '2020' , 'DL' );
INSERT INTO managers ( name, phone  ) 
VALUES ( 'Jonny' , '054-3459876' );
INSERT INTO managers ( name, phone  ) 
VALUES ( 'Liron' , '054-3452876' );
INSERT INTO garage ( name, phone, manager_name  ) 
VALUES ( 'hashalom' , '03-9876456', '2');
INSERT INTO garage ( name, phone , manager_name) 
VALUES ( 'Drachim' , '03-9886496' , 2);


select * from employee;
select * from cars;
select * from managers;
select * from garage;

select color from cars where renter_name = (select id from employee where name ='Ami');
select employee.name , cars.color from cars  inner join employee on  cars.renter_name = employee.id;
