Echo off 
cls
:START
Echo ***********************************
Echo         CTM JOB UTILITY TOOL	 
Echo       Author: Dexter De Vera
Echo          Date: 27/08/2023	 
Echo ***********************************
Echo.
Echo ============MAIN MENU==============
Echo.
Echo Please select one of the below task:
Echo.
Echo 1. Hold a single job
Echo 2. Hold multiple jobs
Echo 3. Delete a single job
Echo 4. Delete multiple jobs
Echo 5. Kill a single job
Echo 6. Kill multiple jobs
Echo 7. Quit

ECHO.

CHOICE /C 1234567 /M "Enter your choice:"

IF ERRORLEVEL 7 GOTO QUIT
IF ERRORLEVEL 6 GOTO KILLM
IF ERRORLEVEL 5 GOTO KILL
IF ERRORLEVEL 4 GOTO DELETEM
IF ERRORLEVEL 3 GOTO DELETE
IF ERRORLEVEL 2 GOTO HOLDM
IF ERRORLEVEL 1 GOTO HOLD
cls
****************************************************************************************************
****************************************************************************************************

:HOLD
CLS
@echo =======HOLD A SINGLE JOB=======
@echo =====Enter the Job OrderID=====

set /p OrderID=Order ID:
ctmpsm -updateajf %OrderID% hold
pause
CLS
GOTO START

****************************************************************************************************
****************************************************************************************************

:HOLDM
CLS
@echo ========HOLD MULTIPLE JOBS===========
@echo Instructions:
@echo 1. When the notepad opens, click Yes to create new file
@echo 2. Enter each OrderID in a single line
@echo 3. Save and exit the notepad
notepad orderID.txt
pause
for /F "tokens=*" %%A in (orderID.txt) do ctmpsm -updateajf %%A hold
pause
del /F orderID.txt
CLS
GOTO START

****************************************************************************************************
****************************************************************************************************

:DELETE
CLS
@echo ======DELETE A SINGLE JOB======
@echo =====Enter the Job OrderID=====

set /p OrderID=Order ID:
ctmpsm -updateajf %OrderID% delete
pause
CLS
GOTO START

****************************************************************************************************
****************************************************************************************************

:DELETEM
CLS
@echo ========DELETE MULTIPLE JOBS===========
@echo Instructions:
@echo 1. When the notepad opens, click Yes to create new file
@echo 2. Enter each OrderID in a single line
@echo 3. Save and exit the notepad
notepad orderID.txt
pause
for /F "tokens=*" %%A in (orderID.txt) do ctmpsm -updateajf %%A delete
pause
del /F orderID.txt
CLS
GOTO START

****************************************************************************************************
****************************************************************************************************

:KILL
CLS
@echo =======KILL A SINGLE JOB=======
@echo =====Enter the Job OrderID=====

set /p OrderID=Order ID:
ctmkilljob -orderid %OrderID%
pause
CLS
GOTO START

****************************************************************************************************
****************************************************************************************************

:KILLM
CLS
@echo ========KILL MULTIPLE JOBS===========
@echo Instructions:
@echo 1. When the notepad opens, click Yes to create new file
@echo 2. Enter each OrderID in a single line
@echo 3. Save and exit the notepad
notepad orderID.txt
pause
for /F "tokens=*" %%A in (orderID.txt) do ctmkilljob -orderid %%A
pause
del /F orderID.txt
CLS
GOTO START

****************************************************************************************************
****************************************************************************************************

:QUIT
EXIT

****************************************************************************************************
****************************************************************************************************