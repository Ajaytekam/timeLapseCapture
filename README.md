# timeLapsCapture  

* Simple time lapse video capture script.   
* Takes a picture every second and encode them into mp4 file.  

__Usage :__    

```   
bash capture.sh 
```  

__Requirements :__  

Install streamer and ffmpeg. 

```  
sudo apt install streamer ffmpeg -y
```  

Also required webcam. 

__Example :__    

```  
$ ./capture.sh

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
```  
