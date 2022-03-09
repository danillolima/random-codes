@echo off

net SESSION 1>nul 2>nul
if %errorlevel% NEQ 0 (
  echo Por favor rode esse bat como administrador ou crie um atalho que execute ele com privilegios de administrador. 
  goto end
)

set nameIPV4="IPV4LOL"
set nameIPV6="IPV6LOL"
netsh advfirewall firewall delete rule name=%nameIPV4% >nul
netsh advfirewall firewall delete rule name=%nameIPV6% >nul

if errorlevel 1 (
  echo Adicionando regras %nameIPV4% e %nameIPV6%, logo mais seu LOL ficara com chat offline.
  timeout /t 15
  netsh advfirewall firewall add rule name=%nameIPV4% dir=out remoteip=172.65.212.1 protocol=TCP action=block
  netsh advfirewall firewall add rule name=%nameIPV6% dir=out remoteip=2606:4700:90:0:4813:607d:9c17:5972 protocol=TCP action=block
  goto success
)

:end
timeout /t 45
:success
