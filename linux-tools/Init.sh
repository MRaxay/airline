#!/bin/sh
cd ../airline-data

echo "Running sync"
sbt publishLocal
sbt "runMain com.patson.init.MainInit"

read -p "Do you want to start myfly club? (yes/no) " yn

case $yn in 
	yes ) echo ok, we will proceed;;
	no ) echo exiting...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

cd ../linux-tools

./startServerAndWeb.sh