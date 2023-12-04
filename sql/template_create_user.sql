/*
Script to create a new user in Snowflake

 */

 create user [USER] identified by '[PASSWORD]';


-- [PUBLIC_KEY] is without '-----BEGIN PUBLIC KEY-----' and '-----END PUBLIC KEY-----', no whitespace
ALTER USER [USER] SET RSA_PUBLIC_KEY='[PUBLIC_KEY]';

describe user [USER];
