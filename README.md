# dbt-demo
A simple dbt project

## Steps to Run
### Snowflake Account Pre Steps
   1. Sign up for a trial Snowflake account at: https://signup.snowflake.com/ 
      1. Or use an existing account where you have administrator access
   2. Edit PRE_STEPS.sql file:
      1. Set your email on line 7
   3. Copy, paste, and run PRE_STEPS.sql in your Snowflake account
   4. Sign out of your Snowflake account
   5. Sign in with the dbt user credentials:
      1. Username: dbtdev
      2. Password: dbt123
      3. After signing in, you will be asked to change the password  
  
  
### dbt Pre Steps
   1. (Recommend using a python virtualenv) Install requirements from requirements.txt with pip 
   2. Copy profiles-sample.yml into profiles.yml
   3. Edit profiles.yml file:
      1. Set the Snowflake account reference
      2. Set the new password for the dbtdev user
   4. Execute: `. ./debug` from this directory to check your connection
      1. If you see the message: `All checks passed!`, then your setup was successful!

### Run the dbt project
1. Execute: `. ./run` from this directory to run the dbt project
   
     
 
# What does this project do?
This simple dbt project has only one dbt model. This model selects the "best shapes" from the sample data created in PRE_STEPS.sql.  

The purpose of this project is to provide a starting place for people who want to use dbt with Snowflake. There is much more that dbt can do: chaining models together with refs, using macros, creating tests for data, snapshotting...the list goes on. But at the core of dbt are models - and the aim of this project is to provide a hands-on demo of running your first dbt-snowflake model.
