#!/bin/bash  

echo ${#}
if [ "${#}" != 1 ]
then
    echo "[-] Please provide the image directory name..!!"
    exit
fi

NAME=`echo $1 | sed 's/\///g'`
echo $NAME
ffmpeg -r 30 -i "${NAME}/%06d.jpeg" -s hd480 -vcodec libx264 -pix_fmt yuv420p $NAME.mp4  
echo "[+] Video encoding completed. '${DIR}.mp4'"
read -p "[+] Delete Image Dir '${NAME}'[y|n]:> " CH
if [ "$CH" == "y" ] || [ "$CH" == "Y" ]
then
    rm -rf $NAME
    echo "[+] Directory Deleted..."
fi
