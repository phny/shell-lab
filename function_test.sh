#!/bin/bash
func1(){
	ls -l badfile
	echo "trying to display a non-existent file"
}

func2(){
	read -p "Enter a value:" value
	echo "doubling the vlaue"
	return $[ $value * 2 ]
}

echo "testing the function"

func2
echo "the new vlaue is : $?" 

func1

echo "The exit status is: $?"

