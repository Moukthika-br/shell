#!/bin/bash

echo -e "\e[31m hello beautiful people \e[0m" #\e[0m - to end the color in one line

echo "hello no color please"

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: $N please use the root access"
exit 1
else 
echo "hurrah!!!!!! you are running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then 
    echo "Installing $2 is ... $G SUCESSSS $N"
    else
    echo "installing $2 is ..... $R FAILURE $N"
    exit 1
    fi

}

dnf list installed mysql 



if [ $? -ne 0 ]
then
echo "$Y mysql is not installed , let me do it for you $N"
 VALIDATE $1 "MYSQL"
 dnf install mysql -y

 else 
echo "$G mysql is already installed.. Nothing to do $N"
fi 


dnf list installed nginx 



if [ $? -ne 0 ]
then
echo "$Y nginx is not installed , let me do it for you $N"

dnf install nginx -y
 VALIDATE $? "nginx"

else 
echo "$G nginx is already installed.. Nothing to do $N"
fi 

dnf list installed python3 



if [ $? -ne 0 ]

then
echo "$Y python3  is not installed , let me do it for you $N"

dnf install python3 -y

 VALIDATE $? "python3"


else 
echo "$G python3  is already installed.. Nothing to do $N"
fi 



