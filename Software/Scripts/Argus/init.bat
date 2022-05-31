::
:: Panoptes Operator | operator@panoptes.live
::
:: June 17, 2020 | May 27, 2022
::
:: ▲ Initialization for Panoptes
::

:: Clear terminal, Hide command prompt, Set Working directory, Name terminal window
CLS
@ECHO OFF
CD /D %~dp0
TITLE Argus Initialization

:: This pause allows you to exit if mistakenly opened
ECHO . . .
PAUSE
ECHO.


:1
::Start


TITLE Argus Panoptes Initialization


ECHO Naming System && ECHO.
powershell -command "Rename-Computer -NewName Panoptes"


:: Set Workgroup to ARGUS
ECHO Joining ARGUS Workgroup && ECHO.
powershell -command "& {Add-Computer -WorkGroupName "ARGUS"}"


:: Create Account
net user Po /ADD


:: Remove Powershell Execution Restrictions
ECHO Removing Powershell Execution Restrictions && ECHO.
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"


:: Set Network Connection to "Private'
ECHO Changing Network Connection to Private && ECHO.
powershell -command "Set-NetConnectionProfile -Name "Network" -NetworkCategory Private"


:: Install WinGet
:: Unnecessary on Win10 with all updates
ECHO Installing Winget && ECHO.
powershell -command "Add-AppxPackage -Path "A:\Software\Windows\System\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle""
:: Remove MSSTORE source from winget
ECHO Removing Microsoft Store source from winget
winget source remove msstore


::Remove MAX PATH limit
ECHO Removing MAX_PATH Limit && ECHO.
REG add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v LongPathsEnabled /t REG_DWORD /d 1


:: Sets ARGUS drive
ECHO Initializing Operator Skydrive && ECHO.
REG add HKCU\Environment /v ARGUS /t REG_SZ /d A:


:: Disable power menu on lock screen for increased security
ECHO Disabling Power Menu in Lock Screen && ECHO.
REG add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v shutdownwithoutlogon /t REG_DWORD /d 0


:: Enable Task Scheduler Logging
ECHO Enabling Task Schedule Logging && ECHO.
wevtutil set-log Microsoft-Windows-TaskScheduler/Operational /enabled:true


:: Restart Prompt
ECHO Please Restart Me


:: ~LEGACY CODE~
:: Pass off to next batch file
:: This allows for use of variables that have just been added
:: START /wait /b prereq.bat
:: ~LEGACY CODE~

:: DEV BREAK
ECHO DEV BREAK
PAUSE


:0
:: End
EXIT