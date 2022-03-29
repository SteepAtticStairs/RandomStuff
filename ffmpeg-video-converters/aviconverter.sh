#!/bin/bash

echo "What is the filepath of the file you wish to convert?"
read filePath

filePathName=${filePath%.*}

ffmpeg -i "$filePath" -preset ultrafast "$filePathName".mp4