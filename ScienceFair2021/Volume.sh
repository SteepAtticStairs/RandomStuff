bold=$(tput bold) # bold text
normal=$(tput sgr0) # normal text
CYAN='\033[0;36m' # cyan text
BLUE='\033[0;34m' # blue text
GREEN='\033[0;32m' # green text
RED='\033[0;31m' # red text
NC='\033[0m' # no color text (default)

echo "What is the file path of the audio file that you want to analyze?"
read audioFilePath

INITSTAT=$((sox $audioFilePath -n stat) 2>&1)

lastSix=${INITSTAT: -6}

echo " "
echo "${bold}$The volume adjustment metric for your audio file is: \n(The lower the number is, the higher the volume is)${normal}"
echo "${RED}${bold}$lastSix${NC}${normal}"
echo " "