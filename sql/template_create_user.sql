/*
Script to create a new user in Snowflake

 */

 create user [USER] identified by '[PASSWORD]';

 ALTER USER charlie SET RSA_PUBLIC_KEY='[PUBLIC_KEY]';

describe user [USER];