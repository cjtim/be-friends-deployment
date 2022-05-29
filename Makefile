build:
	docker build -t be-friends-fe -f be-friends/Dockerfile be-friends
	docker build -t be-friends-api -f be-friends-api/Dockerfile be-friends-api

up: build
	docker compose up