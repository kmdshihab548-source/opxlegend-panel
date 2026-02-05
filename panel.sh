#!/bin/bash

clear

# Colors
colors=(
  "\e[31m"  # Red
  "\e[32m"  # Green
  "\e[33m"  # Yellow
  "\e[34m"  # Blue
  "\e[35m"  # Purple
  "\e[36m"  # Cyan
)

RESET="\e[0m"

logo=(
" ██████╗ ██████╗     ██╗  ██╗    ██╗     ███████╗██╗  ██╗███████╗███╗   ██╗██████╗ "
"██╔═══██╗██╔══██╗    ╚██╗██╔╝    ██║     ██╔════╝██║  ██║██╔════╝████╗  ██║██╔══██╗"
"██║   ██║██████╔╝     ╚███╔╝     ██║     █████╗  ███████║█████╗  ██╔██╗ ██║██║  ██║"
"██║   ██║██╔═══╝      ██╔██╗     ██║     ██╔══╝  ██╔══██║██╔══╝  ██║╚██╗██║██║  ██║"
"╚██████╔╝██║         ██╔╝ ██╗    ███████╗███████╗██║  ██║███████╗██║ ╚████║██████╔╝"
" ╚═════╝ ╚═╝         ╚═╝  ╚═╝    ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═════╝ "
)

typing_print() {
  local text="$1"
  for ((i=0; i<${#text}; i++)); do
    printf "%s" "${text:$i:1}"
    sleep 0.002
  done
  printf "\n"
}

color_index=0

for line in "${logo[@]}"; do
  echo -ne "${colors[$color_index]}"
  typing_print "$line"
  color_index=$(( (color_index + 1) % ${#colors[@]} ))
done

echo -e "${RESET}"
sleep 0.3

echo -ne "\e[36m"
typing_print "            NETWORK"
sleep 0.2
echo -ne "\e[33m"
typing_print "        Made by op x legend"
echo -e "${RESET}"
sleep 0.5

echo
echo -e "\e[31mDEVELOPMENT MANAGEMENT CONSOLE\e[0m"
echo
echo -e "\e[33mMAIN OPTIONS\e[0m"
echo
echo -e "\e[97m[1] 🚀 GitHub VPS Maker\e[0m"
echo -e "\e[97m[2] 🛠 IDX Tool Setup\e[0m"
echo -e "\e[97m[3] ⚡ IDX VPS Maker\e[0m"
echo -e "\e[97m[4] 🌐 Real VPS (Any + KVM)\e[0m"
echo -e "\e[97m[5] ❌ Exit\e[0m"
echo
read -p ">> Select Option [1-5]: " opt
