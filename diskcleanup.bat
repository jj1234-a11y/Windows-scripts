@echo off
:: https://privacy.sexy — v0.13.0 — Mon, 18 Mar 2024 01:39:22 GMT
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

cleanmgr /sagerun:1

cleanmgr /sagerun:2
