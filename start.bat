@echo off

echo Daytona USA Start Script v1 (By SkylarZYX)
pause

echo enter player mode (1p or 2p or 4p or netplay)
set /p plm=

IF %plm%==1p (goto 1p)
IF %plm%==2p (goto 2p)
IF %plm%==4p (goto 4p)
IF %plm%==netplay (goto netplay)
echo Error 0: Invalid Selection
pause
exit /b

:1p
echo checking emu config...
IF EXIST EMULATOR-dx.INI (goto 1p-nvdata) else (rename "EMULATOR.INI" "EMULATOR-dx.INI")
rename "EMULATOR-sgl.INI" "EMULATOR.INI"
goto 1p-nvdata

:1p-nvdata
cd NVDATA
echo checking nvdata...
IF EXIST daytona-dx.DAT (echo daytona-dx.DAT found) else (rename "daytona.DAT" "daytona-dx.DAT")
IF EXIST daytona-twin.DAT (echo daytona-twin.DAT found) else (rename "daytona.DAT" "daytona-twin.DAT")
IF EXIST daytona-sgl.DAT (rename "daytona-sgl.DAT" "daytona.DAT") else (goto 1p-start)
goto 1p-start

:2p
echo checking emu config...
IF EXIST EMULATOR-sgl.INI (goto 2p-nvdata) else (rename "EMULATOR.INI" "EMULATOR-sgl.INI")
rename "EMULATOR-dx.INI" "EMULATOR.INI"
goto 2p-nvdata

:2p-nvdata
cd NVDATA
echo checking nvdata...
IF EXIST daytona-sgl.DAT (echo daytona-sgl.DAT found) else (rename "daytona.DAT" "daytona-sgl.DAT")
IF EXIST daytona-dx.DAT (echo daytona-dx.DAT found) else (rename "daytona.DAT" "daytona-dx.DAT")
IF EXIST daytona-twin.DAT (rename "daytona-twin.DAT" "daytona.DAT") else (echo daytona.DAT is set to twin!)
cd /D %~dp0
cd /D m2emulator2
goto 2p-emu2

:2p-emu2
echo checking emu2 network config...
IF EXIST m2network-dx.ini (goto 2p-emu2-nvdata) else (rename "m2network.ini" "m2network-dx.ini")
rename "m2network-twin.ini" "m2network.ini"
goto 2p-emu2-nvdata

:2p-emu2-nvdata
cd NVDATA
echo checking emu2 nvdata...
IF EXIST daytona-dx.DAT (echo daytona-dx.DAT found) else (rename "daytona.DAT" "daytona-dx.DAT")
IF EXIST daytona-twin.DAT (rename "daytona-twin.DAT" "daytona.DAT") else (echo daytona.DAT EMU2 is set to twin!)
goto 2p-start

:4p
echo checking emu config...
IF EXIST EMULATOR-sgl.INI (goto 4p-nvdata) else (rename "EMULATOR.INI" "EMULATOR-sgl.INI")
rename "EMULATOR-dx.INI" "EMULATOR.INI"
goto 4p-nvdata

:4p-nvdata
cd NVDATA
echo checking nvdata...
IF EXIST daytona-sgl.DAT (echo daytona-sgl.DAT found) else (rename "daytona.DAT" "daytona-sgl.DAT")
IF EXIST daytona-twin.DAT (echo daytona-twin.DAT found) else (rename "daytona.DAT" "daytona-twin.DAT")
IF EXIST daytona-dx.DAT (rename "daytona-dx.DAT" "daytona.DAT") else (echo daytona.DAT is set to deluxe!)
cd /D %~dp0
cd /D m2emulator2
goto 4p-emu2

:4p-emu2
echo checking emu2 network config...
IF EXIST m2network-twin.ini (goto 4p-emu2-nvdata) else (rename "m2network.ini" "m2network-twin.ini")
rename "m2network-dx.ini" "m2network.ini"
goto 4p-emu2-nvdata

:4p-emu2-nvdata
cd NVDATA
echo checking emu2 nvdata...
IF EXIST daytona-twin.DAT (echo daytona-twin.DAT found) else (rename "daytona.DAT" "daytona-twin.DAT")
IF EXIST daytona-dx.DAT (rename "daytona-dx.DAT" "daytona.DAT") else (echo daytona.DAT EMU2 is set to deluxe!)
goto 4p-start

:netplay
cd online
start online.bat
exit /b

:1p-start
cd /D %~dp0
start emulator_multicpu.exe zip daytona
echo press return to kill
pause
taskkill /im emulator_multicpu.exe
exit /b

:2p-start
cd /D %~dp0
start emulator_multicpu.exe zip daytona
cd /D m2emulator2
start emulator_multicpu.exe zip daytona
cd /D %~dp0
echo press return to kill
pause
taskkill /im emulator_multicpu.exe
cd /D m2emulator2
taskkill /im emulator_multicpu.exe
cd /D %~dp0
exit /b

:4p-start
cd /D %~dp0
start emulator_multicpu.exe zip daytona
cd /D m2emulator2
start emulator_multicpu.exe zip daytona
cd /D %~dp0
cd /D m2emulator3
start emulator_multicpu.exe zip daytona
cd /D %~dp0
cd /D m2emulator4
start emulator_multicpu.exe zip daytona
cd /D %~dp0
echo press return to kill
pause
taskkill /im emulator_multicpu.exe
cd /D m2emulator2
taskkill /im emulator_multicpu.exe
cd /D %~dp0
cd /D m2emulator3
taskkill /im emulator_multicpu.exe
cd /D %~dp0
cd /D m2emulator4
taskkill /im emulator_multicpu.exe
cd /D %~dp0
exit /b