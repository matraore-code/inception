FROM   debian:buster

RUN apt update  -y 
RUN apt upgrade -y 
RUN apt install nginx vim curl -y
COPY tools/server.crt /etc/nginx/ssl/
COPY tools/server.key /etc/nginx/ssl/

COPY  tools/config etc/nginx/sites-available/default

RUN echo "127.0.0.1 matraore.42.fr" > /etc/hosts

CMD ["nginx", "-g", "daemon off;"]
