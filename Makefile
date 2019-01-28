
PROJECT_NAME=visipedia-annotation-tools-work
SERVER_PORT=8008
IMAGE_NAME=$(PROJECT_NAME)-image
CONTAINER_NAME=$(PROJECT_NAME)-container
USER_ID=$(shell id -u)
GROUP_ID=$(shell id -g)

docker-build:
	docker build \
		-t $(IMAGE_NAME) \
		--build-arg user_id=$(USER_ID) \
		--build-arg group_id=$(GROUP_ID) \
		-f docker/Dockerfile .

docker-build-no-cache:
	docker build \
		-t $(IMAGE_NAME) \
		--build-arg user_id=$(USER_ID) \
		--build-arg group_id=$(GROUP_ID) \
		-f docker/Dockerfile --no-cache .

docker-run:
	docker run -it --rm --runtime=nvidia \
		--user ubuntu \
		--name $(CONTAINER_NAME) \
		-p $(SERVER_PORT):8008 \
		-v `pwd`:/work \
		-e MONGO_INITDB_ROOT_USERNAME=root \
		-e MONGO_INITDB_ROOT_PASSWORD=example \
		-e MONGO_INITDB_DATABASE=annotation_database \
		$(IMAGE_NAME) \
		/bin/bash /work/scripts/docker-entrypoint.sh
		#python3 /home/ubuntu/annotation_tools/run.py --port 8008 --host 0.0.0.0

