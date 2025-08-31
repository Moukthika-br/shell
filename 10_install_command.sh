#!/ bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then 
echo "ERROR: please run this script with root access"
exit 1 # give anything but zero upto 127

else 
echo "you are running with root access"
fi
dnf list installed mysql 

#checked already installed or not. if installed $? is 0, then 
#if not installed $?  is not 0, expression is true


if [ $? -ne 0 ]
then 
echo "MYSQL is not installed ... going to install it"

dnf install mysql -y


if [ $? -eq 0 ]
then 
echo "Installing MYSQL is ......... success"
else
echo "Installing MYSQL is ............. failure"
exit 1
fi

else 
echo "MYSQL is already installed.. Nothing to do"
fi 




dnf list installed nginx 

dnf install nginx -y


if [ $? -eq 0 ]
 VALIDATE $? "python3"
fi

else 
echo "mysql is already installed.. Nothing to do"
fi 

dnf list installed python3 

dnf install python3 -y


if [ $? -eq 0 ]
 VALIDATE $? "python3"
fi

else 
echo "python3 is already installed.. Nothing to do"
fi 



