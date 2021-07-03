FROM debian:buster

apt -y update
apt -y upgrade
apt install -y mariadb-server expect vim telnet
apt install -y ufw iptables
ufw allow 3306

COPY tools/start.sh .
COPY tools/db.sql
COPY tools/conf etc/mysql/mariadb.conf.d/50-server.cnf

CMD sh start.sh
