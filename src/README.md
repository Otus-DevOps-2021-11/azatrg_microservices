# Microservices

## Docker-compose

У каждого описания инфраструктуры docker в docker-compose есть имя проекта. Если его не задать, то в качестве имени будет использовано название папки из которой он запущен. Задать свое имя можно с помощью флага -p при запуске, например:
```
docker-compose -p reddit_app up -d
```
Или с помощью переменной окружения $COMPOSE_PROJECT_NAME:
```
COMPOSE_PROJECT_NAME=example_name
```
