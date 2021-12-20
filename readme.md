# == install and config redsocks==
```
mkdir ~/proxy
cd ~/proxy
git clone https://github.com/shLuckyCode/install_redsocks.git
cd ./install_redsocks
sudo ./setup.sh
```

## 开启全局代理
```
./iptables.sh start
```

## 关闭全局代理
```
./iptables.sh stop
```

## 添加快捷命令启动
```
vim ~/.zshrc

增加以下内容
alias start_proxy="sudo bash ~/proxy/install_redsocks/iptables.sh start"
alias stop_proxy="sudo bash ~/proxy/install_redsocks/iptables.sh stop"
```



