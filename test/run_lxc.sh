#!/bin/bash

SITE_DIR="$PWD/test/web"

# Créer un conteneur
sudo lxc-create -t download -n my-container -- -d ubuntu -r bionic -a amd64

# Démarrer le conteneur
sudo lxc-start -n my-container

# Attendre que le conteneur soit démarré
sleep 10
HOST_PORT=82

# Se connecter au conteneur
sudo lxc-attach -n my-container -- bash -c "apt-get update && apt-get install -y apache2"

# Monter le dossier contenant le script web
lxc-config device add my-container my-files disk source=$SITE_DIR path=/var/www/html
sudo /usr/lib/x86_64-linux-gnu/lxc config device add mycontainer http proxy listen=tcp:0.0.0.0:$HOST_PORT connect=tcp:127.0.0.1:80

# Redémarrer le conteneur pour prendre en compte le montage
sudo lxc-stop -n my-container
sudo lxc-start -n my-container
