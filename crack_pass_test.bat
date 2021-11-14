:start
@echo off
title login
color a
cls
set /A PASS1=99999999
set /p name=enter your username: 
cls
set /p password=enter your password: 
cls
echo hello %name%
title cracking..
echo loading...
cls
echo cracking...
set /p hello=(number/letter)Type n to number or type l to letter: 
if %hello% == n goto loop
goto number1
:loop
SET /A PASS=%PASS%+1
echo %PASS%
if %PASS% == %password% goto done
if %PASS% == 999999 goto count
if %password% == "" goto error
goto loop
:count
set /A PASS1=%PASS1%-1
echo %PASS1%
if %PASS1% == %password% goto finish
if %PASS1% == %PASS% goto loop
if %password% == "" goto error
goto count
:number1
set /p so=[how many character in password] 
goto character
:character
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789*@"'.,:;+-_][}{)(!~`
set /A so1=%so%-1
set pwd=
FOR /L %%b IN (0, 1, %so1%) DO (
SET /A rnd_num=!RANDOM! * 62 / 32768 + 1
for /F %%c in ('echo:%%alfanum:~!rnd_num!^,1%%') do set pwd=!pwd!%%c
)

echo:%pwd%
if %pwd% == %password% goto done
if %password% == "" goto error
endlocal
goto character
:finish
start C:\Windows\Media\Alarm02.wav
echo your password is %PASS1%
echo your real password is %password%
echo username is %RANDOM%^|%name%^|%RANDOM%
pause
cls
goto start
:done
start C:\Windows\Media\Alarm02.wav
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
