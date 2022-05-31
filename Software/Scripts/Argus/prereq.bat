::
:: Panoptes Operator | operator@panoptes.live
::
:: June 17, 2020 | May 27, 2022
::
:: ▲ Install prerequisite software
::

:: Start - Chained from 'init.bat'


TITLE Argus Panoptes Initialization - Prerequisite

:: Powershell
ECHO Installing Powershell
winget install Microsoft.PowerShell

:: DirectX
ECHO Installing DirectX
START /wait "%ARGUS%\Software\Development\DirectX\DXSETUP.exe /silent"
ECHO DONE!


EXIT /b

::Install Java Runtime Environment

::Install Pyhton

::Install MS Visual C Redists

::Restore Windows Utils
::start /wait win_utils.bat

::Pass off to next batch file
::
:: start user_customs.bat