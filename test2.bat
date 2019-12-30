@echo off
color a
title cracking...
cls
:crash
echo cracking...
SET /A PASS1=100000-1
if %PASS1% == %password% goto end
if %PASS1% == 0 call crack_pass_test.bat
goto crash
:end
echo your password is %PASS1%
echo your real password is %password%
echo username is %RANDOM%^|%name%^|%RANDOM%
pause
cls
