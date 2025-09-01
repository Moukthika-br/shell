#!/bin/bash


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" &>>$LOGS_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: $N please use the root access"  &>>$LOGS_FILE
exit 1
else 
echo "hurrah!!!!!! you are running with root access"  &>>$LOGS_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then 
    echo -e "Installing $2 is ... $G SUCESSSS $N"
    else
    echo -e "installing $2 is ..... $R FAILURE $N"
    exit 1
    fi

}

dnf list installed mysql  &>>$LOG_FILE



if [ $? -ne 0 ]
then
echo -e  "$Y mysql is not installed , let me do it for you $N" &>>$LOG_FILE
 VALIDATE $? "MYSQL"
 dnf install mysql -y

 else 
echo -e  "$G mysql is already installed.. Nothing to do $N" &>>$LOG_FILE
fi 


dnf list installed nginx  &>>$LOG_FILE



if [ $? -ne 0 ]
then
echo -e "$Y nginx is not installed , let me do it for you $N"

dnf install nginx -y &>>$LOG_FILE
 VALIDATE $? "nginx"

else 
echo -e "$G nginx is already installed.. Nothing to do $N" &>>LOG_FILE
fi 

dnf list installed python3  &>>LOG_FILE



if [ $? -ne 0 ]

then
echo -e"$Y python3  is not installed , let me do it for you $N" &>>LOG_FILE

dnf install python3 -y

 VALIDATE $? "python3"


else 
echo -e "$G python3  is already installed.. Nothing to do $N"
fi 



