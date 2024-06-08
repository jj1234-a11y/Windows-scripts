@echo off
cls
echo ===========================================================================
echo Wipe Free Space on Drive C:
echo ===========================================================================
echo IMPORTANT NOTICE:
echo Before proceeding, please ensure all your work is saved and that you close
echo all open applications. Do not use the computer while the wipe is in progress.
echo.
echo This process will overwrite all free space on your drive to prevent any
echo previously deleted files from being recovered. Depending on the size of your
echo free space, this process can take several hours to complete.
echo.
echo Press Ctrl+C if you wish to cancel now, or close this window.
echo Otherwise, press any key to start the wipe process.
pause > nul
echo.
echo Starting the free space wipe on drive C:. Please be patient...
echo.
cipher /w:C:
echo.
echo The free space wipe process has completed.
echo It is now safe to use your computer again.
echo ===========================================================================
pause
