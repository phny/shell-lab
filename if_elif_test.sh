#!/bin/bash

user_name=sdhdkjshfkjh

if grep $user_name /etc/passwd
then
	echo the user $user_name is exist on the system
elif ls -d /home/$user_name
then
	echo the user $user_name does not exist on the system
	echo However, $user_name has a directory
else
	echo The user $user_name does not exist on the system
	echo And, the user $user_name does not has a derectory
fi
