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
	helm upgrade -i be-friends -n be-friends --create-namespace be-friends/helm -f fe-values.yaml --force
	helm upgrade -i be-friends-api -n be-friends --create-namespace be-friends-api/helm -f api-values.yaml --force