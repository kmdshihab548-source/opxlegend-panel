#!/bin/bash

# ====== CONFIG ======
USER="op"
PASS="legend"

# ====== COLORS ======
RED="\e[31m"; GREEN="\e[32m"; YELLOW="\e[33m"
BLUE="\e[34m"; PURPLE="\e[35m"; CYAN="\e[36m"
WHITE="\e[97m"; RESET="\e[0m"

colors=($RED $GREEN $YELLOW $BLUE $PURPLE $CYAN)

# ====== LOGIN ======
clear
echo -e "${CYAN}🔐 OP X LEHEND SECURE LOGIN${RESET}"
read -p "Username: " u
read -s -p "Password: " p
echo

if [[ "$u" != "$USER" || "$p" != "$PASS" ]]; then
  echo -e "${RED}❌ Access Denied${RESET}"
  exit 1
fi

# ====== LOGO ======
clear
logo=(
" ██████╗ ██████╗     ██╗  ██╗    ██╗     ███████╗██╗  ██╗███████╗███╗   ██╗██████╗ "
"██╔═══██╗██╔══██╗    ╚██╗██╔╝    ██║     ██╔════╝██║  ██║██╔════╝████╗  ██║██╔══██╗"
"██║   ██║██████╔╝     ╚███╔╝     ██║     █████╗  ███████║█████╗  ██╔██╗ ██║██║  ██║"
"██║   ██║██╔═══╝      ██╔██╗     ██║     ██╔══╝  ██╔══██║██╔══╝  ██║╚██╗██║██║  ██║"
"╚██████╔╝██║         ██╔╝ ██╗    ███████╗███████╗██║  ██║███████╗██║ ╚████║██████╔╝"
" ╚═════╝ ╚═╝         ╚═╝  ╚═╝    ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═════╝ "
)

i=0
for l in "${logo[@]}"; do
  echo -e "${colors[$i]}$l"
  i=$(( (i+1) % 6 ))
  sleep 0.05
done
echo -e "${RESET}"
echo -e "${YELLOW}NETWORK${RESET}"
echo -e "${WHITE}Made by op x legend${RESET}"
sleep 1

# ====== FUNCTIONS ======
fake_scan() {
  clear
  echo -e "${GREEN}🔍 System Scan Started...${RESET}"
  for i in {1..20}; do
    echo -e "[OK] Scanning module $i"
    sleep 0.1
  done
  echo -e "${CYAN}✔ Scan Completed Successfully${RESET}"
  read -p "Press Enter to return..."
}

kvm_check() {
  clear
  if egrep -q '(vmx|svm)' /proc/cpuinfo; then
    echo -e "${GREEN}✅ KVM SUPPORTED${RESET}"
  else
    echo -e "${RED}❌ KVM NOT SUPPORTED${RESET}"
  fi
  read -p "Press Enter to return..."
}

github_vps() {
  clear
  echo -e "${CYAN}🚀 GitHub VPS Maker${RESET}"
  echo "1) Create GitHub account"
  echo "2) Use GitHub Actions VPS repo"
  echo "3) Example repo:"
  echo "   https://github.com/afnan007a/GitHub-Actions-VPS"
  echo
  echo "👉 Fork repo → Edit workflow → Run"
  read -p "Press Enter to return..."
}

idx_install() {
  clear
  echo -e "${YELLOW}🛠 IDX Auto Install${RESET}"
  if command -v pkg >/dev/null; then
    pkg update -y
    pkg install git -y
    echo "✔ Termux ready"
  else
    sudo apt update -y
    sudo apt install git -y
    echo "✔ Linux ready"
  fi
  read -p "Press Enter to return..."
}

# ====== MENU LOOP ======
while true; do
  clear
  echo -e "${PURPLE}DEVELOPMENT MANAGEMENT CONSOLE${RESET}"
  echo
  echo -e "${WHITE}[1] 🚀 GitHub VPS Maker${RESET}"
  echo -e "${WHITE}[2] 🛠 IDX Auto Install${RESET}"
  echo -e "${WHITE}[3] ⚡ Fake Loading + Scan${RESET}"
  echo -e "${WHITE}[4] 🌐 KVM VPS Checker${RESET}"
  echo -e "${WHITE}[5] ❌ Exit${RESET}"
  echo
  read -p ">> Select Option [1-5]: " opt

  case $opt in
    1) github_vps ;;
    2) idx_install ;;
    3) fake_scan ;;
    4) kvm_check ;;
    5) exit ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
done
