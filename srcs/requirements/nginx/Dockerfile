FROM alpine:3.14

RUN apk update --no-cache \
	&& apk upgrade --no-cache \
	&& apk add nginx openssl \
	&& rm -rf /var/cache/apk/*

RUN adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& mkdir -p /var/run/nginx

RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	   -out /etc/nginx/ssl/inception.pem -keyout /etc/nginx/ssl/inception.key \
	   -subj "/C=FR/ST=BG/L=BG/O=1337/OU=1337/CN=inception"

RUN rm /etc/nginx/nginx.conf

COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/index.html /index.html

COPY ./config/setup.sh .
RUN chmod +x setup.sh

EXPOSE 443

ENTRYPOINT ["./setup.sh"]
