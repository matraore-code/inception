FROM alpine:3.14

RUN apk update  \
	&& apk upgrade  
RUN apk add vim php7-fpm php7-opcache php7-common php7-iconv php7-json php7-gd \
    php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-session php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-curl \
    php7-xml php7-mbstring php7-cli php7-phar mariadb-client

RUN addgroup -g 82 -S www-data;\
	adduser -u 82 -D -S -G www-data www-data

RUN wget -O /tmp/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /tmp/wp-cli.phar \
	&& mv /tmp/wp-cli.phar /usr/local/bin/wp-cli

COPY ./config/phpconf /

RUN rm /etc/php7/php-fpm.d/www.conf

COPY ./config/www.conf  /etc/php7/php-fpm.d/www.conf

COPY ./config/setup.sh .
RUN chmod +x setup.sh

ENTRYPOINT ["./setup.sh"]
