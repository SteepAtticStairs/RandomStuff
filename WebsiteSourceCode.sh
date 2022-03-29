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

# srccd-dw

shopt -s nocasematch

myWebsiteURL=https://codeload.github.com/SteepAtticStairs/steepatticstairs.github.io/zip/refs/heads/main
ytdwnURL=https://codeload.github.com/SteepAtticStairs/ytdwn/zip/refs/heads/main
homebrewytdwnURL=https://codeload.github.com/SteepAtticStairs/homebrew-ytdwn/zip/refs/heads/main
largeFilesURL=https://codeload.github.com/SteepAtticStairs/LargeFiles/zip/refs/heads/main
randomStuffURL=https://codeload.github.com/SteepAtticStairs/RandomStuff/zip/refs/heads/main
theAtticRealmURL=https://codeload.github.com/SteepAtticStairs/TheAtticRealm/zip/refs/heads/main
now="$(date '+%m.%d.%Y')"

myWebsiteHash () {
    cd ~/Github/steepatticstairs.github.io
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
ytdwnHash () {
    cd ~/Github/ytdwn
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
homebrewytdwnHash () {
    cd ~/Github/homebrew-ytdwn
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
largeFilesHash () {
    cd ~/Github/LargeFiles
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
randomStuffHash () {
    cd ~/Github/RandomStuff
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
theAtticRealmHash () {
    cd ~/Github/TheAtticRealm
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}


makeDir () {
    cd ~/Downloads || exit
    dirName="GithubBackup_${now}"
    mkdir $dirName
    cd $dirName || exit
}


printHashes () {
    cd ~/Github/steepatticstairs.github.io
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    printf "${blue}steepatticstairs.github.io${nocolor}:${red} ${shortHash}${nocolor}\n"

    cd ~/Github/ytdwn
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    printf "${blue}ytdwn${nocolor}:${red} ${shortHash}${nocolor}\n"

    cd ~/Github/homebrew-ytdwn
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    printf "${blue}homebrew-ytdwn${nocolor}:${red} ${shortHash}${nocolor}\n"

    cd ~/Github/LargeFiles
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    printf "${blue}LargeFiles${nocolor}:${red} ${shortHash}${nocolor}\n"

    cd ~/Github/RandomStuff
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    printf "${blue}RandomStuff${nocolor}:${red} ${shortHash}${nocolor}\n"

    cd ~/Github/TheAtticRealm
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    printf "${blue}TheAtticRealm${nocolor}:${red} ${shortHash}${nocolor}\n"
}


echo ""
printf "${green}Up-to-date hashes:${nocolor}\n"
printHashes
echo ""
echo "In addition, would you like to download LargeFiles and TheAtticRealm, or neither?"
echo "BOTH / NO"
read seletion

if [[ $seletion == both ]]; then

myWebsiteHash
    wget -O "steepatticstairs.github.io_${now}_${shortHash}.zip" $myWebsiteURL
ytdwnHash
    wget -O "ytdwn_${now}_${shortHash}.zip" $ytdwnURL
homebrewytdwnHash
    wget -O "homebrew-ytdwn_${now}_${shortHash}.zip" $homebrewytdwnURL
largeFilesHash
    wget -O "LargeFiles_${now}_${shortHash}.zip" $largeFilesURL
theAtticRealmHash
    wget -O "TheAtticRealm_${now}_${shortHash}.zip" $theAtticRealmURL
randomStuffHash
    wget -O "RandomStuff_${now}_${shortHash}.zip" $randomStuffURL

elif [[ $seletion == no ]]; then

myWebsiteHash
    wget -O "steepatticstairs.github.io_${now}_${shortHash}.zip" $myWebsiteURL
ytdwnHash
    wget -O "ytdwn_${now}_${shortHash}.zip" $ytdwnURL
homebrewytdwnHash
    wget -O "homebrew-ytdwn_${now}_${shortHash}.zip" $homebrewytdwnURL
randomStuffHash
    wget -O "RandomStuff_${now}_${shortHash}.zip" $randomStuffURL

fi