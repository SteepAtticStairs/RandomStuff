#!/bin/bash

bold=$(tput bold) # bold text
normal=$(tput sgr0) # normal text
black='\e[30m'
red='\e[91m'
green='\e[32m'
yellow='\e[93m'
blue='\e[38;5;27m'
magenta='\e[35m'
cyan='\e[36m'
lightgray='\e[37m'
darkgray='\e[90m'
darkred='\e[31m'
darkgreen='\e[92m'
darkyellow='\e[33m'
lightblue='\e[\e[38;5;39m'
lightmagenta='\e[95m'
lightcyan='\e[96m'
white='\e[97m'
nocolor='\e[0m'

##############################################################################################################

printf "\n"
printf "\n"

printf "UNINSTALL"
printf "\n"
printf "\n"
printf "This script will need sudo access to modify files in /usr/local/bin."
printf "\n"
printf "Please enter the password in now."
printf "\n"
sudo -v
printf "\n"
printf "${green}${bold}1)${NC}${normal} srccd-dw\n"
printf "${green}${bold}2)${NC}${normal} updateBrew\n"
printf "Enter the number of the script you wish to uninstall."
printf "\n"
read scriptWish
printf "\n"

if [[ $scriptWish == 1 ]]; then
    sudo rm -f /usr/local/bin/srccd-dw
elif [[ $scriptWish == 2 ]]; then
    sudo rm -f /usr/local/bin/updateBrew
fi

printf "\n"
printf "Done!"
printf "\n"
printf "\n"