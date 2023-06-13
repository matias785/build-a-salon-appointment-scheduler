#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n drop table appointments"
echo "$($PSQL "drop table appointments")"

echo -e "\n Conectandose a la DataBase 'salon'"
echo "$($PSQL "\c salon")"

echo -e "\n drop table customers"
echo "$($PSQL "drop table customers")"

echo -e "\n drop table services"
echo "$($PSQL "drop table services")"


### Creacion de Tablas ###

echo -e "\n Creando tabla services'"
echo "$($PSQL "create table services()")"
echo "$($PSQL "ALTER TABLE services ADD COLUMN service_id SERIAL PRIMARY KEY not null")"
echo "$($PSQL "ALTER TABLE services ADD COLUMN name varchar(40) not null")"

echo -e "\n Creando tabla customers'"
echo "$($PSQL "create table customers()")"
echo "$($PSQL "ALTER TABLE customers ADD COLUMN customer_id SERIAL PRIMARY KEY not null")"
echo "$($PSQL "ALTER TABLE customers ADD COLUMN phone varchar(15) unique")"
echo "$($PSQL "ALTER TABLE customers ADD COLUMN name varchar(40) not null")"


echo -e "\n Creando tabla appointments'"
echo "$($PSQL "create table appointments()")"
echo "$($PSQL "ALTER TABLE appointments ADD COLUMN appointment_id SERIAL PRIMARY KEY not null")"
echo "$($PSQL "ALTER TABLE appointments ADD COLUMN customer_id int")"
echo "$($PSQL "ALTER TABLE appointments ADD COLUMN service_id int")"
echo "$($PSQL "ALTER TABLE appointments ADD COLUMN time varchar(40)")"
echo "$($PSQL "ALTER TABLE appointments ADD CONSTRAINT appointments_customers_id_fkey FOREIGN KEY(customer_id) references customers(customer_id);")"
echo "$($PSQL "ALTER TABLE appointments ADD CONSTRAINT appointments_services_id_fkey FOREIGN KEY(service_id) references services(service_id);")"

### Insert's ####
echo "$($PSQL "insert into services (name) values ('cut');")"
echo "$($PSQL "insert into services (name) values ('color');")"
echo "$($PSQL "insert into services (name) values ('perm');")"
echo "$($PSQL "insert into services (name) values ('style');")"
echo "$($PSQL "insert into services (name) values ('trim');")"

echo "$($PSQL "select * from services;")"




