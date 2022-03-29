#!/bin/bash

echo "What is the filepath of the file you wish to convert?"
read filePath

filePathName=${filePath%.*}

ffmpeg -i "$filePath" -map 0:0 -map 0:1 -c:a aac_at -ab 128k -strict -2 -async 1 -c:v copy -metadata creation_time=now -sn -y "$filePathName"~~~.mp4
