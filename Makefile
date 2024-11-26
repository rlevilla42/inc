# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlevilla <marvin@42lausanne.ch>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/20 13:41:06 by rlevilla          #+#    #+#              #
#    Updated: 2024/10/06 20:52:05 by rlevilla         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
all: up
up:
	docker compose -f ./srcs/docker-compose.yml up --build -d
down:
	docker compose -f ./srcs/docker-compose.yml down
stop:
	docker compose -f ./src/docker-compose.yml stop
rm: down
	rm -rf ./srcs/home/rlevilla/data/* && docker system prune -a
re:	rm up
