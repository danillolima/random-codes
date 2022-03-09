set nameIPV4="IPV4LOL"
set nameIPV6="IPV6LOL"
netsh advfirewall firewall delete rule name=%nameIPV4% >nul
netsh advfirewall firewall delete rule name=%nameIPV6% >nul

if errorlevel 1 (
    echo Adicionando !name!
  netsh advfirewall firewall add rule name=%nameIPV4% dir=out remoteip=172.65.212.1 protocol=TCP action=block
  netsh advfirewall firewall add rule name=%nameIPV6% dir=out remoteip=2606:4700:90:0:4813:607d:9c17:5972 protocol=TCP action=block

)


