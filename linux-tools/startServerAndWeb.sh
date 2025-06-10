#!/bin/sh
UP=$(pgrep mysql | wc -l)
if [ "$UP" -eq 0 ]; then
    echo "MySQL is down. Attempting start"
    sudo service mysql start
else
    echo "MySQL is running."
fi

UP2=$(pgrep elasticsearch | wc -l)
if [ "$UP2" -eq 0 ]; then
    echo "ElasticSearch is down. Attempting start"
    sudo service elasticsearch start
else
    echo "ElasticSearch is running."
fi

cd ../airline-data
sbt -J-Xms2g -J-Xmx8g "runMain com.patson.MainSimulation" &

sleep 5
cd ../airline-web
sbt run &