#!/bin/bash
export BITRATE="5000k"
export SAMPLERATE="48000"
source ./streamKey.env
ffmpeg -loglevel warning -re -stream_loop -1 -i stream720p25.mp4 -codec:v libx264 -pix_fmt yuv420p -preset veryfast -b:v $BITRATE -g 50.0 -codec:a aac -b:a 128k -ar $SAMPLERATE -maxrate $BITRATE -bufsize 4500k -strict experimental -f flv "rtmp://b.rtmp.youtube.com/live2?backup=1/$STREAMKEY"