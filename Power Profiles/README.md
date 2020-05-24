## Power Profiles
`PowerProfiles.sh` gives multiple profiles (default, movie, installation) 
with different `screen-blank` and `sleep` times for AC and DC power.
`TogglePresentationMode.sh` enables and disables `screen-blank` and `sleep`
properties.


| Power Profiles  | Screen-Blank Time in minutes (DC/AC)  |Sleep Time in minutes (DC/AC) |
| :-------------  |:-------------------------------------:|:----------------------------:|
| **Default**     |                                 10/10 |                        10/60 |
| **Movie**       |                                 55/55 |                        60/60 |
| **Installation**|                                 10/10 |                        60/60 |

**Note:** These scripts are only applicable for `xfce4-power-manager` set as
default battery manager.


### Installation
Run the scripts to toggle Modes. Pass to script `reset` as arguement to reset 
the values back to default.
The command will look like `$ PowerProfiles.sh reset`.
You can also bind these scripts to a key for quick toggle.
