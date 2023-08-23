/*
If you accidentally drop your original database after setting up partner connect, you might need to grant or regrant permissions to build your dbt models.
This file is here in the project for these circumstances. A great video on this setup can be found at: https://www.youtube.com/watch?v=kbCkwhySV_I.
The code below assumes that the TRANSFORMER role and TRANSFORMING warehouse have already been created in Snowflake as part of the partner connect process.
*/


/*
Giving access to database, schema, and all tables within the schema to our transformer role.
The permissions here are for the raw data that we read in.
*/


-- this is whatever the raw database and schema are
grant usage on database SNOWFLAKE_SAMPLE_DATA to role TRANSFORMER;
grant usage on schema SNOWFLAKE_SAMPLE_DATA.TPCH_SF1 to role TRANSFORMER;
grant select on all tables in schema SNOWFLAKE_SAMPLE_DATA.TPCH_SF1 to role TRANSFORMER;


/*
Giving access to database, schema, and all tables within the schema to our TRANSFORMER role.
The permissions here are for database and schema for the transformed data that we will write to creating new schemas and tables.
*/
--this is for the analytical layer
grant usage on database ANALYTICS to role TRANSFORMER;
grant modify on database ANALYTICS to role TRANSFORMER;
grant monitor on database ANALYTICS to role TRANSFORMER;
grant create schema on database ANALYTICS to role TRANSFORMER;




/*
Give permission for our TRANSFORMER role to use the TRANSFORMING warehouse to run our compute and commands on.
*/
-- this is for the warehouse
grant operate on warehouse TRANSFORMING to role TRANSFORMER;
grant usage on warehouse TRANSFORMING to role TRANSFORMER;

