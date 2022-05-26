# Begin
| Option | Conditions  |
| ------| -----------|
| OS     | Windows     |
| Physical        | Need phisical acces to make it work                 |
| sessions        | Need to have the sesisons unlocked to make it work  |
| executions time | between 10 and 20 second                            |
| AV not detect   | windows defender does not detect the actions        |

  
## What you will need
 - Bad usb or rubber ducky clone (optional)
 - VPS (virutal private server)
 - ps2exe 

## VPS setup
you need to set up your vps for retreave to the victim the executable

## How it Work 

### Rev-Shell
The rev shell is set by Ncat (taht is rename Win32_Lua.exe in this case)
In the vanilla versions the default locations is 
> C:\Windows\System32\drivers\wfd
A connextion is build between the victime and your VPS. 

### Persistence
After that the script whill apply persitence trought a shortcut of the rev-shel (Win32_Contrib.lua) in the shell:startup folder (the shortcut wil be hidden by default and does not display the windows when execute)

You can easily use other persistence like registery key modifications 

## NOTE 

D'ont forget to add the IP and port in the ps1 script and add the powershell command to the WHID cactus file. 