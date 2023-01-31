#!/bin/bash

config=".config"
settings=()
while read -r line
do
    if [[ "$line" != *#* ]]; then
        settings+=("${line#*: }")
    fi
done < "$config"

wtime=${settings[0]}
btime=${settings[1]}
lbtime=${settings[2]}
rtime=${settings[3]}
ticon=${settings[4]}


echo "$rtime"
yad --notification --image="gtk-execute" --command="" --menu="Stop WorkTime ! killall yad && " --text="WorkTime"

# for ((n=0;n<3;n++))
# do
#
#     sleep $wtime && zenity --notification --text "Work time!" && disown
#     if [[ "$rtime" == "true" ]]; then
#
#     fi
#     sleep $wtime && zenity --notification --text "Work time!" && disown
#     sleep $wtime && zenity --notification --text "Work time!" && disown
# done
