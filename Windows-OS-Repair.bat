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






echo ========================================
echo Windows Resource Protection, DISM Tool and Check Disk
echo ========================================
echo This script will first run 'sfc /scannow' to scan for and attempt to repair corrupt Windows system files.
echo Then, it will execute the DISM tool to repair the Windows image and check disk for errors on reboot.
echo Please be patient as these processes can take some time.
echo Starting System File Checker...
echo ========================================
sfc /scannow
echo ========================================
echo System File Checker has completed.
echo ========================================
echo Now starting Deployment Image Servicing and Management Tool...
echo ========================================
DISM /Online /Cleanup-Image /RestoreHealth
echo ========================================
echo DISM has completed its process.
echo ========================================
echo Both System File Checker and DISM have finished running.
echo Your system files and image have been checked and potentially repaired.
echo ========================================
@echo off
echo ========================================
echo Running check disk on reboot...
echo ========================================
echo y|chkdsk /x /f /r
pause
