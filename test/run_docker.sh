#!/bin/bash

# Nom de l'image Docker
IMAGE_NAME="httpd"

# Nom du conteneur Docker
CONTAINER_NAME="ansible-test"

# Port de l'application
HOST_PORT=81

# Chemin absolu vers le répertoire contenant le site web
SITE_DIR="$PWD/test/web"

# Pull de l'image Docker Apache
docker pull $IMAGE_NAME

# Lancement du conteneur Docker Apache avec le site en tant que volume
docker run --rm -d -p $HOST_PORT:80 -v $SITE_DIR:/usr/local/apache2/htdocs/ --name $CONTAINER_NAME $IMAGE_NAME
