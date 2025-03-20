@echo off
TITLE Scryper - Ultimate Network Multi-Tool
COLOR 0A
CLS

:: Main Menu
:menu
CLS
ECHO ======================================
ECHO          🌐 Scryper Network Tool 🌐
ECHO ======================================
ECHO [1] Create Account
ECHO [2] Login
ECHO [3] Exit
ECHO ======================================
SET /P choice=Select an option:

IF "%choice%"=="1" GOTO signup
IF "%choice%"=="2" GOTO login
IF "%choice%"=="3" EXIT

ECHO Invalid choice! Try again.
PAUSE
GOTO menu

:: Signup Process
:signup
CLS
ECHO ======================================
ECHO          Scryper - Create Account 
ECHO ======================================
SET /P username=Enter your Username:
SET /P password=Enter your Password:
SET /P email=Enter your Email for verification:

:: Save the email to a temporary file for Python script to read
echo %email% > temp_email.txt

:: Call Python script to send verification code to the user's email
ECHO Sending verification code...
python send_email.py

:: Ask the user to input the verification code
SET /P code=Enter the verification code you received:

:: Check if the entered code matches the one sent
SET code_valid=0
for /f "tokens=1,2" %%A in (verification_codes.txt) do (
    if "%%A"=="%email%" if "%%B"=="%code%" (
        SET code_valid=1
    )
)

:: If code is valid, create the account
if %code_valid%==1 (
    ECHO Account created successfully! You can now log in.
    SET /P account_type=Choose account type (free/paid/admin): 
    ECHO %username% %password% %account_type% >> users.txt
) else (
    ECHO Invalid verification code. Account creation failed.
)

PAUSE
GOTO menu

:: Login Process
:login
CLS
ECHO ======================================
ECHO          🔒 Scryper Login 🔒
ECHO ======================================
SET /P username=Enter Username:
SET /P password=Enter Password:

:: Check login credentials
SET login_success=0
for /f "tokens=1,2,3" %%A in (users.txt) do (
    if "%%A"=="%username%" if "%%B"=="%password%" (
        SET login_success=1
        SET account_status=%%C
    )
)

:: Validate login
if %login_success%==0 (
    ECHO Invalid username or password. Try again.
    PAUSE
    GOTO login
)

:: Show Tools After Successful Login
:tools_menu
CLS
ECHO ======================================
ECHO        🌐 Scryper Network Tools 🌐
ECHO ======================================
ECHO [1] Ping a Website or IP
ECHO [2] Get Your Public IP
ECHO [3] Track an IP Address
ECHO [4] Run Network Tools (Tracert, Nslookup)
IF "%account_status%"=="paid" ECHO [5] Fetch Social Media Info (TikTok, Instagram)
IF "%account_status%"=="admin" ECHO [6] Admin Panel
ECHO [7] Logout
ECHO [8] Exit
ECHO ======================================
SET /P choice=Select an option:

IF "%choice%"=="1" GOTO ping_tool
IF "%choice%"=="2" GOTO public_ip
IF "%choice%"=="3" GOTO ip_tracker
IF "%choice%"=="4" GOTO network_tools
IF "%choice%"=="5" GOTO social_media_info
IF "%choice%"=="6" GOTO admin_panel
IF "%choice%"=="7" GOTO menu
IF "%choice%"=="8" EXIT

ECHO Invalid choice! Try again.
PAUSE
GOTO tools_menu

:: Ping Tool
:ping_tool
CLS
ECHO ======================================
ECHO        🏓 Ping a Target
ECHO ======================================
SET /P target=Enter website or IP:
CLS
PING %target%
PAUSE
GOTO tools_menu

:: Public IP Tool
:public_ip
CLS
ECHO ======================================
ECHO        🌍 Your Public IP
ECHO ======================================
ECHO Fetching your public IP...
CURL -s ifconfig.me || ECHO "Error: curl not found"
ECHO.
PAUSE
GOTO tools_menu

:: IP Tracker Tool
:ip_tracker
CLS
ECHO ======================================
ECHO        🔍 IP Tracker
ECHO ======================================
SET /P target_ip=Enter IP address to track:
CLS
ECHO Fetching details...
CURL -s http://ip-api.com/json/%target_ip% | FINDSTR /I "query country region city isp org"
ECHO.
PAUSE
GOTO tools_menu

:: Network Tools Menu
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
IF "%net_choice%"=="3" GOTO tools_menu

ECHO Invalid choice! Try again.
PAUSE
GOTO network_tools

:: Traceroute Tool
:tracert_tool
CLS
ECHO ======================================
ECHO        🔀 Traceroute Tool
ECHO ======================================
SET /P trace_target=Enter website or IP to trace:
CLS
TRACERT %trace_target%
PAUSE
GOTO network_tools

:: DNS Lookup Tool
:nslookup_tool
CLS
ECHO ======================================
ECHO        🌐 DNS Lookup Tool
ECHO ======================================
SET /P dns_target=Enter domain to get DNS info:
CLS
NSLOOKUP %dns_target%
PAUSE
GOTO network_tools

:: Social Media Info Tool (For Paid Users Only)
:social_media_info
CLS
ECHO ======================================
ECHO        📱 Social Media Account Info
ECHO ======================================
ECHO [1] Fetch TikTok Account Info
ECHO [2] Fetch Instagram Account Info
ECHO [3] Return to Main Menu
ECHO ======================================
SET /P sm_choice=Select a social media platform:

IF "%sm_choice%"=="1" GOTO tiktok_info
IF "%sm_choice%"=="2" GOTO instagram_info
IF "%sm_choice%"=="3" GOTO tools_menu

CLS
ECHO Invalid choice! Try again.
PAUSE
GOTO social_media_info

:: Fetch TikTok Account Info (Using API)
:tiktok_info
CLS
ECHO ======================================
ECHO        🎵 Fetching TikTok Account Info
ECHO ======================================
SET /P tiktok_user=Enter TikTok Username:
CLS
:: Here you'd call the Python script or API for TikTok info.
ECHO Fetching TikTok data for user: %tiktok_user%
:: Example: python tiktok_fetch.py %tiktok_user%
ECHO (This would show follower count, following count, etc.)
PAUSE
GOTO social_media_info

:: Fetch Instagram Account Info (Using API)
:instagram_info
CLS
ECHO ======================================
ECHO        📸 Fetching Instagram Account Info
ECHO ======================================
SET /P instagram_user=Enter Instagram Username:
CLS
:: Here you'd call the Python script or API for Instagram info.
ECHO Fetching Instagram data for user: %instagram_user%
:: Example: python instagram_fetch.py %instagram_user%
ECHO (This would show follower count, following count, etc.)
PAUSE
GOTO social_media_info

:: Admin Panel (For Admin Users Only)
:admin_panel
CLS
ECHO ======================================
ECHO          🔑 Admin Panel
ECHO ======================================
ECHO [1] View All User Accounts
ECHO [2] Delete User Account
ECHO [3] Return to Main Menu
ECHO ======================================
SET /P admin_choice=Select an admin option:

IF "%admin_choice%"=="1" GOTO view_users
IF "%admin_choice%"=="2" GOTO delete_user
IF "%admin_choice%"=="3" GOTO tools_menu

ECHO Invalid choice! Try again.
PAUSE
GOTO admin_panel

:: View All User Accounts (Admin Only)
:view_users
CLS
ECHO ======================================
ECHO          User Accounts List
ECHO ======================================
TYPE users.txt
PAUSE
GOTO admin_panel

:: Delete User Account (Admin Only)
:delete_user
CLS
ECHO ======================================
ECHO          Delete User Account
ECHO ======================================
SET /P delete_username=Enter the username to delete:
SETlocal enabledelayedexpansion
for /f "tokens=1,2,3" %%A in (users.txt) do (
    if not "%%A"=="%delete_username%" (
        echo %%A %%B %%C >> temp_users.txt
    )
)
move /y temp_users.txt users.txt
ECHO User %delete_username% has been deleted.
PAUSE
GOTO admin_panel
