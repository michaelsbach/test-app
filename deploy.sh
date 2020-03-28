#!/bin/sh
set -e # Stop script from running if there are any errors

IMAGE="michaelsbach/testapp"                             # Docker image
GIT_VERSION=$(git describe --always --abbrev --tags --long) # Git hash and tags

# Build and tag image
docker build -t ${IMAGE}:${GIT_VERSION} .
docker tag ${IMAGE}:${GIT_VERSION} ${IMAGE}:latest

# Log in to Docker Hub and push
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
docker push ${IMAGE}:${GIT_VERSION}


#from here, need to use digital ocean's "doctl" CLI commands

#find current running container and stop it 
		#(You can do this by setting a --name on the container, and stopping and removing that container before setting the new one)

#start up new container in bg
#run server's local port on 80 (ie, so can access example.com instead of example.com:5000)
  # docker run --name=curr_container --restart-unless-stopped -d -p 80:5000
#prune all old containers and images
  # docker system prune -a -f

