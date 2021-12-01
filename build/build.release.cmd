@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build\build.config.cmd

echo -^> release %PRODUCT_NAME%

call build\build.clean.cmd
call build\build.vendor.cmd
call build\build.make.cmd
call build\build.installer.cmd
call build\build.clean.cmd
