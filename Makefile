build-api:
	docker build -t be-friends-api -f be-friends-api/Dockerfile be-friends-api

build-fe:
	docker build -t be-friends-fe -f be-friends/Dockerfile be-friends

build: build-api build-fe

up-db:
	docker compose up db

up: build
	docker compose up -d

clean:
	docker compose down
	docker volume rm be-friends-deployment_db || true

deploy-k8s:
	rm -f helm/charts/*
	helm dependency update helm
	helm upgrade -i be-friends helm -n be-friends --create-namespace