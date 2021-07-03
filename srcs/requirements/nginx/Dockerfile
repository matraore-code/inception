FROM   debian:buster

RUN apt update  -y 
RUN apt upgrade -y 
RUN apt install nginx vim curl -y
RUN apt install openssl
RUN mkdir /etc/nginx/ssl
RUN openssl genrsa -des3 -out server.key 1024
RUN openssl req -new -key server.key -out server.csr
RUN cp server.key server.key.org
RUN openssl rsa -in server.key.org -out server.key
RUN openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
RUN mv server.crt /etc/nginx/ssl/
RUN mv server.key /etc/nginx/ssl/

COPY  tools/config etc/nginx/sites-available/default

RUN echo "127.0.0.1 matraore.42.fr" > /etc/hosts

CMD ["nginx", "-g", "daemon off;"]
