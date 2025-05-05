.PHONY: docker-up docker-down

# Target to build and start the services in detached mode
docker-up:
	docker-compose up -d --build

# Target to stop and remove the containers, networks, and volumes
docker-down:
	docker-compose down -v
