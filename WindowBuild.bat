@echo off
setlocal

REM Step 1: Download the latest stable Python installer to a specific folder
echo Downloading the latest stable Python installer...
powershell -Command "Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.9.6/python-3.9.6-amd64.exe -OutFile python-installer.exe"

REM Step 2: Install Python3 silently to a specific folder
echo Installing Python3...
mkdir C:\Python39KeymouseGo
start /wait python-installer.exe /quiet InstallAllUsers=0 TargetDir=C:\Python39KeymouseGo PrependPath=0

REM Ensure python and pip from the new installation are available in PATH
set PATH=%PATH%;C:\Python39KeymouseGo;C:\Python39KeymouseGo\Scripts

REM Step 3: Upgrade pip and install dependencies
echo Upgrading pip and installing dependencies...
python -m pip install --upgrade pip
pip install -r requirements-windows.txt

REM Step 4: pip install pyinstaller
echo Installing PyInstaller...
pip install pyinstaller

REM Step 5: pyinstaller -F -w --add-data "./assets;assets" KeymouseGo.py
echo Building executable with PyInstaller...
pyinstaller -F -w --add-data "assets;assets" KeymouseGo.py

echo Done!
pause
endlocal
