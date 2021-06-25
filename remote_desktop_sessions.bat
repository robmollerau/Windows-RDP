@ echo off
:: List and Kill Remote Desktop Sessions Utility
:: =============================================
:: Provides a quick way to list and kill remote   
:: sessions. Altertative method is to use 
:: Remote Desktop Services Manager
::
@ cls
@ echo off

:: Get Hostname
@ for /F "usebackq" %%i in (`hostname`) do set host=%%i

:: List RDP Sessions
@ qwinsta /server:%host%

:: Allow user to kill a particular session
@ echo.
@ set /p SESSIONID="Enter Session ID to kill (1 to 99) : "
@ if "%SESSIONID%"=="" GOTO ERROR
@ echo.

:: Relist sessions
@ rwinsta /server:%host% %SESSIONID%

:: Feedback on session killed
@ echo.
@ echo Session %SESSIONID% killed
@ echo.

:: Relist sessions
@ qwinsta /server:%host%
 
@ GOTO END
::-----------------------------------------------------------------------------

:ERROR

:: User did not enter any value - provide alternate way to use command
@ echo No value entered!
@ echo.
@ echo You can also kill a session by entering the command below:
@ echo   qwinsta /server:%host% ^<SessionID^>

::-----------------------------------------------------------------------------

:END

:: Batch end point
@ echo.
@ pause


