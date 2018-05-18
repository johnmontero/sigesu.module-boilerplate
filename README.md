# Sigesu

Sistema de Gestión de Supermercados

## Requerimientos

- Docker
- Docker Compose
- Cmake

### Commands para desarrollo

```shell
Development commands for project app

Usage: make COMMAND [target=some-targets] [revision=some-revision]

Targets:

  web     Web Application
  db      MSSQL Database for Linux

  default target=all

Commands:

  build            Build the docker containers, use me with: make build target=web
  commit           Commit the docker containers, use me with: make commit target=web revision=1.0
  delete           Delete the docker containers, use me with: make delete target=web
  down             Stops and removes the docker containers, use me with: make down target=web
  exec             Execute command in the docker container, use me with: make exec target=web cmd=ls
  logs             Logss the docker containers, use me with: make logs target=web
  push.all         Push all the docker containers, use me with: make push.all version=1.0
  push             Push the docker containers, use me with: make push revision=1.0
  rebuild          Rebuild the docker containers, use me with: make rebuild
  restart          Restart the docker containers, use me with: make restart target=web
  ssh              SSH connect to container, se me with: make ssh target=web
  status           Show containers status, use me with: make status target=web
  stop             Stops the docker containers, use me with: make stop target=web
  tag.all          Tag the docker containers, use me with: make tag.all version=1.0
  up               Up the docker containers, use me with: make up target=web
```

### Web Application

- http://localhost:8000/


### MSSQL Database for Linux

- localhost:1433

### Dashboard
<img style="width:70%;" src="/doc/images/screenshot-1.png">

### Catologo de Productos
<img style="width:70%;" src="/doc/images/screenshot-2.png">