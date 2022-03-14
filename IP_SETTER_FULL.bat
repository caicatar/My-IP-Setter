@echo off
cls
echo Choose: 
echo [A] Set Static IP 
echo [B] Set DHCP 

:choice 
SET /P C=[A,B]? 
if [%C%]==[A] goto A
if [%C%]==[B] goto B
goto choice 

:A 
@echo off 
echo ===============================================
echo Please enter Static IP Address Information
echo ===============================================
echo Interface: ( Tip: Add double quote "" for long names )
set /p Interface=
echo Static IP Address: 
set /p IP_Addr=
echo Default Gateway: 
set /p D_Gate=
echo Subnet Mask: 
set /p Sub_Mask=
echo ===============================================
echo Setting Static IP Information
echo ===============================================
netsh interface ip set address name=%Interface% static %IP_Addr% %Sub_Mask% %D_Gate% 
netsh int ip show config 
pause 
goto end

:B 
@ECHO OFF
echo Interface: ( Tip: Add double quote "" for long names )
set /p Interface=
echo ===============================================
ECHO Resetting IP Address and Subnet Mask For DHCP 
echo ===============================================
netsh int ip set address name = %Interface% source = dhcp
ipconfig /renew
echo ===============================================
ECHO Here are the new settings for %computername%: 
echo ===============================================
netsh int ip show config

pause 
goto end 

:end
