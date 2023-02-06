# WorkTime
Linux console application for pomodoro technique 

## Description
WorkTime uses pomodoro technique to create notifications (both visual and sounds) to help you manage your work and break time to improve your efficiency.


## Prerequires for WorkTime
```
zenity [Required!] - For notifications (should be preinstalled in your distro)
pulseaudio [Optional] - For sound notifications using built-in sounds
```

WorkTime uses sounds from /usr/share/sounds/freedesktop/stereo/ directory, especially message.oga and complete.oga
If those files aren't present WorkTime won't play any sound on the change of work phase.

## Instalation

Download and unzip files, then go to the folder and launch 'installer' file using following command:
```
sudo sh installer
```
The installer copies neccessery files into /opt/worktime directory.

### Adding aliases for Worktime
In ~/.bashrc add following lines after installing the program to use aliases (requires system restart)
```
#-------------------------------------------
# WorkTime
export PATH=$PATH:/opt/worktime
alias wt='sh worktime.sh'
alias worktime='sh worktime.sh'
```

## Usage

After installation and adding aliases you can start WorkTime by following command
```
worktime [number of pomodoro cycles (default: 6)]
or
wt [number of pomodoro cycles]
```
It's also recommended to disown the process to make it work in the background.
For example:
```
wt 5 & disown
```
If you want to end the program early, you can stop it by right-clicking it's icon in icon tray and choosing 'Stop WorkTime'
![worktime_icontray](https://user-images.githubusercontent.com/65954097/216964192-34ee23af-b4fe-4698-8d29-43b2d4e06da7.png)



### Configuration
You can modify the length of certain pomodoro phases and other parameters by modifying the .config stored in /opt/worktime/
