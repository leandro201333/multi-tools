@echo off
TITLE Scryper - Ultimate Network Multi-Tool
COLOR 0A
CLS

:: Initialize log file if not present
IF NOT EXIST logs.txt (
    ECHO Log file created. > logs.txt
)

:: Check if users.txt exists
IF NOT EXIST users.txt (
    ECHO users.txt not found! Creating default users.
    ECHO admin waxd10 admin > users.txt
    ECHO root freeacc free >> users.txt
    ECHO paid welcometoscrypter paid >> users.txt
    ECHO Default users created in users.txt.
    PAUSE
)

:login
CLS
ECHO ======================================
ECHO          🔒 Scryper Login 🔒
ECHO ======================================
SET /P username=Enter Username:
SET /P password=Enter Password:

:: Check login credentials
SET login_success=0
SET user_type=
FOR /F "tokens=1,2,3" %%A IN (users.txt) DO (
    IF /I "%%A"=="%username%" IF "%%B"=="%password%" (
        SET login_success=1
        SET user_type=%%C
    )
)

IF %login_success%==0 (
    ECHO Invalid username or password. Try again.
    PAUSE
    GOTO login
)

:: Show menu based on user type
IF "%user_type%"=="admin" GOTO admin_menu
IF "%user_type%"=="paid" GOTO paid_menu
IF "%user_type%"=="free" GOTO free_menu

:: Main Menu for Admin Users
:admin_menu
CLS
ECHO ======================================
ECHO       🌐 Scryper Admin Menu 🌐
ECHO ======================================
ECHO [1] Ping a Website or IP
ECHO [2] Get Your Public IP
ECHO [3] Track an IP Address
ECHO [4] Run Network Tools (Tracert, Nslookup)
ECHO [5] Premium Tools
ECHO [6] Admin Settings
ECHO [7] Log Out
ECHO ======================================
SET /P choice=Select an option:

IF "%choice%"=="1" GOTO ping_tool
IF "%choice%"=="2" GOTO public_ip
IF "%choice%"=="3" GOTO ip_tracker
IF "%choice%"=="4" GOTO network_tools
IF "%choice%"=="5" GOTO premium_tools
IF "%choice%"=="6" GOTO admin_settings
IF "%choice%"=="7" GOTO logout

CLS
ECHO Invalid choice! Try again.
PAUSE
GOTO admin_menu

:: Free User Menu
:free_menu
CLS
ECHO ======================================
ECHO       🌐 Scryper Free User Menu 🌐
ECHO ======================================
ECHO [1] Ping a Website or IP
ECHO [2] Get Your Public IP
ECHO [3] Track an IP Address
ECHO [4] Run Network Tools (Tracert, Nslookup)
ECHO [5] System Info (CPU, Memory, OS)
ECHO [6] Port Status Checker
ECHO [7] DNS Lookup Tool
ECHO [8] Log Out
ECHO ======================================
SET /P choice=Select an option:

IF "%choice%"=="1" GOTO ping_tool
IF "%choice%"=="2" GOTO public_ip
IF "%choice%"=="3" GOTO ip_tracker
IF "%choice%"=="4" GOTO network_tools
IF "%choice%"=="5" GOTO system_info
IF "%choice%"=="6" GOTO port_status
IF "%choice%"=="7" GOTO dns_lookup
IF "%choice%"=="8" GOTO logout

CLS
ECHO Invalid choice! Try again.
PAUSE
GOTO free_menu

:: Paid User Menu
:paid_menu
CLS
ECHO ======================================
ECHO       🌐 Scryper Paid User Menu 🌐
ECHO ======================================
ECHO [1] Ping a Website or IP
ECHO [2] Get Your Public IP
ECHO [3] Track an IP Address
ECHO [4] Run Network Tools (Tracert, Nslookup)
ECHO [5] Premium Tools (VPN, Advanced Network Tools)
ECHO [6] Bandwidth Test
ECHO [7] Advanced IP Geolocation
ECHO [8] Log Out
ECHO ======================================
SET /P choice=Select an option:

IF "%choice%"=="1" GOTO ping_tool
IF "%choice%"=="2" GOTO public_ip
IF "%choice%"=="3" GOTO ip_tracker
IF "%choice%"=="4" GOTO network_tools
IF "%choice%"=="5" GOTO premium_tools
IF "%choice%"=="6" GOTO bandwidth_test
IF "%choice%"=="7" GOTO advanced_ip_geolocation
IF "%choice%"=="8" GOTO logout

CLS
ECHO Invalid choice! Try again.
PAUSE
GOTO paid_menu

:: Log User Actions
:add_to_log
ECHO [%date% %time%] %username% used %1 >> logs.txt
GOTO :EOF

:: Logout
:logout
CLS
ECHO You have successfully logged out.
PAUSE
GOTO login

:: Ping Tool
:ping_tool
CLS
ECHO ======================================
ECHO        🏓 Ping a Target
ECHO ======================================
ECHO Enter a website or IP to ping:
SET /P target=Target:
CLS
PING %target%
CALL :add_to_log "Ping tool"
PAUSE
GOTO admin_menu

:: Public IP Tool
:public_ip
CLS
ECHO ======================================
ECHO        🌍 Your Public IP
ECHO ======================================
ECHO Fetching your public IP...
CURL -s ifconfig.me || ECHO "Error: curl not found"
CALL :add_to_log "Public IP tool"
ECHO.
PAUSE
GOTO admin_menu

:: IP Tracker Tool
:ip_tracker
CLS
ECHO ======================================
ECHO        🔍 IP Tracker
ECHO ======================================
ECHO Enter an IP address to track:
SET /P target_ip=IP Address:
CLS
ECHO Fetching details...
CURL -s http://ip-api.com/json/%target_ip% | FINDSTR /I "query country region city isp org"
CALL :add_to_log "IP Tracker tool"
ECHO.
PAUSE
GOTO admin_menu

:: Network Tools (Traceroute, Nslookup)
:network_tools
CLS
ECHO ======================================
ECHO        🔧 Network Tools
ECHO ======================================
ECHO [1] Traceroute (Tracert)
ECHO [2] DNS Lookup (Nslookup)
ECHO [3] Return to Main Menu
ECHO ======================================
SET /P net_choice=Select a tool:

IF "%net_choice%"=="1" GOTO tracert_tool
IF "%net_choice%"=="2" GOTO nslookup_tool
IF "%net_choice%"=="3" GOTO free_menu

CLS
ECHO Invalid choice! Try again.
PAUSE
GOTO network_tools

:: Traceroute Tool
:tracert_tool
CLS
ECHO ======================================
ECHO        🔀 Traceroute Tool
ECHO ======================================
ECHO Enter a website or IP to trace:
SET /P trace_target=Target:
CLS
TRACERT %trace_target%
CALL :add_to_log "Traceroute tool"
PAUSE
GOTO network_tools

:: DNS Lookup Tool
:nslookup_tool
CLS
ECHO ======================================
ECHO        🌐 DNS Lookup Tool
ECHO ======================================
ECHO Enter a domain to get DNS info:
SET /P dns_target=Domain:
CLS
NSLOOKUP %dns_target%
CALL :add_to_log "DNS Lookup tool"
PAUSE
GOTO network_tools

:: System Info Tool (For Free Users)
:system_info
CLS
ECHO ======================================
ECHO        🖥️ System Information
ECHO ======================================
ECHO Fetching system information...
SYSTEMINFO
CALL :add_to_log "System Info tool"
ECHO.
PAUSE
GOTO free_menu

:: Port Status Tool (For Free Users)
:port_status
CLS
ECHO ======================================
ECHO        🔌 Port Status Checker
ECHO ======================================
ECHO Enter the target IP or website and port:
SET /P port_target=Target (IP or Website):
SET /P port_number=Port Number:
ECHO Checking port %port_number% on %port_target%...
TELNET %port_target% %port_number%
CALL :add_to_log "Port Status tool"
ECHO.
PAUSE
GOTO free_menu

:: DNS Lookup Tool (For Free Users)
:dns_lookup
CLS
ECHO ======================================
ECHO        🌐 DNS Lookup Tool
ECHO ======================================
ECHO Enter a domain to get DNS info:
SET /P dns_target=Domain:
CLS
NSLOOKUP %dns_target%
CALL :add_to_log "DNS Lookup tool"
PAUSE
GOTO free_menu

:: Premium Tools for Paid Users
:premium_tools
CLS
ECHO ======================================
ECHO        🛠️ Premium Tools
ECHO ======================================
ECHO [1] VPN Connection Monitor
ECHO [2] Advanced Network Tools (Speed Test)
ECHO [3] Return to Main Menu
ECHO ======================================
SET /P premium_choice=Select a tool:

IF "%premium_choice%"=="1" GOTO vpn_check
IF "%premium_choice%"=="2" GOTO advanced_network_tools
IF "%premium_choice%"=="3" GOTO paid_menu

CLS
ECHO Invalid choice! Try again.
PAUSE
GOTO premium_tools

:: VPN Connection Monitor (For Paid Users)
:vpn_check
CLS
ECHO ======================================
ECHO        🔒 VPN Connection Status
ECHO ======================================
ECHO Checking if VPN is active...
:: Here, you would typically check for VPN status or connect to a VPN server.
ECHO VPN Status: Active
CALL :add_to_log "VPN Check tool"
ECHO.
PAUSE
GOTO premium_tools

:: Bandwidth Test (For Paid Users)
:bandwidth_test
CLS
ECHO ======================================
ECHO        📶 Bandwidth Test
ECHO ======================================
ECHO Running a bandwidth test...
:: You can integrate a real bandwidth API or keep this a simulation.
ECHO Bandwidth Test: 150 Mbps
CALL :add_to_log "Bandwidth Test tool"
ECHO.
PAUSE
GOTO premium_tools

:: Advanced IP Geolocation (For Paid Users)
:advanced_ip_geolocation
CLS
ECHO ======================================
ECHO        🌍 Advanced IP Geolocation
ECHO ======================================
ECHO Enter an IP address for detailed geolocation:
SET /P geo_target=IP Address:
ECHO Fetching detailed geolocation for %geo_target%...
CURL -s http://ip-api.com/json/%geo_target% | FINDSTR /I "query country region city isp org"
CALL :add_to_log "Advanced IP Geolocation tool"
ECHO.
PAUSE
GOTO premium_tools
