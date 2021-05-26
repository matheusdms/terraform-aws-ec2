#!/bin/bash
sudo wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yes | sudo yum localinstall mysql57-community-release-el7-11.noarch.rpm
yes | sudo yum install mysql-community-server -y
sudo systemctl start mysqld.service