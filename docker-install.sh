#!/bin/bash

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo deb deb https://apt.dockerproject.org/repo ubuntu-xenial main | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install docker-engine
sudo service docker start
sudo usermod -aG docker $USER

echo -e "\e[00;31mDocker instalado com sucesso, é necessário reiniciar o computador, deseja continuar? (y/n)\e[00m"
read answer

if [[ $answer =~ "y" ]]; then
	sudo reboot
fi
