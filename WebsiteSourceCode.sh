#!/bin/bash
# srccd-dw
shopt -s nocasematch

myWebsiteURL=https://codeload.github.com/SteepAtticStairs/steepatticstairs.github.io/zip/refs/heads/main
ytdwnURL=https://codeload.github.com/SteepAtticStairs/ytdwn/zip/refs/heads/main
homebrewytdwnURL=https://codeload.github.com/SteepAtticStairs/homebrew-ytdwn/zip/refs/heads/main
largeFilesURL=https://codeload.github.com/SteepAtticStairs/LargeFiles/zip/refs/heads/main
updateBrewURL=https://codeload.github.com/SteepAtticStairs/updateBrew/zip/refs/heads/main
randomStuffURL=https://codeload.github.com/SteepAtticStairs/RandomStuff/zip/refs/heads/main
zshThemesURL=https://codeload.github.com/SteepAtticStairs/ZSH-Themes/zip/refs/heads/main
theAtticRealmURL=https://codeload.github.com/SteepAtticStairs/TheAtticRealm/zip/refs/heads/main
now="$(date '+%m.%d.%Y')"

myWebsiteHash () {
    cd ~/Github/steepatticstairs.github.io
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
ytdwnHash () {
    cd ~/Github/ytdwn
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
homebrewytdwnHash () {
    cd ~/Github/homebrew-ytdwn
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
largeFilesHash () {
    cd ~/Github/LargeFiles
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
updateBrewHash () {
    cd ~/Github/updateBrew
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
randomStuffHash () {
    cd ~/Github/RandomStuff
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
zshThemesHash () {
    cd ~/Github/ZSH-Themes
    fullHash=$(git log -1 --format="%H" origin/main)
    shortHash=$(echo ${fullHash:0:7})
    makeDir
}
theAtticRealmHash () {
    cd ~/Github/TheAtticRealm
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