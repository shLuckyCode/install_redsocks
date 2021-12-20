echo "install redsocks"
sudo apt install redsocks
echo "set redsocks autorun"
sudo systemctl start redsocks
sudo systemctl enable redsocks


read -p "input your server IP:" server_IP
read -p "input your port:" server_port

sed -i -e "s/ip = 0.0.0.0/ip = $server_IP/g" ./redsocks.conf
sed -i -e "s/port = 88888/port = $server_port/g" ./redsocks.conf
sed -i -e "s/{your proxy server ip}/$server_IP/g" ./iptables.sh

sudo cp ./redsocks.conf /etc/redsocks.conf
sudo systemctl restart redsocks