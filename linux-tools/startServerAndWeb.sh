#!/bin/sh
UP=$(pgrep mysql | wc -l)
if [ "$UP" -eq 0 ]; then
    echo "MySQL is down. Attempting start"
    sudo service mysql start
else
    echo "MySQL is running."
fi

ps aux | grep elasticsearch | pidof java > /dev/null
verifier=$?
zero=0
if [ $zero = $verifier ]
then
    echo "ElasticSearch is running"
else
    echo "ElasticSearch is stopped attempting start."
    sudo service elasticsearch start
fi

cd ../airline-data
sbt -J-Xms2g -J-Xmx8g "runMain com.patson.MainSimulation" &

sleep 5
cd ../airline-web
sbt run &