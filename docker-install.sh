#!/bin/bash
# script to install docker

sudo apt -y update
sudo apt -y install ca-certificates curl gnupg lsb-release


if [[ ! -e /usr/share/keyrings/docker-archive-keyring.gpg ]]; then
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
fi


sudo apt -y update
sudo apt -y install docker-ce docker-ce-cli containerd.io