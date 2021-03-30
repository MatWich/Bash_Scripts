#!/bin/bash
mkdir videos
mkdir music
mkdir images

imgpattern1='.jpg'
imgpattern2='.png'
videopattern1='.mov'
videopattern2='.mp4'
musicpattern1='.avi'
musicpattern2='.mp3'
logpattern='.log'

files=( * )
for eachfile in "${files[@]}"; do
	echo "$eachfile"
	if 	[[ "$eachfile" == *$imgpattern1* ]];	then
		mv $eachfile images/
	elif	[[ "$eachfile" == *$imgpattern2* ]];	then
		mv $eachfile images/
	elif	[[ "$eachfile" == *$videopattern1* ]];	then
		mv $eachfile videos/
	elif	[[ "$eachfile" == *"$videopattern2"* ]];	then 		
		mv $eachfile videos/
	elif	[[ "$eachfile" == *$musicpattern1* ]];	then
		mv $eachfile music/ 
	elif	[[ "$eachfile" == *$musicpattern2* ]];	then
		mv $eachfile music/
	elif	[[ "$eachfile" == *$logpattern* ]];	then
		rm -r $eachfile
	fi
done
