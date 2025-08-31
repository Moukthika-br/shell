#!/ bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then 
echo "ERROR: please run this script with root access"
exit 1 # give anything but zero upto 127

else 
echo "you are running with root access"
fi

VALIDATE(){
	if [ $1 -eq 0 ]
then 
echo "Installing $2 is ......... success"
else
echo "Installing $2 is ............. failure"
exit 1
fi
}



dnf list installed mysql 

dnf install mysql -y


if [ $? -eq 0 ]
then
 VALIDATE $1 "MYSQL"
 else 
echo "mysql is already installed.. Nothing to do"
fi 


dnf list installed nginx 

dnf install nginx -y


if [ $? -eq 0 ]
then
 VALIDATE $? "nginx"
else 
echo "nginx is already installed.. Nothing to do"
fi 

dnf list installed python3 

dnf install python3 -y


if [ $? -eq 0 ]
then
 VALIDATE $? "python3"


else 
echo "python3  is already installed.. Nothing to do"
fi 



