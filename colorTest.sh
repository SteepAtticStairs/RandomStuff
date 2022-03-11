#!/bin/bash

bold=$(tput bold) # bold text
normal=$(tput sgr0) # normal text
black='\e[30m'
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
blue='\e[38;5;27m'
magenta='\e[35m'
cyan='\e[36m'
lightgray='\e[37m'
darkgray='\e[90m'
darkred='\e[31m'
darkgreen='\e[32m'
darkyellow='\e[33m'
lightblue='\e[\e[38;5;39m'
lightmagenta='\e[95m'
lightcyan='\e[96m'
white='\e[97m'
nocolor='\e[0m'

printf "${black}This is black${nocolor}\n"
printf "${red}This is red${nocolor}\n"
printf "${green}This is green${nocolor}\n"
printf "${yellow}This is yellow${nocolor}\n"
printf "${blue}This is blue${nocolor}\n"
printf "${magenta}This is magenta${nocolor}\n"
printf "${cyan}This is cyan${nocolor}\n"
printf "${lightgray}This is light gray${nocolor}\n"
printf "${darkgray}This is dark gray${nocolor}\n"
printf "${darkred}This is dark red${nocolor}\n"
printf "${darkgreen}This is dark green${nocolor}\n"
printf "${darkyellow}This is dark yellow${nocolor}\n"
printf "${lightblue}This is light blue${nocolor}\n"
printf "${lightmagenta}This is light magenta${nocolor}\n"
printf "${lightcyan}This is light cyan${nocolor}\n"
printf "${white}This is white${nocolor}\n"