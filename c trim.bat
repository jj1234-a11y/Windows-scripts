@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :admin
) else (
    goto :uacPrompt
)

:uacPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:admin
    :: The script has administrative privileges at this point
    echo Running TRIM command on C: drive...
    PowerShell -Command "Optimize-Volume -DriveLetter C -ReTrim -Verbose"
    pause
