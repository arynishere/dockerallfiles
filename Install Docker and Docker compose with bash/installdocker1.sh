function DNStoShecan() {
  echo "changing your DNS temporarily  to shecan" 
  mv /etc/resolv.conf /etc/resolv.conf.tmp
  echo "nameserver 185.51.200.2" >> /etc/resolv.conf
  echo "nameserver 178.22.122.100" >> /etc/resolv.conf
}

function normalDNS() {
  echo "changing your DNS back to normal"
  mv /etc/resolv.conf.tmp /etc/resolv.conf
}

function InstallDocker() {
  echo "installing Docker ..."
  sleep 2
    sudo apt-get remove docker docker-engine docker.io containerd runc -y
  sudo apt-get update
  sudo apt-get install ca-certificates curl gnupg lsb-release -y

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

  echo "Done! you can use docker now"
}

function InstallCompose(){
  echo "Install Docker compose ..."
  echo " all right , start install docker-compose"
        sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
  docker-compose --version

        echo " Installation completed "

        sleep 3
}

echo "
 _______  ______    __   __  __    _  ___   _______  __   __  _______  ______    _______ 
|   _   ||    _ |  |  | |  ||  |  | ||   | |       ||  | |  ||       ||    _ |  |       |
|  |_|  ||   | ||  |  |_|  ||   |_| ||   | |  _____||  |_|  ||    ___||   | ||  |    ___|
|       ||   |_||_ |       ||       ||   | | |_____ |       ||   |___ |   |_||_ |   |___ 
|       ||    __  ||_     _||  _    ||   | |_____  ||       ||    ___||    __  ||    ___|
|   _   ||   |  | |  |   |  | | |   ||   |  _____| ||   _   ||   |___ |   |  | ||   |___ 
|__| |__||___|  |_|  |___|  |_|  |__||___| |_______||__| |__||_______||___|  |_||_______|
"

echo -n  " Do you want install Docker or Docker-Compose or both  ? (docker for Docker - docker-compose for Docker-Compose - DD for both):  "
read ans


if [[ $ans == docker ]]; then
   DNStoShecan
   InstallDocker
   normalDNS

  elif [[ $ans == docker-compose ]]; then
   DNStoShecan
   InstallCompose
   normalDNS

  elif [[ $ans == DD ]]; then
  DNStoShecan
  InstallDocker
  InstallCompose
  normalDNS

  elif [[ $ans == n ]];then
    echo -e "all right"
else
echo " Please enter DD , docker , docker-compose or If you do not want to write n ) "
fi
