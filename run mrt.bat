@echo off

REM Check if MRT is installed
where /q mrt
if %errorlevel% neq 0 (
    echo MRT could not be found
    exit /b
)



REM Run MRT scan and remove threats
echo Running MRT scan...
mrt  /Q /F:Y

echo Scan complete. Any found threats have been removed.
