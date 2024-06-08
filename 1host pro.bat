@echo off
:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion


:: Define the URL of the new hosts file
set "url=https://o0.pages.dev/Pro/hosts.win"

:: Define the path of the current hosts file
set "hostsPath=%windir%\System32\drivers\etc\hosts"

:: Define the path of the temporary file
set "tempFile=%temp%\hosts.new"

:: Download the new hosts file
powershell -Command "(New-Object Net.WebClient).DownloadFile('%url%', '%tempFile%')"

:: Check if the download was successful
if not exist "%tempFile%" (
    echo Failed to download the new hosts file.
    exit /b 1
)

:: Backup the current hosts file
copy /y "%hostsPath%" "%hostsPath%.bak"

:: Replace the current hosts file with the new one
copy /y "%tempFile%" "%hostsPath%"

:: Delete the temporary file
del "%tempFile%"

endlocal
