#!/ bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then 
echo "ERROR: please run this script with root access"
exit 1 # give anything but zero upto 127

else 
echo "you are running with root access"
fi

#validate function takes input exit status, , what command they tried to install
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



if [ $? -ne 0 ]
then
 VALIDATE $1 "MYSQL"
 dnf install mysql -y

 else 
echo "mysql is already installed.. Nothing to do"
fi 


dnf list installed nginx 



if [ $? -ne 0 ]
then
dnf install nginx -y

 VALIDATE $? "nginx"
else 
echo "nginx is already installed.. Nothing to do"
fi 

dnf list installed python3 



if [ $? -ne 0 ]

then
dnf install python3 -y

 VALIDATE $? "python3"


else 
echo "python3  is already installed.. Nothing to do"
fi 



