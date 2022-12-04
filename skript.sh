#!/bin/bash

#nardi strukturo domačega uporabnika
mkhomedir_helper username




#nardi 5 map
start=1
ends=5
for((i=$start;i<=$end;i++))
do
mkdir "folder${i}"
done


#nardi 5 uporabnikov z domačo mapo
start=1
ends=5
for((i=$start;i<=$end;i++))
do
useradd -m uporabnik${i}
sudo usermod -aG sudo uporabnik${i}
done

#sudo apt-get update && sudo apt-get upgrade

#ufw firewall
sudo apt install ufw

sudo ufw default allow outgoing
sudo ufw default deny incoming

sudo ufw allow ssh

sudo ufw enable
ufw status

#install nginx
sudo apt install nginx
cd /var/www
sudo mkdir primer
cd primer
sudo "${EDITOR:-vi}" index.html

cd /etc/nginx/sites-enabled
sudo "${EDITOR:-vi}" primer
sudo service nginx restart

#install net-tools
sudo apt-get -y install net-tools
sudo apt update
sudo apt -y install net-tools


#install GIT
git --version
sudo apt install git
git --version

git config --global user.name "MedeniJazbec"
git config --global user.email "matic.ozimic@gmail.com"
git config --list

#install docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#install docker engine
sudo apt-get update
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update

#install docker engine, containerd, docker compose
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world


