@echo off
chcp 936 >nul
title 恢复 Antigravity 英文界面
color 0E
set "DST=%LOCALAPPDATA%\Antigravity-Hans"
set "TOOL=%DST%\antigravity-hans.exe"

echo.
echo   正在结束汉化监视器 ...
if exist "%TOOL%" (
    "%TOOL%" --stop
) else (
    echo   未找到汉化组件，可能已经恢复原版。
)

set "LNK=%USERPROFILE%\Desktop\Antigravity 中文.lnk"
if exist "%LNK%" (
    del /q "%LNK%" >nul 2>&1
    echo   已移除桌面「Antigravity 中文」快捷方式。
)

echo.
echo   已恢复英文界面。
echo   请关闭 Antigravity，再用原来的「Antigravity」快捷方式重新启动。
echo.
pause
