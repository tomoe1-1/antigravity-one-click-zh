@echo off
chcp 936 >nul
setlocal EnableDelayedExpansion
title Antigravity 一键汉化 - 安装
color 0A

set "SRC=%~dp0"
set "DST=%LOCALAPPDATA%\Antigravity-Hans"
set "TOOL=%DST%\antigravity-hans.exe"
set "EXPECTED=91e2987479334a3c001f7c0ab01d830f53b4a2389c7daf8faca56f5503e18bc1"

echo.
echo   ================================================
echo      Google Antigravity  一 键 汉 化  安 装
echo   ================================================
echo.

echo [1/5] 正在检测 Antigravity ...
set "AGY=%LOCALAPPDATA%\Programs\antigravity\Antigravity.exe"
if not exist "%AGY%" (
    echo.
    echo   [错误] 未检测到 Antigravity。
    echo   请先安装 Google Antigravity 后再运行本程序。
    echo.
    pause
    exit /b 1
)
echo       已找到：%AGY%

echo [2/5] 正在安装汉化组件 ...
if not exist "%DST%" mkdir "%DST%"
copy /y "%SRC%antigravity-hans.exe" "%TOOL%" >nul 2>&1
copy /y "%SRC%SHA256SUMS" "%DST%\SHA256SUMS" >nul 2>&1
copy /y "%SRC%restore.bat" "%DST%\恢复英文.bat" >nul 2>&1
copy /y "%SRC%readme.txt" "%DST%\使用说明.txt" >nul 2>&1
if not exist "%TOOL%" (
    echo   [错误] 汉化组件安装失败。
    pause
    exit /b 1
)
echo       安装目录：%DST%

echo [3/5] 正在校验文件完整性 ...
set "HASH="
for /f "skip=1 tokens=*" %%h in ('certutil -hashfile "%TOOL%" SHA256') do (
    set "HASH=%%h"
    goto :hashdone
)
:hashdone
set "HASH=%HASH: =%"
if /i not "%HASH%"=="%EXPECTED%" (
    echo.
    echo   [错误] 文件校验失败，请重新下载安装包。
    echo   期望：%EXPECTED%
    echo   实际：%HASH%
    echo.
    pause
    exit /b 1
)
echo       校验通过。

echo [4/5] 正在创建桌面快捷方式 ...
"%TOOL%" --shortcut --app
echo       已创建「Antigravity 中文」快捷方式。

echo [5/5] 正在启动汉化 ...
start "" /min "%TOOL%" --app
echo       汉化监视器已启动。

echo.
echo   ================================================
echo     安装完成！
echo.
echo   - 以后请双击桌面「Antigravity 中文」启动。
echo   - 右下角 EN / 中 圆钮可随时切换中英文。
echo   - 恢复英文：%DST%\恢复英文.bat
echo   - 详细说明：%DST%\使用说明.txt
echo   ================================================
echo.
pause
exit /b 0
