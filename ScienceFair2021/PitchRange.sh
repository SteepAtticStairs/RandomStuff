bold=$(tput bold) # bold text
normal=$(tput sgr0) # normal text
CYAN='\033[0;36m' # cyan text
BLUE='\033[0;34m' # blue text
GREEN='\033[0;32m' # green text
RED='\033[0;31m' # red text
NC='\033[0m' # no color text (default)

echo "Is the audio file you want to analyze in the mp3 format, or in the wav format?"
read fileFormat

if [ $fileFormat = wav ] || [ $fileFormat = Wav ] || [ $fileFormat = WAV ]
then
    echo "Enter the file path of the audio file:"
    read audioFilePath

    cd Downloads

    rm -f audiofiletest.mid

    waon -i $audioFilePath -o audiofiletest.mid

    pythonOutput1=`/Users/andrewlawlor/Downloads/ScienceFairStuff2021/midi-probe.py audiofiletest.mid`
    pythonOutput2=`echo $pythonOutput1 | tr -d '[]'`
    echo $pythonOutput2

    #smallest number
    SMALL=`echo $pythonOutput2 | grep -oE '[0-9]+' | sort -n | head -n 1`

    #largest number
    LARGE=`echo $pythonOutput2 | grep -oE '[0-9]+' | sort -n | tail -n 1`

    DIFFERENCE=`expr $LARGE - $SMALL`
    echo " "
    echo ${bold}"The range (difference between the highest and lowest note) of your MIDI file is:"${normal}
    echo ${RED}${bold}$DIFFERENCE${NC}${normal}
    echo " "

fi

if [ $fileFormat = mp3 ] || [ $fileFormat = Mp3 ] || [ $fileFormat = MP3 ]
then
    echo "Enter the file path of the audio file:"
    read audioFilePath

    cd Downloads

    rm -f audiofiletest.mid
    rm -f test123.wav

    sox $audioFilePath test123.wav

    waon -i test123.wav -o audiofiletest.mid

    pythonOutput1=`/Users/andrewlawlor/Downloads/ScienceFairStuff2021/midi-probe.py audiofiletest.mid`
    pythonOutput2=`echo $pythonOutput1 | tr -d '[]'`
    echo $pythonOutput2

    #smallest number
    SMALL=`echo $pythonOutput2 | grep -oE '[0-9]+' | sort -n | head -n 1`

    #largest number
    LARGE=`echo $pythonOutput2 | grep -oE '[0-9]+' | sort -n | tail -n 1`

    DIFFERENCE=`expr $LARGE - $SMALL`
    echo " "
    echo "${bold}The range (difference between the highest and lowest note) of your MIDI file is:${normal}"
    echo "${RED}${bold}$DIFFERENCE${NC}${normal}"
    echo " "

fi