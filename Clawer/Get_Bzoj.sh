#!/bin/bash

read bgn <./begin.txt
read end <./end.txt
pid=$bgn
path="http://www.lydsy.com/JudgeOnline/show.php?id="

while [ $pid -le $end ]; do
	echo "-------------Getting show:$pid-------------"
	wget -m -k -e robots=off -A="show.php?id="$pid",show.php?id="$pid".tmp,show.php?id="$pid".tmp.html,png,jpg,gif,webp,bmp,pdf,rar,zip,7z,txt,doc,docx,ppt,pptx" --reject="logo.png" --load-cookies="./cookies.txt" $path$pid
	mv "./www.lydsy.com/JudgeOnline/show.php?id="$pid".tmp" "./www.lydsy.com/JudgeOnline/"$pid".html"
	echo $pid"Done."
	let pid=pid+1
	sleep 0.3
done

echo "Problem download completed!"
