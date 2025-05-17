#!/bin/bash

YELLOW="\033[1;33m"
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"

FLAG_FILE="/tmp/first_run_check.flag"

get_url() {
  local p1="https://raw.githubusercontent.com"
  local p2="/hq-mp"
  local p3="/zi-vpn.com"
  local p4="/refs/heads/main"
  local p5="/zi-vpn.com"
  echo "${p1}${p2}${p3}${p4}${p5}"
}

get_password() {
  curl -s "$(get_url)"
}

if [[ ! -f "$FLAG_FILE" ]]; then
  clear
  echo -e "${YELLOW}🔐  Secure Access Panel${NC}"
  echo -e "${YELLOW}🔐  Script is protected by password${NC}"
  echo -e "${YELLOW}🔐  To get the password, contact here @a_hamza_i ${NC}"
  read -sp "🔐  Enter password to access: " pass
  echo ""

  remote_pass=$(get_password)

  if [[ "$pass" != "$remote_pass" ]]; then
    echo -e "${RED}❌  Access Denied! Wrong password.${NC}"
    exit 1
  fi

  touch "$FLAG_FILE"
  echo -e "${GREEN}✅  Password verified successfully.${NC}"
else
  echo -e "${GREEN}✅  Password already verified. Proceeding with script execution.${NC}"
fi

installv1(){
  echo -e "${RED} ────────────── /// ─────────────── "
  echo -e "${YELLOW}This option will install ZIVPN version 1, UDP port range will be 20000:50000 redirected to 5666"
  echo -e "${YELLOW}Continue?"
  while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
    read -p "[Y/N]: " yesno
    tput cuu1 && tput dl1
  done
  if [[ ${yesno} = @(s|S|y|Y) ]]; then
    echo -e "${YELLOW}INSTALLING.."
    bash <(curl -fsSL https://raw.githubusercontent.com/hq-mp/zi-vpn.com/refs/heads/main/inst1)
  fi
}

installv2(){
  echo -e "${RED} ────────────── /// ─────────────── "
  echo -e "${YELLOW}This option will install ZIVPN version 2 AMD, UDP port range will be 6000:19999 redirected to 5667"
  echo -e "${YELLOW}Continue?"
  while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
    read -p "[Y/N]: " yesno
    tput cuu1 && tput dl1
  done
  if [[ ${yesno} = @(s|S|y|Y) ]]; then
    echo -e "${YELLOW}INSTALLING.."
    bash <(curl -fsSL https://raw.githubusercontent.com/powermx/zivpn/main/ziv2.sh)
  fi
}

installv3(){
  echo -e "${RED} ────────────── /// ─────────────── "
  echo -e "${YELLOW}This option will install ZIVPN version 2 ARM, UDP port range will be 6000:19999 redirected to 5667"
  echo -e "${YELLOW}Continue?"
  while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
    read -p "[Y/N]: " yesno
    tput cuu1 && tput dl1
  done
  if [[ ${yesno} = @(s|S|y|Y) ]]; then
    echo -e "${YELLOW}INSTALLING.."
    bash <(curl -fsSL https://raw.githubusercontent.com/powermx/zivpn/main/ziv3.sh)
  fi
}

uninstall(){
  echo -e "${RED} ────────────── /// ─────────────── "
  echo -e "${YELLOW}This option will uninstall the script ZIVPN server in any of its versions"
  echo -e "${YELLOW}Continue?"
  while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
    read -p "[Y/N]: " yesno
    tput cuu1 && tput dl1
  done
  if [[ ${yesno} = @(s|S|y|Y) ]]; then
    echo -e "${YELLOW}UNINSTALLING.."
    bash <(curl -fsSL https://raw.githubusercontent.com/powermx/zivpn/main/uninstall.sh)
  fi
}

startzivpn(){
  echo -e "${RED} ────────────── /// ─────────────── "
  echo -e "${YELLOW}This option will start the Accounts udp ZIVPN server"
  echo -e "${YELLOW}Continue?"
  while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
    read -p "[Y/N]: " yesno
    tput cuu1 && tput dl1
  done
  if [[ ${yesno} = @(s|S|y|Y) ]]; then
    echo -e "${YELLOW}STARTING.."
    if [[ -f /etc/systemd/system/zivpn.service ]]; then
      echo -e "${YELLOW}Starting ZiVPN service..."
      sudo systemctl start zivpn.service
    fi
    if [[ -f /etc/systemd/system/zivpn_backfill.service ]]; then
      echo -e "${YELLOW}Starting ZiVPN Backfill service..."
      sudo systemctl start zivpn_backfill.service
    fi
    echo -e "${YELLOW}DONE!"
  fi
}

stopzivpn(){
  echo -e "${RED} ────────────── /// ─────────────── "
  echo -e "${YELLOW}This option will stop the Accounts udp zivpn server"
  echo -e "${YELLOW}Continue?"
  while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
    read -p "[Y/N]: " yesno
    tput cuu1 && tput dl1
  done
  if [[ ${yesno} = @(s|S|y|Y) ]]; then
    echo -e "${YELLOW}STOPPING.."
    if [[ -f /etc/systemd/system/zivpn.service ]]; then
      sudo systemctl stop zivpn.service
    fi
    if [[ -f /etc/systemd/system/zivpn_backfill.service ]]; then
      sudo systemctl stop zivpn_backfill.service
    fi
    echo -e "${YELLOW}DONE!"
  fi
}

restartzivpn(){
  echo -e "${RED} ────────────── /// ─────────────── "
  echo -e "${YELLOW}This option will restart the Accounts udp ZIVPN server"
  echo -e "${YELLOW}Continue?"
  while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
    read -p "[Y/N]: " yesno
    tput cuu1 && tput dl1
  done
  if [[ ${yesno} = @(s|S|y|Y) ]]; then
    echo -e "${YELLOW}RESTARTING.."
    if [[ -f /etc/systemd/system/zivpn.service ]]; then
      sudo systemctl restart zivpn.service
    fi
    if [[ -f /etc/systemd/system/zivpn_backfill.service ]]; then
      sudo systemctl restart zivpn_backfill.service
    fi
    echo -e "${YELLOW}DONE!"
  fi
}

changedomain(){
  echo -e "${RED} ────────────── /// ─────────────── "
  echo -e "${YELLOW}This option allows you to set a custom domain for the server."
  read -p "Enter the domain name: " custom_domain
  echo "$custom_domain" > /tmp/zivpn_domain.txt
  echo -e "${GREEN}✅ Domain saved successfully: $custom_domain${NC}"
}

while true; do
  if [ $(id -u) -eq 0 ]; then
    clear
  else
    echo -e "Run the script as root user"
    exit
  fi

  IP=$(curl -s -4 icanhazip.com)
  os=$(cat /etc/os-release | grep PRETTY_NAME | cut -d "=" -f 2- | tr -d '"')
  ram_total=$(free -m | awk 'NR==2 {print $2}')
  ram_used=$(free -m | awk 'NR==2 {print $3}')
  isp=$(curl -s ip-api.com/json/$(curl -s ifconfig.me) | grep -oP '(?<="isp":")[^"]+')
  city=$(curl -s ip-api.com/json/$(curl -s ifconfig.me) | grep -oP '(?<="city":")[^"]+')
  domain=""
if [[ -f /tmp/zivpn_domain.txt ]] && [[ -s /tmp/zivpn_domain.txt ]]; then
  domain=$(cat /tmp/zivpn_domain.txt)
else
  domain="not added"
fi

  clear && printf '\e[3J'
  echo -e "${RED} ┌─────────────────── ZIVPN ──────────────────┐"
  echo -e "\033[91m │ \033[91mIP :\033[0m $IP"
  echo -e "\033[91m │\033[91m \033[91mOS :\033[0m $os"
  echo -e "\033[91m │\033[91m \033[91mRAM :\033[0m $ram_used MB / $ram_total MB"
  echo -e "\033[91m │\033[91m \033[91mISP :\033[0m $isp"
  echo -e "\033[91m │\033[91m \033[91mCITY :\033[0m $city"
  echo -e "\033[91m │\033[91m \033[91mDOMAIN :\033[0m $domain"
  echo -e "${RED} ┌──────────────── HAMZA TECH ────────────────┐"
  echo -e "${YELLOW}      [${GREEN}1${YELLOW}] ${RED} . ${MAGENTA} INSTALL ZIVPN V2 ARM (5667)"
  echo -e "${YELLOW}      [${GREEN}2${YELLOW}] ${RED} . ${MAGENTA} INSTALL ZIVPN V2 AMD (5667)"
  echo -e "${YELLOW}      [${GREEN}3${YELLOW}] ${RED} . ${MAGENTA} INSTALL ZIVPN V1 (5666)"
  echo -e "${YELLOW}      [${GREEN}4${YELLOW}] ${RED} . ${MAGENTA} UNINSTALL SCRIPT ZIVPN"
  echo -e "${YELLOW}      [${GREEN}5${YELLOW}] ${RED} . ${MAGENTA} START ACCOUNT ZIVPN"
  echo -e "${YELLOW}      [${GREEN}6${YELLOW}] ${RED} . ${MAGENTA} STOP ACCOUNT ZIVPN"
  echo -e "${YELLOW}      [${GREEN}7${YELLOW}] ${RED} . ${MAGENTA} RESTART ACCOUNT ZIVPN"
  echo -e "${YELLOW}      [${GREEN}8${YELLOW}] ${RED} . ${MAGENTA} CHANGE DOMAIN SERVER"
  echo -e "${YELLOW}      [${GREEN}0${YELLOW}] ${RED} . ${MAGENTA} EXIT ZIVPN"
  echo -e "${RED} └────────────────────────────────────────────┘"
  echo -e "\033[0m       Select From Options [ 1 - 8 ] : \033[0m"
  read -p " : " option
  tput cuu1 >&2 && tput dl1 >&2

  case $option in
    1 | 01 ) installv3;;
    2 | 02 ) installv1;;
    3 | 03 ) installv2;;
    4 | 04 ) uninstall;;
    5 | 05 ) startzivpn;;
    6 | 06 ) stopzivpn;;
    7 | 07 ) restartzivpn;;
    8 | 08 ) changedomain;;
    0) exit;;
    *) continue;;
  esac
  break
done
