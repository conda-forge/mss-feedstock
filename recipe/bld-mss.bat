ECHO "========================================================================"
ECHO "Building %PKG_NAME%"
ECHO ""

:: Ensure our GEOS will be used.
set GEOS_DIR=%LIBRARY_PREFIX%

:: Jump to the correct build section
if "%PKG_NAME%"=="mss" GOTO CASE_mss
if "%PKG_NAME%"=="mss-wms" GOTO CASE_mss_mswms
if "%PKG_NAME%"=="mss-mscolab" GOTO CASE_mss_mscolab
if "%PKG_NAME%"=="mss-msui" GOTO CASE_mss_msui

ECHO "Unknown package: %PKG_NAME%"
EXIT 1

:CASE_mss
  set MENU_DIR=%PREFIX%\Menu
  if not exist %MENU_DIR% mkdir %MENU_DIR%
  if errorlevel 1 exit 1
  copy %SRC_DIR%\Menu\msui_shortcut.json %MENU_DIR%\msui_shortcut.json
  if errorlevel 1 exit 1
  copy %SRC_DIR%\Menu\mss.ico %MENU_DIR%\mss.ico
  if errorlevel 1 exit 1
  "%PYTHON%" setup.py install --single-version-externally-managed --ignore-installed -vvv  packages\mss
  IF errorlevel 1 EXIT 1
  GOTO CASE_end
:CASE_mss_mswms
  "%PYTHON%" setup.py install --single-version-externally-managed --ignore-installed -vvv  packages\mss_wms
  IF errorlevel 1 EXIT 1
  GOTO CASE_end
:CASE_mss_mscolab
  "%PYTHON%" setup.py install --single-version-externally-managed --ignore-installed -vvv  packages\mss_mscolab
  IF errorlevel 1 EXIT 1
  GOTO CASE_end
:CASE_mss_msui
  "%PYTHON%" setup.py install --single-version-externally-managed --ignore-installed -vvv packages\mss_msui
  IF errorlevel 1 EXIT 1
  GOTO CASE_end

:CASE_END
