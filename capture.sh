#!/bin/bash  

encode() {
    ffmpeg -r 30 -i "${1}/%06d.jpeg" -s hd480 -vcodec libx264 -pix_fmt yuv420p $1.mp4
}

DATE=`date | awk '{print $2"_"$3"_"$4}'`
TIME=`date | awk '{print $5}' | tr ':' '-'`  
DIR=$DATE-$TIME
mkdir $DIR 
echo "[+] Storing Files on ${DIR}.."
echo "[+] Press Ctrl+C to stop the recording.."
echo
streamer -o $DIR/000000.jpeg -s 300x200 -j 100 -t 2000 -r 1
echo
echo
read -p "[+] Press any to continue Encoding Process..."
encode $DIR 
echo
echo
echo "[+] Video encoding completed. '${DIR}.mp4'"
read -p "[+] Delete Image Dir '${DIR}'[y|n]:> " CH
if [ "$CH" == "y" ] || [ "$CH" == "Y" ]
then
    rm -rf $DIR
    echo "Directory Deleted..."
fi
