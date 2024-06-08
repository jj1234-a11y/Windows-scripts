@echo off
echo Resetting Winsock Catalog...
netsh winsock reset

echo.
echo Resetting TCP/IP stack...
netsh int ip reset

echo.
echo Flushing DNS resolver cache...
ipconfig /flushdns

echo.
echo Releasing IP address...
ipconfig /release

echo.
echo Renewing IP address...
ipconfig /renew

echo.
echo Resetting network adapter...
netsh interface reset all

echo.
echo Restarting network services...
netsh advfirewall reset
netsh int ipv4 reset
netsh int ipv6 reset
netsh int tcp reset
netsh int teredo reset

echo.
echo Network reset complete.

pause
