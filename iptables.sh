#!/bin/bash

if [ $# -lt 1 ]; then
    echo -en "\n"

    echo "Iptables redirect script to support global proxy on ss for linux ... "
    echo -en "\n"
    echo "Usage : ${0} action [options]"
    echo "Example:"
    echo -en "\n"
    echo "${0} start server_ip To start global proxy"
    echo "${0} stop To stop global proxy"
    echo -en "\n"
else
    if [ "$1" == "stop" ]; then
        echo "stoping the Iptables redirect script ..."
        sudo iptables -t nat -F
    fi

    if [ "$1" == "start" ]; then
        sudo iptables -t nat -A OUTPUT -d {your proxy server ip} -j RETURN
        sudo iptables -t nat -A OUTPUT -d 10.0.0.0/8 -j RETURN
        sudo iptables -t nat -A OUTPUT -d 172.16.0.0/12 -j RETURN
        sudo iptables -t nat -A OUTPUT -d 192.168.0.0/16 -j RETURN
        sudo iptables -t nat -A OUTPUT -d 127.0.0.0/8 -j RETURN
        sudo iptables -t nat -A OUTPUT -p tcp -j REDIRECT --to-ports 12345 
    fi
fi