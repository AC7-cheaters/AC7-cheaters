#!/bin/bash 

time=$(date "+%Y-%m-%d %H:%M:%S")
echo $time

cheaters_ID=(76561198081430238 76561198839646162 76561198073103373 76561198209173436 76561198973679329 76561198026289985)
cheaters_Name=()

i=0
for cheater in ${cheaters_ID[*]}
do
	Name=`curl -L https://steamcommunity.com/profiles/$cheater |grep 'class="actual_persona_name"' |head -1 |awk -F'>|<' '{print $3}'`
	cheaters_Name[$i]=$Name
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

