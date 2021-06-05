FROM   debian:buster
EXPOSE 443
COPY start.sh .
RUN  sh start.sh

COPY default etc/nginx/sites-available/default
COPY  nginx-selfsigned.key  /etc/ssl/private/
COPY  nginx-selfsigned.crt  /etc/ssl/certs/
RUN  chmod 700 /etc/ssl/private
CMD ["nginx", "-g", "daemon off;"]