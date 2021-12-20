#!/bin/bash

install_apt() {
    sudo apt-get update || true
    sudo apt install -y redsocks || true
}

create_serviec(){
	sudo systemctl start redsocks || true
	sudo systemctl enable redsocks || true
}

config_proxy(){
	read -p "input your proxy IP:" proxy_ip
	read -p "input your port:" proxy_port
	sed -i -e "s/ip = 0.0.0.0/ip = $proxy_ip/g" ./redsocks.conf
	sed -i -e "s/port = 88888/port = $proxy_port/g" ./redsocks.conf

	read -p "input your shadowsocks or v2ray server ip: " remote_ip
	sed -i -e "s/{your proxy server ip}/$remote_ip/g" ./iptables.sh

	sudo cp ./redsocks.conf /etc/redsocks.conf
	sudo systemctl restart redsocks
}


distro=$(grep "^ID=" /etc/os-release | cut -d'=' -f2 | sed -e 's/"//g')
case $distro in "ubuntu")
	install_apt
	create_serviec
	config_proxy
	;;
esac


