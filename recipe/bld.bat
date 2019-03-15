set MENU_DIR=%PREFIX%\Menu
if not exist %MENU_DIR% mkdir %MENU_DIR%
if errorlevel 1 exit 1
copy %SRC_DIR%\Menu\mss_shortcut.json %MENU_DIR%\mss_shortcut.json
if errorlevel 1 exit 1
copy %SRC_DIR%\Menu\mss.ico %MENU_DIR%\mss.ico
if errorlevel 1 exit 1
%PYTHON% -m pip install . --no-deps -vv
if errorlevel 1 exit 1
