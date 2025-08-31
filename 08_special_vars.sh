#!/bin/bash

echo "ALL variable pass to the script : $@"
echo "Script name: $0"
echo "current directory: $PWD"
echo "user running this script: $USER"
echo "Home directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of the last command in background: $!"
