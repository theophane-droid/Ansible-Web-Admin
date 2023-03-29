# Ansible Web Admin

This repository provides a collection of playbooks to download any kind of web app.

## Ansible Installation

Please run:

```bash
sudo pip3 install ansible
sudo apt -y install sshpass rsync
```
Then create the Ansible configuration directory:

```bash
sudo mkdir -p /etc/ansible/inventory
```

Next, move the configuration template:

```bash
sudo cp conf/ansible_cfg_template.cfg /etc/ansible/ansible.cfg
```

Then create a copy of the inventory template:

```bash
sudo cp conf/ansible_inventory_template /etc/ansible/inventory/webapp
```

Finally, edit both files to complete them with your own configuration needs.

## Configure Targets

In each Ansible target in your inventory, please run:

```bash
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
```

This will allow Ansible to run the necessary commands without any password prompts.

> ⚠️ This may pose a security issue.

## Test connexion

You can run :

```bash
ansible all -m ping
```

## Playbooks inventory

You will find playbooks in **playbooks** directory. You can run any with the commande :

```bash
ansible-playbook playbooks/target_playbook.yml
```

| Name                   | Description                              |
| ---------------------- | ---------------------------------------- |
| download_dirs.yml      | Download a the known web configuration and code storage dir and store it in ~/backup directory |
| download_docker.yml    | Download the docker image in ~/backup and the related code (mountage points) |
