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

printf ""
printf "${green}${bold}By starting this script, I assume that you have committed and pushed all of your changes. \
Type anything to continue, confirming that your chages are pushed and that you are ready to proceed.${NC}${normal}\n"
read anything1

printf "\n"
printf "${green}${bold}What version number would you like to give this version? This can be any whole number.${NC}${normal}\n"
read versionNumber
printf "\n"

cd ~/Github/ytdwn
printf "${blue}${bold}---> Making git tag...${NC}${normal}\n"
git tag -a v0.0.$versionNumber -m "version 0.0.${versionNumber}"
printf "${blue}${bold}---> Pushing git tag...${NC}${normal}\n"
git push origin v0.0.$versionNumber
cd ~

targzURL=https://github.com/SteepAtticStairs/ytdwn/archive/refs/tags/v0.0.$versionNumber.tar.gz

printf "\n"
printf "${blue}${bold}---> Removing ruby file from Homebrew directory...${NC}${normal}\n"
printf "${green}${bold}Please enter in your password, as sudo is required.${NC}${normal}\n"
printf "${green}${bold}If it says the file isn't found, that is normal. This script removes the file again at the end of the script.${NC}${normal}\n"
sudo rm /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/ytdwn.rb
printf "${blue}${bold}---> Running brew create...${NC}${normal}\n"
brew create $targzURL 2> /dev/null
printf "\n"
printf "${blue}${bold}---> Getting hash line from ruby file...${NC}${normal}\n"
firstTrimmed=$(cat /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/ytdwn.rb | grep sha256 | cut -f1 | tr -s ' ')
printf "${blue}${bold}---> Trimming the hash line...${NC}${normal}\n"
firstTrimmed=${firstTrimmed:9}
firstTrimmed=${firstTrimmed%?}
finalHash=$firstTrimmed
printf "\n"
printf "${green}${bold}This is your hash: ${red}${finalHash}${NC}${normal}\n"
printf "${green}${bold}This is your URL: ${red}${targzURL}${NC}${normal}\n"
printf "${green}${bold}Copy these lines.${NC}${normal}\n"
printf "\n"
printf "${green}${bold}This will open the homebrew-ytdwn repo in VSCode. Paste this hash in the sha256 secion, and paste the URL into the URL section. \
You do not need to commit or push.${NC}${normal}\n"
# printf "Type anything to continue."
# read anything2

printf "\n"
printf "${blue}${bold}---> Opening homebrew-ytdwn in VSCode...${NC}${normal}\n"
code ~/Github/homebrew-ytdwn

printf "\n"
printf "${green}${bold}Type anything once you are done to continue.${NC}${normal}\n"
read anything3

cd ~/Github/homebrew-ytdwn
printf "\n"
printf "${blue}${bold}---> Adding...${NC}${normal}\n"
git add .
printf "${blue}${bold}---> Commiting with the message v0.0.${versionNumber}...${NC}${normal}\n"
git commit -m "v0.0.${versionNumber}"
printf "${blue}${bold}---> Pushing...${NC}${normal}\n"
git push
printf "${blue}${bold}---> Changes pushed!${NC}${normal}\n"
cd ~

printf "\n"
printf "${blue}${bold}---> Removing ruby file from Homebrew directory...${NC}${normal}\n"
printf "${green}${bold}Please enter in your password if sudo is required.${NC}${normal}\n"
sudo rm /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/ytdwn.rb

printf "\n"
printf "${green}${bold}You are good to go! Now you need to run${NC}${normal}\n"
printf "\n"
printf "      ${cyan}${bold}brew upgrade${NC}${normal}\n"
printf "\n"
printf "${green}${bold}to update ytdwn. If it doesn't update, give it a couple of minutes. If it still doesn't update, try running${NC}${normal}\n"
printf "\n"
printf "      ${cyan}${bold}brew tap steepatticstairs/ytdwn && brew install ytdwn${NC}${normal}\n"
printf "\n"
printf "\n"
printf "${green}${bold}Thanks for using updateBrew.sh!${NC}${normal}\n"