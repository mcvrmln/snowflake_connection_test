import snowflake.connector
import os
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives.asymmetric import dsa
from cryptography.hazmat.primitives import serialization

with open("./keys/passwd.txt", "r") as secret_file:
    passwd = secret_file.readline()

passwd = passwd.strip().encode()


with open("./keys/rsa_key.p8", "rb") as key:
    p_key= serialization.load_pem_private_key(
        key.read(),
        password=passwd,
        backend=default_backend()
    )

pkb = p_key.private_bytes(
    encoding=serialization.Encoding.DER,
    format=serialization.PrivateFormat.PKCS8,
    encryption_algorithm=serialization.NoEncryption())

ctx = snowflake.connector.connect(
    user='charlie',
    account='LAXXPUR-VO12319',
    private_key=pkb,
    warehouse='COMPUTE_WH',
    database='UTRECHT',
    schema='FIETS'
    )

cs = ctx.cursor()
result = cs.execute('show databases;').fetchall()
print(result)
