build-api:
	docker build -t be-friends-api -f be-friends-api/Dockerfile be-friends-api

build-fe:
	docker build -t be-friends-fe -f be-friends/Dockerfile be-friends

build: build-api build-fe

up: build
	docker compose up