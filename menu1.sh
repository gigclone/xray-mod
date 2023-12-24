BIBlack='\033[1;90m' 
Tes sih ini     # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="raw.githubusercontent.com/Zeastore/test/main"
export Server1_URL="raw.githubusercontent.com/Zeastore/limit/main"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther=".geovpn"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // Exporting Network Interface
export NETWORK_IFACE="$(ip route show to default | awk '{print $5}')"

# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
function addhost(){
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
rm -fr /etc/xray/domain
echo "IP=$host" > /var/lib/scrz-prem/ipvps.conf
echo $host > /etc/xray/domain
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew gen-ssl"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
}
function genssl(){
clear
systemctl stop nginx
systemctl stop xray
domain=$(cat /var/lib/scrz-prem/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew gen-ssl... " 
sleep 2
/root/.acme.sh/acme.sh --upgrade
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew gen-ssl done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /etc/xray/domain
systemctl start nginx
systemctl start xray
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Penyet sak karepmu cuk"
menu
}
wget -q -O /root/status "https://raw.githubusercontent.com/gigclone/xray-mod/main/statushariini"
LocalVersion=$(cat /root/versi)
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"
clear
echo -e "${BICyan}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}                   ⇱ SERVER INFORMATION ⇲                                \E[0m"
echo -e "${BICyan}└─────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan} "                                                                      
echo -e "${BIRed} ⇲  ${PURPLE}Current Domain  :  ${BIYellow}$(cat /etc/xray/domain)${NC}" 
echo -e "${BIRed} ⇲  ${PURPLE}Ip-vps          :  ${BIYellow}$IPVPS${NC}"
echo -e "${BIRed} ⇲  ${PURPLE}ISP             :  ${BIYellow}$ISPVPS${NC}"  
echo -e "${BIRed} ⇲  ${PURPLE}Status Hari Ini :  ${BIYellow}$(cat /root/status)${NC}"                                 
echo -e "${BICyan} "
echo -e "${BICyan}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}                   ⇱ STATUS SERVICE ⇲                                    \E[0m"
echo -e "${BICyan}└─────────────────────────────────────────────────┘${NC}"
echo -e "     ${BIRed} NGINX ${NC}: ${GREEN}$resngx         ${LIGHT} Today  : $ttoday"
echo -e "     ${BIRed} XRAY  ${NC}: ${GREEN}$resv2r         ${LIGHT} Monthly: $tmon"
echo -e 
echo -e "${BICyan}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}                   ⇱ MENU ⇲                                               \E[0m"
echo -e "${BIGreen}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BIWhite}[01]${NC}  ${BIWhite}[${NC}${BIGreen}MENU VMESS${NC}${BIWhite}]${NC}               ${BIWhite}[06]${NC}  ${BIWhite}[${NC}${BIGreen}CERTXRAY${NC}${BIWhite}]${NC} "
echo -e "${BIWhite}[02]${NC}  ${BIWhite}[${NC}${BIGreen}MENU VLESS${NC}${BIWhite}]${NC}               ${BIWhite}[07]${NC}  ${BIWhite}[${NC}${BIGreen}RUNNING${NC}${BIWhite}]${NC} "
echo -e "${BIWhite}[03]${NC}  ${BIWhite}[${NC}${BIGreen}MENU TROJAN${NC}${BIWhite}]${NC}              ${BIWhite}[08]${NC}  ${BIWhite}[${NC}${BIGreen}RESTART${NC}${BIWhite}]${NC} "
echo -e "${BIWhite}[04]${NC}  ${BIWhite}[${NC}${BIGreen}MENU SS${NC}${BIWhite}]${NC}                  ${BIWhite}[09]${NC}  ${BIWhite}[${NC}${BIGreen}REBOOT${NC}${BIWhite}]${NC} "
echo -e "${BIWhite}[05]${NC}  ${BIWhite}[${NC}${BIGreen}ADD DOMAIN${NC}${BIWhite}]${NC}               ${BIWhite}[10]${NC}  ${BIWhite}[${NC}${BIGreen}CEK SPEED${NC}${BIWhite}]${NC} "
echo -e "${BICyan}└─────────────────────────────────────────────────┘${NC}"
echo -e " "
echo -e "${BICyan}                   ⇱ MOD MENU ⇲                                               \E[0m"
echo -e " "
echo -e "${BICyan}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}                   ⇱ BOSS MUDA ⇲                                               \E[0m"
echo -e "${BICyan}└─────────────────────────────────────────────────┘${NC}"
rm -f /root/status

echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-vmess ;;
2) clear ; menu-vless ;;
3) clear ; menu-trojan ;;
4) clear ; menu-ss ;;
5) clear ; addhost ;;
6) clear ; genssl ;;
7) clear ; running ;;
8) clear ; restart ;;
9) clear ; reboot ;;
10) clear ; cek-speed ;;

0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; menu ;;
esac
