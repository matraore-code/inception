SRCS = ./srcs/docker-compose.yml

all :
	sudo docker-compose -f ${SRC} build

up :
	sudo docker-compose -f ${SRC} up -d --remove-orphans

start :
	docker-compose -f ${SRCS} start

down :
	docker-compose -f ${SRCS} down

volumes :
	docker volume ls

ps :
	docker-compose -f ${SRCS} ps


# RUN NGNIX
run_ng :
	docker container exec -it nginx bash

# RUN WORDPRESS
run_wp : 
	docker container exec -it wordpress bash

# RUN DATABASE

run_db : 
	docker container exec -it mariadb bash



