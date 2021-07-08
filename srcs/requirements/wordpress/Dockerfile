FROM   debian:buster

WORKDIR /var/www/

RUN apt -y  update
RUN apt install -y sudo
RUN apt install -y php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
RUN apt -y install curl
RUN apt install nmap vim telnet mariadb-client php-mysql -y
RUN apt -y install php-fpm

COPY tools/setup.sh .

COPY tools/wordpress wp

COPY tools/www.conf  /etc/php/7.3/fpm/pool.d/www.conf

CMD [ "sh", "setup.sh" ]
