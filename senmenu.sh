#! /bin/bash

echo -e "${YELLOW}Config Data${NC}"

wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu.sh"
#wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/gigclone/xray-mod/main/ssh/menu-ssh.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/menu-vmess.sh"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/menu-vless.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/menu-trojan.sh"
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/menu-ss.sh"
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/add-vless.sh"
wget -q -O /usr/bin/dell "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/dell.sh"
wget -q -O /usr/bin/cekl "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/cekl.sh"
wget -q -O /usr/bin/renel "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/renel.sh"
#wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/gigclone/xray-mod/main/ssh/usernew.sh"
#wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/gigclone/xray-mod/main/ssh/trial.sh"
#wget -q -O /usr/bin/webmin "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu-webmin.sh"
wget -q -O /usr/bin/addhost "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/addhost.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/restart.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/running.sh"
wget -q -O /usr/bin/cek-speed "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/speedtes_cli.py"
#wget -q -O /usr/bin/limit-speed "https://raw.githubusercontent.com/gigclone/xray-mod/main/limitspeed.sh"
wget -q -O /usr/bin/genssl "https://raw.githubusercontent.com/gigclone/xray-mod/main/menu/genssl.sh"
#wget -q -O /usr/bin/autobackup "https://raw.githubusercontent.com/gigclone/xray-mod/main/autobackup.sh"
#wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/gigclone/xray-mod/main/clearlog.sh"



chmod +x /usr/bin/menu
#chmod +x /usr/bin/menu-ssh
chmod +x /usr/bin/menu-vmess
chmod +x /usr/bin/menu-vless
chmod +x /usr/bin/menu-trojan
chmod +x /usr/bin/menu-ss
chmod +x /usr/bin/add-vless
chmod +x /usr/bin/dell
chmod +x /usr/bin/cekl
chmod +x /usr/bin/renel
#chmod +x /usr/bin/usernew
#chmod +x /usr/bin/trial
#chmod +x /usr/bin/webmin
chmod +x /usr/bin/addhost
chmod +x /usr/bin/restart
chmod +x /usr/bin/running
chmod +x /usr/bin/cek-speed
#chmod +x /usr/bin/limit-speed
chmod +x /usr/bin/genssl
#chmod +x /usr/bin/autobackup
#chmod +x /usr/bin/clearlog
