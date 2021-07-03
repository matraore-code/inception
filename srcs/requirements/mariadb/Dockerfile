FROM debian:buster

RUN apt -y update
RUN apt -y upgrade
RUN apt install -y mariadb-server expect vim telnet
RUN apt install -y ufw iptables 
RUN ufw allow 3306

COPY tools/start.sh .
COPY tools/conf etc/mysql/mariadb.conf.d/50-server.cnf

CMD sh start.sh
