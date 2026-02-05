#!/bin/bash

# ===============================
# OP X LEGEND FULL PANEL SYSTEM
# ===============================

# ---------- USER DATABASE ----------
USER_DB="$HOME/.opxlegend_users.db"
touch "$USER_DB"

# ---------- COLORS ----------
RED="\e[31m"; GREEN="\e[32m"; YELLOW="\e[33m"
BLUE="\e[34m"; PURPLE="\e[35m"; CYAN="\e[36m"
WHITE="\e[97m"; RESET="\e[0m"

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

  [[ "$rp" != "$cp" ]] && echo -e "${RED}❌ Password not match${RESET}" && sleep 2 && return

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
    echo -e "${RED}❌ Invalid Login${RESET}"
    sleep 2
    exit 1
  fi
}

# ---------- AUTH MENU ----------
while true; do
  clear
  echo -e "${YELLOW}OP X LEGEND AUTH SYSTEM${RESET}"
  echo "[1] 🔐 Login"
  echo "[2] 📝 Register"
  echo "[3] ❌ Exit"
  read -p "Select Option: " a

  case $a in
    1) login_user; break ;;
    2) register_user ;;
    3) exit ;;
    *) echo "Invalid"; sleep 1 ;;
  esac
done

# ---------- LOGO ----------
clear
echo -e "${PURPLE}OP X LEGEND PANEL LOADED${RESET}"
sleep 1

# ---------- FUNCTIONS ----------
github_vps() {
  clear
  echo -e "${CYAN}🚀 GitHub VPS Maker${RESET}"
  echo "Fork GitHub Actions VPS repo & run workflow"
  read -p "Press Enter..."
}

idx_install() {
  clear
  echo -e "${YELLOW}🛠 IDX Auto Install${RESET}"
  if command -v pkg >/dev/null; then
    pkg update -y && pkg install git -y
  else
    sudo apt update -y && sudo apt install git -y
  fi
  read -p "Press Enter..."
}

fake_scan() {
  clear
  echo -e "${GREEN}⚡ Fake Loading + Scan${RESET}"
  for i in {1..30}; do
    echo "[OK] Scanning system module $i"
    sleep 0.07
  done
  echo -e "${CYAN}✔ Scan Completed${RESET}"
  read -p "Press Enter..."
}

kvm_check() {
  clear
  if egrep -q '(vmx|svm)' /proc/cpuinfo; then
    echo -e "${GREEN}✅ KVM SUPPORTED${RESET}"
  else
    echo -e "${RED}❌ KVM NOT SUPPORTED${RESET}"
  fi
  read -p "Press Enter..."
}

# 🌈 MULTI COLOR 24/7 MODE
opx_24_7() {
  clear
  echo -e "${GREEN}♾ OP X LEGEND 24/7 ONLINE MODE${RESET}"
  echo -e "${CYAN}CTRL + C to stop${RESET}"
  sleep 1

  colors=(
    "\e[31m" "\e[32m" "\e[33m"
    "\e[34m" "\e[35m" "\e[36m"
    "\e[91m" "\e[92m" "\e[94m"
  )

  i=0
  while true; do
    echo -e "${colors[$i]}OP X LEGEND 24/7 ONLINE${RESET}"
    i=$(( (i+1) % ${#colors[@]} ))
    sleep 0.3
  done
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
  echo "[6] ♾ OP X LEGEND 24/7 ONLINE"
  echo
  read -p ">> Select Option [1-6]: " o

  case $o in
    1) github_vps ;;
    2) idx_install ;;
    3) fake_scan ;;
    4) kvm_check ;;
    5) exit ;;
    6) opx_24_7 ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
done
