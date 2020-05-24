## Critical Battery Action
Perform Action (Sleep, Shutdown, Hibernate, HybridSleep, Restart) when battery reaches specified threshold. 
When Battery level is at low threshold, a notification is sent to user alerting that battery is low.
When Battery level is at critical threshold, user is given backup time (default: 20sec) to plugin the charger. 
If charger is not plugged in within backup time, the critical action is performed. 
You can change critical action and other default values in the script file `CriticalBatterySleep.sh`


### Installation
1. Save `CriticalBatterySleep.sh` and `CriticalBatterySleep.txt` to the directiory `~/.script/` or `/home/username/.script/`. 
The final path will look like `~/.script/CriticalBatterySleep.sh` and `~/.script/CriticalBatterySleep.txt`.

2. On the terminal, run command `crontab -e` and paste the content of `crontab.txt` to the file. 
Make sure crontab deamon `crond` is running in the background. For more details, check [Cron - ArchWiki](https://wiki.archlinux.org/index.php/cron)
