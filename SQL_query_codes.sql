/*
--------------------------------------------------------------------
Project Name: Seattle Buildings and Energy
Purpose: To develop a MS SQL database for the project analysis
Procedure: 
1) create a Database to store data
2) create SCHEMAs 
3) create TABLEs (identify data types of columns, Primary keys etc.)

--------------------------------------------------------------------
*/

-- create schema: the database includes 2 schemas, building and energy
CREATE SCHEMA building;
go

-- create tables and insert data to the tables
CREATE TABLE building.GFA (
		
	GFA_id SMALLINT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	NumberofBuildings tinyint NULL,
	NumberofFloors tinyint NULL,
	PropertyGFATotal int NULL,
	GFABuildingRate float NULL,
GFAParkingRate float NULL,
GFAPerBuilding float NULL,
GFAPerFloor float NULL	
);

BULK INSERT building.GFA
FROM 'C:\Users\dlaminus\Desktop\Data Analysis\Seattle Buildings and Energy\building_GFA.csv'
WITH 
(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);

CREATE TABLE building.Category (
		
	Category_id SMALLINT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	PrimaryPropertyType nvarchar(max) NOT NULL,
	LargestPropertyUseType nvarchar(max) NOT NULL,
	TotalUseTypeNumber tinyint NOT NULL,
	BuildingType nvarchar(max) NOT NULL,
	Location_id smallint NOT NULL	
);

BULK INSERT building.Category
FROM 'C:\Users\dlaminus\Desktop\Data Analysis\Seattle Buildings and Energy\building_Categories.csv'
WITH 
(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);

CREATE TABLE building.Location (
		
	Location_id SMALLINT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Neighborhood nvarchar(max) NOT NULL,
	Latitude float NOT NULL,
Longitude float NOT NULL,
Haversine_distance float NOT NULL
);

BULK INSERT building.Location
FROM 'C:\Users\dlaminus\Desktop\Data Analysis\Seattle Buildings and Energy\building_Locations.csv'
WITH 
(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);

CREATE TABLE building.Name (
		
	Name_id SMALLINT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	BuildingAge SMALLINT NOT NULL,
	ZipCodes SMALLINT NOT NULL,
	BuildingType nvarchar(50) NULL,
	DataYear SMALLINT NOT NULL,
	GFA_id SMALLINT NOT NULL,
	Category_id SMALLINT NOT NULL,
	PropertyName nvarchar(100) NOT NULL
);
--remark: Place ‘PropertyName’ to the last due to its content with Comma(,)

BULK INSERT building.Name
FROM 'C:\Users\dlaminus\Desktop\Data Analysis\Seattle Buildings and Energy\building_names.csv'
WITH 
(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);

-- create another schema: energy; then create table and insert data
CREATE SCHEMA energy;
go

CREATE TABLE energy.figure (
		
	Name_id SMALLINT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	SiteEnergyUse_kBtu INT NOT NULL,
	Steam_kBtu INT NOT NULL,
       Electricity_kBtu INT NOT NULL,
	NaturalGas_kBtu INT NOT NULL,
	TotalGHGEmissions FLOAT NULL,
	Energy_per_GFA FLOAT NULL
);

BULK INSERT energy.figure
FROM 'C:\Users\dlaminus\Desktop\Data Analysis\Seattle Buildings and Energy\energy_figures.csv'
WITH 
(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);


