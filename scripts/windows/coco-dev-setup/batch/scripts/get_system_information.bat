if exist "%PROGRAMFILES(X86)%" (
	call:set_bit 64
) else (
	call:set_bit 32
)

for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "5.2" ( call:set_os XP )
if "%version%" == "6.0" ( call:set_os Vista )
if "%version%" == "6.1" ( call:set_os Win7 )
:: we handle win8.0 as win7
if "%version%" == "6.2" ( call:set_os Win7 )
:: we handle win8.1 as win7
if "%version%" == "6.3" ( call:set_os Win7 )

goto:end

:set_bit
	call get_local_text install-system-bit
	set system_info_bit=%~1
	echo %system_info_bit%%install_system_bit%
goto:eof

:set_os
	set system_info_os=%~1
	call get_local_text install-system-prefix
	call get_local_text install-system-sufix
	echo %install_system_prefix% %system_info_os% %install_system_sufix%
goto:eof

:end
