@echo off
Rem RxPort is the port where your machine is listening for packets
Rem NextIP is the IP of the next machine in the ring
Rem NextPort is the port where the next machine is listening for packets
echo Daytona USA NetPlay Configuration v1 (By SkylarZYX)
pause

echo enter car number: (options: 1, 2, 3 or 4)
set /p cno=

IF %cno%==1 (goto c1)
IF %cno%==2 (goto c2)
IF %cno%==3 (goto c3)
IF %cno%==4 (goto c4)
echo Error 0: Invalid Selection
pause
exit /b

:c1
echo enter max capacity of cars (players): (opt: 2,3,4)
set /p max=

IF %max%==2 (goto c1-nxt)
IF %max%==3 (goto c1-nxt)
IF %max%==4 (goto c1-nxt)
echo Error 0: Invalid Selection
pause
goto c1

:c1-nxt
echo enter the IPv4 Address of the 2nd car:
set /p cip=
echo writing to ini...
(
	echo [network]
	echo Rxport=1978
	echo NextIP=%cip%
	echo NextPort=1978
) >m2network.ini
cd NVDATA
echo checking nvdata...
IF EXIST daytona-4.DAT (echo daytona-4.DAT found) else (rename "daytona.DAT" "daytona-4.DAT")
IF EXIST daytona-3.DAT (echo daytona-3.DAT found) else (rename "daytona.DAT" "daytona-3.DAT")
IF EXIST daytona-2.DAT (echo daytona-2.DAT found) else (rename "daytona.DAT" "daytona-2.DAT")
IF EXIST daytona-1.DAT (rename "daytona-1.DAT" "daytona.DAT") else (echo daytona.DAT is already set!)

cd /D %~dp0
goto start

:c2
echo enter max capacity of cars (players): (opt: 2,3,4)
set /p max=

IF %max%==2 (goto c2-max)
IF %max%==3 (goto c2-nxt)
IF %max%==4 (goto c2-nxt)
echo Error 0: Invalid Selection
pause
goto c2

:c2-nxt
echo enter the IPv4 Address of the 3rd car:
set /p cip=
echo writing to ini...
(
	echo [network]
	echo Rxport=1978
	echo NextIP=%cip%
	echo NextPort=1978
) >m2network.ini
cd NVDATA
echo checking nvdata...
IF EXIST daytona-4.DAT (echo daytona-4.DAT found) else (rename "daytona.DAT" "daytona-4.DAT")
IF EXIST daytona-3.DAT (echo daytona-3.DAT found) else (rename "daytona.DAT" "daytona-3.DAT")
IF EXIST daytona-1.DAT (echo daytona-1.DAT found) else (rename "daytona.DAT" "daytona-1.DAT")
IF EXIST daytona-2.DAT (rename "daytona-2.DAT" "daytona.DAT") else (echo daytona.DAT is already set!)

cd /D %~dp0
goto start

:c2-max
echo enter the IPv4 Address of the 1st car:
set /p cip=
echo writing to ini...
(
	echo [network]
	echo Rxport=1978
	echo NextIP=%cip%
	echo NextPort=1978
) >m2network.ini
cd NVDATA
echo checking nvdata...
IF EXIST daytona-4.DAT (echo daytona-4.DAT found) else (rename "daytona.DAT" "daytona-4.DAT")
IF EXIST daytona-3.DAT (echo daytona-3.DAT found) else (rename "daytona.DAT" "daytona-3.DAT")
IF EXIST daytona-1.DAT (echo daytona-1.DAT found) else (rename "daytona.DAT" "daytona-1.DAT")
IF EXIST daytona-2.DAT (rename "daytona-2.DAT" "daytona.DAT") else (echo daytona.DAT is already set!)

cd /D %~dp0
goto start

:c3
echo enter max capacity of cars (players): (opt: 3,4)
set /p max=

IF %max%==3 (goto c3-max)
IF %max%==4 (goto c3-nxt)
echo Error 0: Invalid Selection
pause
goto c3

:c3-nxt
echo enter the IPv4 Address of the 4th car:
set /p cip=
echo writing to ini...
(
	echo [network]
	echo Rxport=1978
	echo NextIP=%cip%
	echo NextPort=1978
) >m2network.ini
cd NVDATA
echo checking nvdata...
IF EXIST daytona-4.DAT (echo daytona-4.DAT found) else (rename "daytona.DAT" "daytona-4.DAT")
IF EXIST daytona-2.DAT (echo daytona-2.DAT found) else (rename "daytona.DAT" "daytona-2.DAT")
IF EXIST daytona-1.DAT (echo daytona-1.DAT found) else (rename "daytona.DAT" "daytona-1.DAT")
IF EXIST daytona-3.DAT (rename "daytona-3.DAT" "daytona.DAT") else (echo daytona.DAT is already set!)

cd /D %~dp0
goto start

:c3-max
echo enter the IPv4 Address of the 1st car:
set /p cip=
echo writing to ini...
(
	echo [network]
	echo Rxport=1978
	echo NextIP=%cip%
	echo NextPort=1978
) >m2network.ini
cd NVDATA
echo checking nvdata...
IF EXIST daytona-4.DAT (echo daytona-4.DAT found) else (rename "daytona.DAT" "daytona-4.DAT")
IF EXIST daytona-2.DAT (echo daytona-2.DAT found) else (rename "daytona.DAT" "daytona-2.DAT")
IF EXIST daytona-1.DAT (echo daytona-1.DAT found) else (rename "daytona.DAT" "daytona-1.DAT")
IF EXIST daytona-3.DAT (rename "daytona-3.DAT" "daytona.DAT") else (echo daytona.DAT is already set!)

cd /D %~dp0
goto start

:c4
echo enter the IPv4 Address of the 1st car:
set /p cip=
echo writing to ini...
(
	echo [network]
	echo Rxport=1978
	echo NextIP=%cip%
	echo NextPort=1978
) >m2network.ini
cd NVDATA
echo checking nvdata...
IF EXIST daytona-1.DAT (echo daytona-1.DAT found) else (rename "daytona.DAT" "daytona-1.DAT")
IF EXIST daytona-2.DAT (echo daytona-2.DAT found) else (rename "daytona.DAT" "daytona-2.DAT")
IF EXIST daytona-3.DAT (echo daytona-3.DAT found) else (rename "daytona.DAT" "daytona-3.DAT")
IF EXIST daytona-4.DAT (rename "daytona-4.DAT" "daytona.DAT") else (echo daytona.DAT is already set!)

cd /D %~dp0
goto start

:start
start emulator_multicpu.exe zip daytona
echo press return to kill
pause
taskkill /im emulator_multicpu.exe
exit /b