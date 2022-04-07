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
largeFilesURL=https://codeload.github.com/SteepAtticStairs/largefiles/zip/refs/heads/main
randomStuffURL=https://codeload.github.com/SteepAtticStairs/RandomStuff/zip/refs/heads/main
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

    cd ~/Github/largefiles
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    printf "${blue}largefiles${nocolor}:${red} ${shortHash}${nocolor}\n"

    cd ~/Github/RandomStuff
    git fetch && git pull > /dev/null 2>&1
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    printf "${blue}RandomStuff${nocolor}:${red} ${shortHash}${nocolor}\n"
}


echo ""
printf "${green}Up-to-date hashes:${nocolor}\n"
printHashes
echo ""
echo "In addition, would you like to download LargeFiles, or not?"
echo "YES / NO"
read seletion

if [[ $seletion == yes ]]; then

myWebsiteHash
    wget -O "steepatticstairs.github.io_${now}_${shortHash}.zip" $myWebsiteURL
ytdwnHash
    wget -O "ytdwn_${now}_${shortHash}.zip" $ytdwnURL
largeFilesHash
    wget -O "largefiles_${now}_${shortHash}.zip" $largeFilesURL
randomStuffHash
    wget -O "RandomStuff_${now}_${shortHash}.zip" $randomStuffURL

elif [[ $seletion == no ]]; then

myWebsiteHash
    wget -O "steepatticstairs.github.io_${now}_${shortHash}.zip" $myWebsiteURL
ytdwnHash
    wget -O "ytdwn_${now}_${shortHash}.zip" $ytdwnURL
randomStuffHash
    wget -O "RandomStuff_${now}_${shortHash}.zip" $randomStuffURL

fi