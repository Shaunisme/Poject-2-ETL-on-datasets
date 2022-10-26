# Project-2-ETL-on-datasets

**Project 2: Extract, Transform & Load **

**Group Members** – Carl Gonzales, Shang Xu, Prathima Polavarapu

**Instructions to run the ETL:**

1.	Resources folder contains the csv files for the 2 datasets used in the project.
2.	Use Jupyter Notebooks, to run the pandas_etl.ipynb file.
3.	Use Postgres, to run the dbschema.sql file. 

**Project Proposal**

As a group we decided to examine if there was a relationship between civilian unemployment rate and closing market bid yields on actively traded Treasury securities in the over-the-counter market. The project will be a result of our combined work and we will attempt to come to a conclusion on the effects each data set has on one another. 


The purpose of this project is to:

•	Extract – getting data from the original website sources

•	Transform – cleaning and structuring the data in our desired form

•	Load – writing the data into a Postgres database for storage


The datasets we will use for this project were in the form of csv files and retrieved from:

![www.federalreserve.gov](https://i.imgur.com/bYgEKsA.jpeg)

•	US Federal Reserve website (https://www.federalreserve.gov/releases/h15/)

![Data.gov](https://thevine.io/wp-content/uploads/2018/05/data.gov_.png)

•	US Data Catalog website (https://catalog.data.gov/dataset/civilian-unemployment-rate-for-us-and-california)


As we worked through the ETL process, we were able to create a basic time-series graph which shows the possible correlation between civilian unemployment rates and Treasury securities yield rates. The graph spans over 60 years and shows the increases and decreases of rates for the respective datasets. We used the Postgres database as we found a direct correlation between the two datasets .

The major and interesting finding is that over the time period, treasury securities yield rates would increase when civilian unemployment rates decreased. This would also be the case oppositely as when civilian unemployment rates increased, treasury securities yield rates would decrease. The reason for this is that the treasury yield is mainly affected by investor confidence as well as the overall economy. Employment adds to a growing economy, so if more people are losing their jobs, it makes sense that the treasury yield will decrease and vice versa. 

---
## REPORT

#Extract:

- Data source 1: https://www.federalreserve.gov/releases/h15/
- Data source 2: https://catalog.data.gov/dataset/civilian-unemployment-rate-for-us-and-california


Dataset 1:
Description of the Treasury Nominal and Inflation-Indexed Constant Maturity Series
Yields on Treasury nominal securities at “constant maturity” are interpolated by the U.S. Treasury from the daily yield curve for non-inflation-indexed Treasury securities. This curve, which relates the yield on a security to its time to maturity, is based on the closing market bid yields on actively traded Treasury securities in the over-the-counter market. These market yields are calculated from composites of quotations obtained by the Federal Reserve Bank of New York. The constant maturity yield values are read from the yield curve at fixed maturities, currently 1, 3, and 6 months and 1, 2, 3, 5, 7, 10, 20, and 30 years. This method provides a yield for a 10-year maturity, for example, even if no outstanding security has exactly 10 years remaining to maturity. Similarly, yields on inflation-indexed securities at “constant maturity” are interpolated from the daily yield curve for Treasury inflation protected securities in the over-the-counter market. The inflation-indexed constant maturity yields are read from this yield curve at fixed maturities, currently 5, 7, 10, 20, and 30 years.

Dataset 2:
This dataset contains unemployment rates for the U.S.(1948 - Present) and California (1976 - Present). The unemployment rate represents the number of unemployed as a percentage of the labor force. Labor force data are restricted to people 16 years of age and older, who currently reside in 1 of the 50 states or the District of Columbia, who do not reside in institutions (e.g., penal and mental facilities, homes for the aged), and who are not on active duty in the Armed Forces.


#Transform:

cleaning and structuring the data in our desired form

### Put "Resources/FRB_H15.csv" CSV into a Pandas DataFrame frb_df.
##### Copy 5 columns into a new DataFrame treasury_securities_df

- Series Description
- U.S. Treasury securities at 1-year
- U.S. Treasury securities at 3-year
- U.S. Treasury securities at 5-year 
- U.S. Treasury securities at 10-year

#### Rename the columns to match the tables created in the database.

- Rename Series Description to data_date
- Rename U.S. Treasury securities at 1-year to treasury_securities_1y
- Rename U.S. Treasury securities at 3-year to treasury_securities_3y
- Rename U.S. Treasury securities at 5-year to treasury_securities_5y
- Rename U.S. Treasury securities at 10-year to treasury_securities_10y

#### Drop description row.

- Drop row 'Unit:','Multiplier:','Currency:','Unique Identifier: ','Time Period'
- Drop row 

#### Drop no data row.

- Drop row value equal 'ND'

#### Change data type to datetime and float.

- Change data_date to datetime
- Change other columns to float

---

### Put "Resources/Civilian_Unemployment_Rate_for_US_and_California.csv" CSV into a Pandas DataFrame data_gov_df.

##### Copy 3 columns into a new DataFrame unemployment_df

- Date
- Seasonally Adjusted
- Not Seasonally Adjusted

#### Rename the columns to match the tables created in the database.

- Rename Date to data_date
- Rename Seasonally Adjusted into rate_seasonally_adjusted
- Rename Not Seasonally Adjusted to rate_not_seasonally_adjusted

####  Covert unemployment rate to percentage

- rate_seasonally_adjusted * 100
- rate_not_seasonally_adjusted * 100 

#### Change data type to datetime and float.

- Change data_date to datetime
- Change other columns to float

---

### Load: explains the final database, tables

#### Final database in Postgres

- rate_db 

#### Final tables in Postgres database rate_db
- treasury_securities for DataFrame treasury_securities_df
- unemployment_rate for DataFrame unemployment_df



### Why the topic was chosen 

- We chose this topic because it would be very interesting to find out if there is a direct correlation between unemployment rates and treasury yield rates. As we have just experienced a pandemic, we could most likely see a spike in unemployment rates during the 2020 period, and it would be interesting to see how that had an effect on yield rates.
- The major and interesting finding is that over the time period, treasury securities yield rates would increase when civilian unemployment rates decreased. This would also be the case oppositely as when civilian unemployment rates increased, treasury securities yield rates would decrease. 

![](https://i.imgur.com/6pvKA5z.png)

