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
pseq=${settings[3]}
rtime=${settings[4]}
ticon=${settings[5]}

lastseq=$((pseq-1))
echo $$
if [[ "$ticon" == "true" ]]; then
    yad --notification --image="gtk-execute" --command="" --menu="Stop WorkTime ! killall yad|kill $$" --text="WorkTime" --kill-parent & disown
fi

for ((n=0;n<"$pseq";n++))
do
    zenity --notification --text "Work time!" && sleep $wtime
    if [[ "$rtime" == "true" ]]; then
        zenity --notification --text "Review time!" && sleep 1m
    fi

    if [[ "$n" != "$lastseq" ]]; then
       zenity --notification --text "Break time!" && sleep $btime
    fi
done
zenity --notification --text "Long break time!" && sleep $lbtime
