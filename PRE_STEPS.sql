-- Run these commands in your Snowflake account before running the project
-- Your priveleges and your account's role structure may require you to change the names of resources in this file

-- create the user dbt will use; pw will need to be changed by logging in directly
use role securityadmin;
create user if not exists dbtdev
    EMAIL = 'CHANGE ME' --!! CHANGE THIS BEFORE RUNNING !!--
    PASSWORD = 'dbt123'
    MUST_CHANGE_PASSWORD = TRUE;

-- default role and wh
use role sysadmin;
use warehouse compute_wh;

-- create database for testing dbt, schema for raw data
create database if not exists DBT_TESTING;
use database dbt_testing;
create schema if not exists RAW_DATA;
use schema raw_data;

-- put some data into RAW_DATA; creating a polygons tables
create or replace table RAW_DATA.SHAPES
    (SHAPE_NAME VARCHAR, NUM_SIDES INT)
as
    select * from (values 
        ('CIRCLE', null),
        ('TRIANGLE', 3),
        ('RECTANGLE', 4),
        ('PENTAGON', 5));
    
-- create warehouse for the dbt role
create warehouse if not exists dbt_wh
    WAREHOUSE_SIZE = XSMALL
    AUTO_SUSPEND = 120;

-- create schema for dbtdev user to use for development
use database DBT_TESTING;
create schema if not exists DBT_dbtdev;

-- create dbt role, assign dbt user to the dbt role
use role securityadmin;
create role if not exists dbt;
grant role dbt to user dbtdev;

-- grant priveleges to the dbt role
grant usage on warehouse dbt_wh to role dbt;
grant usage on database DBT_TESTING to dbt;
grant create schema on database DBT_TESTING to dbt;
grant usage on all schemas in database DBT_TESTING to role dbt;
grant usage on future schemas in database DBT_TESTING to role dbt;
grant create table on all schemas in database DBT_TESTING to role dbt;
grant create table on future schemas in database DBT_TESTING to role dbt;
grant create view on all schemas in database DBT_TESTING to role dbt;
grant create view on future schemas in database DBT_TESTING to role dbt;
grant select on all tables in database DBT_TESTING to role dbt;
grant select on future tables in database DBT_TESTING to role dbt;
grant select on all views in database DBT_TESTING to role dbt;
grant select on future views in database DBT_TESTING to role dbt;