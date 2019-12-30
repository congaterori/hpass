:start
@echo off
title login
color a
cls
set /p name=enter your username: 
cls
set /p password=enter your password: 
cls
echo hello %name%
title cracking..
echo loading...
cls
echo cracking...
goto loop
:loop
echo %PASS%
SET /A PASS=%PASS%+1
if %PASS% == %password% goto done
if %PASS% == 999999 goto count
if %password% == "" goto error
goto loop
:count
echo %PASS2%
SET /A PASS1=99999999
set /A PASS2=%PASS1%-1
if %PASS2% == %password% goto finish
if %PASS2% == %PASS% goto loop
if %password% == "" goto error
goto count
:character
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
REM 0123456789
set /A so1=%so%-1
set pwd=
FOR /L %%b IN (0, 1, %so1%) DO (
SET /A rnd_num=!RANDOM! * 62 / 32768 + 1
for /F %%c in ('echo %%alfanum:~!rnd_num!^,1%%') do set pwd=!pwd!%%c
)

echo:%pwd%
if %pwd% == %password% goto done
if %password% == "" goto error
endlocal
goto character
:finish
echo your password is %PASS1%
echo your real password is %password%
echo username is %RANDOM%^|%name%^|%RANDOM%
pause
cls
goto start
:done
echo your password is %PASS%%pwd%
echo your real password is %password%
echo username is %RANDOM%^|%name%^|%RANDOM%
pause
cls
goto start
:error
echo ----------------------------------------------
echo                     ERROR                     
echo ----------------------------------------------
pause
cls
goto start