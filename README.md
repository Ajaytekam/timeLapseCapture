# timeLapsCapture  

* Simple time lapse video capture script.   
* Takes a picture every second and encode them into mp4 file.  

__Usage :__    

```  
./tlcapture.sh -h

  _______ _      _____            _
 |__   __| |    / ____|          | |
    | |  | |   | |     __ _ _ __ | |_ _   _ _ __ ___
    | |  | |   | |    / _` | '_ \| __| | | | '__/ _ \
    | |  | |___| |___| (_| | |_) | |_| |_| | | |  __/
    |_|  |______\_____\__,_| .__/ \__|\__,_|_|  \___|
                           | |
                           |_|  Version: 0.1

Usage : ./tlcapture.sh [-h] [-t] [DELAY_IN_SECONDS_PER_IMAGE]

Options:

  '-h' : Prints helps menu
  '-t' : Take picture in N seconds of delay (default is 1 sec)
         Supported values are: -t 5|10|20|30|40|50|60

Example :

        "./tlcapture "      - Takes pics at 1 sec of interval (default)
        "./tlcapture -t 5"  - Takes pics at 5 secs of interval
        "./tlcapture -t 10" - Takes pics at 10 secs of interval
        "./tlcapture -t 60" - Takes pics at 60 secs of interval
```    


__Requirements :__  

Install streamer and ffmpeg. 

```  
sudo apt install streamer ffmpeg -y
```  

Also required webcam. 

__Example :__    

```  
./tlcapture.sh -h

  _______ _      _____            _
 |__   __| |    / ____|          | |
    | |  | |   | |     __ _ _ __ | |_ _   _ _ __ ___
    | |  | |   | |    / _` | '_ \| __| | | | '__/ _ \
    | |  | |___| |___| (_| | |_) | |_| |_| | | |  __/
    |_|  |______\_____\__,_| .__/ \__|\__,_|_|  \___|
                           | |
                           |_|  Version: 0.1


[+] Storing Files on 17_Feb_2022-09-06-06..
[+] Press Ctrl+C to stop the recording..

files / video: JPEG (JFIF) / audio: none
^C^C - one moment please00s [0], a/v: -0.00s [0]
fifo max fill: audio 0/0, video 1/16, convert 1/16

[+] Press any to continue Encoding Process...
ffmpeg version 4.3.3-0+deb11u1 Copyright (c) 2000-2021 the FFmpeg developers
  libavdevice    58. 10.100 / 58. 10.100
  libavfilter     7. 85.100 /  7. 85.100
  libavresample   4.  0.  0 /  4.  0.  0
  libswscale      5.  7.100 /  5.  7.100
  libswresample   3.  7.100 /  3.  7.100
[libx264 @ 0x556f388b9e80] ref B L1: 90.1%  9.9%
[libx264 @ 0x556f388b9e80] kb/s:957.43

[+] Video encoding completed. '17_Feb_2022-09-06-06.mp4'  
[+] Delete Image Dir '17_Feb_2022-09-06-06'[y|n]:> y  
[+] Directory Deleted...   
[+] Done   
```    
