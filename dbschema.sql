-- Create tables for raw data to be loaded into
drop table IF EXISTS treasury_securities;
CREATE TABLE treasury_securities (
data_date date PRIMARY KEY,
treasury_securities_1y FLOAT ,
treasury_securities_3y FLOAT ,
treasury_securities_5y FLOAT ,
treasury_securities_10y FLOAT
);

drop table IF EXISTS  unemployment_rate;
CREATE TABLE unemployee_rate (
data_date date PRIMARY KEY,
rate_seasonally_adjusted float,
rate_not_seasonally_adjusted float
);

SELECT 
	ts.data_date, 
	ts.treasury_securities_1y, 
	ts.treasury_securities_3y, 
	ts.treasury_securities_5y, 
	ts.treasury_securities_10y, 
	ur.rate_seasonally_adjusted, 
	ur.rate_not_seasonally_adjusted
FROM
	treasury_securities ts
INNER JOIN
	unemployment_rate ur
ON
	ts.data_date = ur.data_date;


