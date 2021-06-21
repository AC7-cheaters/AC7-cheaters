#!/bin/bash 

time=$(date "+%Y-%m-%d %H:%M:%S")
echo $time

cheaters_ID=(76561198081430238 76561199048027117 76561198107896591 76561198938976695 76561198839646162 76561198073103373 76561198209173436 76561198973679329 76561198026289985 76561199070000800 76561199086244180 76561198084874424 76561198108197134 76561198407886594 76561198101337488 76561198851216499 76561199066388594 76561198078057512 76561198076137075 76561199032447430 76561199028490431 76561198445457868 76561198368034387 76561199146745510)
cheaters_Name=()

i=0
for cheater in ${cheaters_ID[*]}
do
	Name=`curl -L https://steamcommunity.com/profiles/$cheater |grep 'class="actual_persona_name"' |head -1 |awk -F'>|<' '{print $3}'`
	cheaters_Name[$i]=${Name/|/&#124;}
	let 'i++'
done
echo ${cheaters_Name[*]}

echo '# AC7 cheaters

| name | steam URL |
| ------ | ------ |' > README.md

j=0
while (($j<i))
do
	echo '| '${cheaters_Name[$j]}' | https://steamcommunity.com/profiles/'${cheaters_ID[$j]}' |' >> README.md
	let 'j++'
done

