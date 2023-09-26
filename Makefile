all:
	@-if ! grep -q "dasereno.42.fr" /etc/hosts; \
		then echo "127.0.0.1 dasereno.42.fr" | sudo tee -a /etc/hosts; \
		fi
	@-mkdir -p /home/dasereno/data/wordpress && mkdir -p /home/dasereno/data/mariadb
	@-docker compose -f srcs/docker-compose.yml build
	@-docker compose -f srcs/docker-compose.yml up --detach

stop:
	@-docker compose -f srcs/docker-compose.yml stop

clean:
	@-docker system prune --all --force --volumes

fclean:
	@-docker stop $$(docker ps -qa)
	@-docker rm -f $$(docker ps -qa)
	@-docker rmi -f $$(docker images -qa)
	@-docker volume rm $$(docker volume ls -q)
	@-rm -rf /home/dasereno/data
	@-docker network rm $$(docker network ls -q)
	@-sed -i '/dasereno\.42\.fr/d' /etc/hosts
	# @-docker builder prune -f

re:
	@$(MAKE) clean
	@$(MAKE) all

.PHONY: all setup build up stop clean fclean re
