#!/bin/bash
end () {
    zenity --notification --text "END OF WORK!" & disown
    if [ -f /usr/share/sounds/freedesktop/stereo/complete.oga ]; then
        paplay /usr/share/sounds/freedesktop/stereo/complete.oga
    fi
    killall yad
    kill $$
}

sound () {
    if [ -f /usr/share/sounds/freedesktop/stereo/message.oga ]; then
        paplay /usr/share/sounds/freedesktop/stereo/message.oga
    fi
}


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
arg1=${1:-6}

lastseq=$((pseq-1))


if [[ "$ticon" == "true" ]]; then
    yad --notification --image="clock" --command="" --menu="Stop WorkTime ! kill -SIGTERM $$ yad" --text="WorkTime" & disown
fi

while :
do
    for ((n=0;n<"$pseq";n++))
    do
        zenity --notification --text "Work time!" & sound & sleep $wtime
        arg1=$((arg1-1))
        if [[ "$arg1" == "0" ]]; then
            end
        fi


        if [[ "$rtime" == "true" ]]; then
            zenity --notification --text "Review time!" & sound & sleep 1m
        fi

        if [[ "$n" != "$lastseq" ]]; then
        zenity --notification --text "Break time!" & sound & sleep $btime
        fi
    done
    zenity --notification --text "Long break time!" & sound & sleep $lbtime
done
