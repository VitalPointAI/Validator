#!/bin/bash
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
service ssh restart
runsvdir -P /etc/service &
nodepid=0
t=1
sleep 5
if [[ -e ~/.near/validator_key.json ]]
then
	while [[ "$t" -eq 1 ]]
	do
		SYNH
		date
		sleep 5m
	done
fi

apt update && apt upgrade -y
apt install sudo nano -y
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -  
sudo apt install build-essential nodejs -y
PATH="$PATH"
node -v
npm -v
sudo npm install -g near-cli
export NEAR_ENV=mainnet
echo 'export NEAR_ENV=mainnet' >> ~/.bashrc
near proposals

echo  ===================setup dev tools===================

sleep 10
sudo apt install -y git binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev cmake gcc g++ docker.io protobuf-compiler libssl-dev pkg-config clang llvm cargo awscli 2to3 python2-minimal python2 dh-python python-is-python3
sudo apt install python3-pip -y
USER_BASE_BIN=$(python3 -m site --user-base)/bin
export PATH="$USER_BASE_BIN:$PATH"
sudo apt-get install wget
sudo apt install clang build-essential make -y
curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh -s -- -y
source $HOME/.cargo/env
rustup update stable
source $HOME/.cargo/env
sleep 20
cd /root/
git clone "https://github.com/near/nearcore"
sleep 5
commit=`curl -s https://raw.githubusercontent.com/VitalPointAI/Validator/main/commit.md`
sleep 5
cd nearcore
git fetch
git checkout $commit
done