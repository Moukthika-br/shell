
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

}



dnf list installed mysql 

dnf install mysql -y


if [ $? -eq 0 ]
 VALIDATE $1 "MYSQL"
fi

else 
echo "$2 is already installed.. Nothing to do"
fi 

