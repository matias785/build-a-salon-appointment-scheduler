#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICE() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")


  if [[ -z $CUSTOMER_NAME ]] 
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  fi
 
  # read SERVICE_ID_SELECTED
  SERVICE_ID_SELECTED=$($PSQL "select service_id from services where name = '$1'") 
  #read SERVICE_TIME
  echo -e "\nWhat time would you like your $1, $CUSTOMER_NAME?"
  read SERVICE_TIME

  CUSTOMER_ID=$($PSQL "select customer_id from customers WHERE name = 'Matias'") 
  INSERT_APPOIMENT_RESULT=$($PSQL "insert into appointments (customer_id, service_id, time) values ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')") 
  
  echo -e "I have put you down for a $1 at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?"
  echo -e "1) cut \n2) color \n3) perm \n4) style \n5) trim"
  read MAIN_MENU_SELECTION

   case $MAIN_MENU_SELECTION in
    1) SERVICE "cut" ;;
    2) SERVICE "color" ;;
    3) SERVICE "perm" ;;
    4) SERVICE "style" ;;
    5) SERVICE "trim" ;;
    *) MAIN_MENU "I could not find that service. What would you like today?";;
  esac 
}

MAIN_MENU





