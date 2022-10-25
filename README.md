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

•	US Federal Reserve website (https://www.federalreserve.gov/releases/h15/)
•	US Data Catalog website (https://catalog.data.gov/dataset/civilian-unemployment-rate-for-us-and-california)

As we worked through the ETL process, we were able to create a basic time-series graph which shows the possible correlation between civilian unemployment rates and Treasury securities yield rates. The graph spans over 60 years and shows the increases and decreases of rates for the respective datasets. We used the Postgres database as we found a direct correlation between the two datasets .

The major and interesting finding is that over the time period, treasury securities yield rates would increase when civilian unemployment rates decreased. This would also be the case oppositely as when civilian unemployment rates increased, treasury securities yield rates would decrease. The reason for this is that the treasury yield is mainly affected by investor confidence as well as the overall economy. Employment adds to a growing economy, so if more people are losing their jobs, it makes sense that the treasury yield will decrease and vice versa. 

