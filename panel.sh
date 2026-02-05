#!/bin/bash

# ===============================
# OP X LEHEND FULL PANEL SYSTEM
# ===============================

# ---------- FILES ----------
USER_DB="$HOME/.opxlegend_users.db"
mkdir -p "$HOME"
touch "$USER_DB"

# ---------- COLORS ----------
RED="\e[31m"; GREEN="\e[32m"; YELLOW="\e[33m"
BLUE="\e[34m"; PURPLE="\e[35m"; CYAN="\e[36m"
WHITE="\e[97m"; RESET="\e[0m"

colors=($RED $GREEN $YELLOW $BLUE $PURPLE $CYAN)

# ---------- REGISTER ----------
register_user() {
  clear
  echo -e "${CYAN}📝 USER REGISTRATION${RESET}"
  read -p "Create Username: " ru

  if grep -q "^$ru:" "$USER_DB"; then
    echo -e "${RED}❌ Username already exists${RESET}"
    sleep 2
    return
  fi

  read -s -p "Create Password: " rp
  echo
  read -s -p "Confirm Password: " cp
  echo

  if [[ "$rp" != "$cp" ]]; then
    echo -e "${RED}❌ Password not match${RESET}"
    sleep 2
    return
  fi

  echo "$ru:$rp" >> "$USER_DB"
  echo -e "${GREEN}✅ Registration Successful${RESET}"
  sleep 2
}

# ---------- LOGIN ----------
login_user() {
  clear
  echo -e "${CYAN}🔐 USER LOGIN${RESET}"
  read -p "Username: " lu
  read -s -p "Password: " lp
  echo

  if grep -q "^$lu:$lp$" "$USER_DB"; then
    echo -e "${GREEN}✅ Login Successful${RESET}"
    sleep 1
  else
    echo -e "${RED}❌ Invalid Username or Password${RESET}"
    sleep 2
    exit 1
  fi
}

# ---------- AUTH MENU ----------
while true; do
  clear
  echo -e "${YELLOW}OP X LEHEND AUTH SYSTEM${RESET}"
  echo
  echo "[1] 🔐 Login"
  echo "[2] 📝 Register"
  echo "[3] ❌ Exit"
  echo
  read -p "Select Option: " auth

  case $auth in
    1) login_user; break ;;
    2) register_user ;;
    3) exit ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
done

# ---------- LOGO ----------
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
echo -e "${CYAN}NETWORK${RESET}"
echo -e "${WHITE}Made by op x legend${RESET}"
sleep 1

# ---------- FUNCTIONS ----------
github_vps() {
  clear
  echo -e "${CYAN}🚀 GitHub VPS Maker${RESET}"
  echo
  echo "✔ GitHub account লাগবে"
  echo "✔ GitHub Actions VPS method"
  echo
  echo "Example Repo:"
  echo "https://github.com/afnan007a/GitHub-Actions-VPS"
  echo
  echo "👉 Fork → Edit workflow → Run"
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

fake_scan() {
  clear
  echo -e "${GREEN}⚡ Fake System Scan Started${RESET}"
  for i in {1..25}; do
    echo "[OK] Scanning module $i"
    sleep 0.08
  done
  echo -e "${CYAN}✔ Scan Completed${RESET}"
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

# ---------- MAIN MENU ----------
while true; do
  clear
  echo -e "${PURPLE}DEVELOPMENT MANAGEMENT CONSOLE${RESET}"
  echo
  echo "[1] 🚀 GitHub VPS Maker"
  echo "[2] 🛠 IDX Auto Install"
  echo "[3] ⚡ Fake Loading + Scan"
  echo "[4] 🌐 KVM VPS Checker"
  echo "[5] ❌ Exit"
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
