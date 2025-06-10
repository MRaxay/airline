#!/bin/sh
echo "Making sure system is up to date"
apt update
apt upgrade -y

echo "Installing JDK and ElasticSearch"
apt install openjdk-11-jdk -y
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.0-amd64.deb
yes | dpkg -i elasticsearch-7.14.0-amd64.deb

echo "## JVM configuration

################################################################
## IMPORTANT: JVM heap size
################################################################

# Xms represents the initial size of total heap space
# Xmx represents the maximum size of total heap space

-Xms4g
-Xmx4g
" >> /etc/elasticsearch/jvm.options.d/ram.options

systemctl stop elasticsearch
systemctl daemon-reload
systemctl enable elasticsearch
systemctl start elasticsearch


apt-get update
apt-get install apt-transport-https curl gnupg -yqq
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo -H gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
apt-get update
apt-get install sbt -y

./installAndConfigureMySql.sh