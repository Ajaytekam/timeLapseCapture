#!/bin/bash  

## Color code
YB='\033[1;33m';CY='\033[1;36m';ND='\033[0m';

Banner() {

cat << "EOF"
  _______ _      _____            _                  
 |__   __| |    / ____|          | |                 
    | |  | |   | |     __ _ _ __ | |_ _   _ _ __ ___ 
    | |  | |   | |    / _` | '_ \| __| | | | '__/ _ \
    | |  | |___| |___| (_| | |_) | |_| |_| | | |  __/
    |_|  |______\_____\__,_| .__/ \__|\__,_|_|  \___|
                           | |                       
                           |_|  Version: 0.1
EOF
                           
}

Help() {

cat << "EOF"

Usage : ./${9} [-h] [-t] [DELAY_IN_SECONDS_PER_IMAGE]

Options: 

  '-h' : Prints helps menu
  '-t' : Take picture in N seconds of delay (default is 1 sec)
         Supported values are: -t 5|10|20|30|40|50|60

Example : 

	"./tlcapture "      - Takes pics at 1 sec of interval (default)
	"./tlcapture -t 5"  - Takes pics at 5 secs of interval
	"./tlcapture -t 10" - Takes pics at 10 secs of interval
	"./tlcapture -t 60" - Takes pics at 60 secs of interval 
EOF

}

encode() {
    ffmpeg -r 30 -i "${1}/%06d.jpeg" -s hd480 -vcodec libx264 -pix_fmt yuv420p $1.mp4
}


## Main Function
if [[ "${#}" == 2 && "$1" == "-t" ]]
then
    SEC=$2
    SEC=$((SEC*3))
    pre=`awk -vn=$SEC 'BEGIN{print(1/n)}'`
    PSF=`printf "%.3f\n" $pre`
elif [[ "${#}" == 1 && "$1" == "-h" ]]
then
    Banner
	Help
    exit
else
    PSF=1
fi
Banner
DATE=`date | awk '{print $2"_"$3"_"$4}'`
TIME=`date | awk '{print $5}' | tr ':' '-'`  
DIR=$DATE-$TIME
mkdir $DIR 
echo
echo -e "${YB}[+]${ND} ${CY}Storing Files on folder ${DIR}${ND}"
echo -e "${YB}[+]${ND} ${CY}Press Ctrl+C to stop the recording..${ND}"
echo
streamer -o $DIR/000000.jpeg -s 300x200 -j 100 -t 60000 -r $PSF
echo
echo
echo -e "${YB}[+]${ND} ${CY}Recording procss successfully stoped.${ND}"
NOF=`ls $DIR |wc -l`
echo -e "${YB}[+]${ND} ${CY}Number of frame captured : $NOF.${ND}"
echo -e "${YB}[+]${ND} ${CY}Press any key to continue Encoding Process...${ND}"
read
encode $DIR 
echo
echo
echo -e "${YB}[+]${ND} ${CY}Video encoding completed. '${DIR}.mp4'${ND}"
read -p "[+] Delete Image Dir '${DIR}'[y|n]:> " CH

if [ "$CH" == "y" ] || [ "$CH" == "Y" ]
then
    rm -rf $DIR
    echo -e "${YB}[+]${ND} ${CY}Directory Deleted...${ND}"
    echo -e "${YB}[+]${ND} ${CY}Done...${ND}"
fi
