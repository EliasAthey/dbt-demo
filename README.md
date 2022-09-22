# dbt-demo
An example for using dbt

## Steps to Run
1. PRE STEPS
   1. Edit PRE_STEPS.sql file:
      1. Set your email on line 7
   2. Copy, paste, and run PRE_STEPS.sql in your Snowflake account
   3. Sign out of your Snowflake account
   4. Sign in with the dbt user credentials:
      1. Username: dbtdev
      2. Password: dbt123
      3. After signing in, you will be asked to change the password
2. Copy profiles-sample.yml into profiles.yml
3. Edit profiles.yml file:
   1. Set the Snowflake account reference
   2. Set the new password for the dbtdev user
4. Execute: `. ./debug` from this directory to check your connection
5. If you see the message: `All checks passed!`, then your setup was successful!
