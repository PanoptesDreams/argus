::
:: Argus Operator | help@panoptes.live
::
:: July 15, 1990 | August 22, 1996
::
:: Example BATCH file
:: Left Date - Document Created
:: Right Date - Document Updated
::


:: Clear terminal, Hide working directory, Set working directory to current, Name terminal window
CLS
@ECHO OFF
CD /D %~dp0
TITLE Template BAT


:1
:: Start


ECHO HELLO BAT!


:: Pauses CMD and waits for button press to continue
PAUSE


:0
:: Tells CMD to Exit
EXIT