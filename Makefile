.DEFAULT_GOAL := help

TAG = latest
IMAGE_NAME = sigesu
PROYECT_NAME = sigesu
CONTAINER_NAME = sigesu
CONTAINER_OWNER = sigesu

######## Manage containers status (default target = all)
status: ## Muestra estado de los contenedores: make status target=api
	docker-compose ps ${target}

start: ## Inicia los contenedores de docker: make up target=api
	docker-compose up -d ${target}

restart: ## Reinicia los contenedores de docker: make restart target=api
	docker-compose restart ${target}

stop: ## Detener los contenedores de docker: make stop target=api
	docker-compose stop ${target}

down: ## Detener y eliminar los contenedores de docker: make down target=api
	docker-compose down ${target}

delete: ## Eliminar contenedor de docker: make delete target=api
	docker-compose rm -fv ${target}

build: ## Construir los contenedores de docker: make build target=api
	docker-compose build ${target}

rebuild: ## Reconstruir los contenedores de docker: make rebuild
	make stop
	make delete
	make build
	make start

logs: ## Visualizar registro logs de los contenedores de docker: make logs target=api
	docker-compose logs -f ${target}

ssh: ## Realizar conexión al contenedor usando protocolo ssh: make ssh target=api
		# docker-compose -p $(PROYECT_NAME) run --rm ${target} sh -c "bash"
		docker-compose run  web /bin/bash

######## Manage containers execution
exec: ## Ejecutar comando en el contenerdor de docker: make exec target=api cmd=ls
	docker exec ${target} ${cmd}

######## Build image from container
commit: ## Realizar commit de los contenedores de docker: make commit target=api revision=1.0
	docker commit ${options} ${target} ${revision}

push: ## Push the docker containers, use me with: make push revision=1.0
	docker push ${revision}


######## Tag images
tag.all: ## Tag the docker containers, use me with: make tag.all version=1.0
	docker tag ${CONTAINER_NAME}_api ${CONTAINER_OWNER}/${CONTAINER_NAME}_web:${version}
	docker tag ${CONTAINER_NAME}_postgres_db ${CONTAINER_OWNER}/${CONTAINER_NAME}_db:${version}

######## Push images
push.all: ## Push all the docker containers, use me with: make push.all version=1.0
	docker push ${CONTAINER_OWNER}/${CONTAINER_NAME}_web:${version}
	docker push ${CONTAINER_OWNER}/${CONTAINER_NAME}_db:${version}

######## Pull images
pull.all: # Pull all the docker containers, use me with: make pull.all version=1.0
	docker pull ${CONTAINER_OWNER}/${CONTAINER_NAME}_web:${version}
	docker pull ${CONTAINER_OWNER}/${CONTAINER_NAME}_db:${version}

migrate: ## Migrate database
	docker-compose -p $(PROYECT_NAME) run --rm web sh -c "dotnet ef migrations add"

###### Help
help:
	@echo  'Development commands for project ${PROYECT_NAME}'
	@echo
	@echo 'Usar: make COMMAND [target=some-targets] [cms=some-commads] [revision=some-revision]'
	@echo
	@echo 'Targets:'
	@echo
	@echo '  web     Web application'
	@echo '  db      MSSQL database for linux'
	@echo
	@echo '  default target=all'
	@echo
	@echo 'Comandos:'
	@echo
	@grep -E '^[a-zA-Z_-]+.+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}'
	@echo

