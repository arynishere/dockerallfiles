#/bin/bash
echo -e " Do you want install Docker or Docker-compose or both  ? (just install docker you should write name like docker,docker-compose) "
read ans
if [[ $ans == docker ]];then
    echo " enjoy :)"
    sleep 2
    rm -rf /etc/resolv.conf
    cp ./resolv.conf /etc/
    sudo apt-get remove docker docker-engine docker.io containerd runc -y

    sudo apt-get update
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
     echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
 echo " Installation completed "
	elif [[ $ans == docker-compose ]];then

	echo " all right , start install docker-compose"

	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

	sudo chmod +x /usr/local/bin/docker-compose

	docker-compose --version

	echo " Installation completed "

	sleep 3 
elif [[ $ans == n ]];then
    echo -e "allreight"
else 
echo " please enter y or n (yes or no) "
fi
