#!/bin/bash

#nardi strukturo domačega uporabnika
mkhomedir_helper username




#nardi 5 map

for i in 1 2 3 4 5
do
mkdir folder_${i}
done



#nardi 5 uporabnikov z domačo mapo


for i in 1 2 3 4 5
do
sudo useradd -m uporabnik${i}
sudo usermod -aG sudo uporabnik${i}
done

less /etc/passwd
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


cd /etc/nginx/sites-enabled

sudo service nginx restart
cd ..
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


