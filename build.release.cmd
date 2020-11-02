@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build.config.cmd

echo -^> release %PRODUCT_NAME%

call build.clean.cmd
call build.vendor.cmd
call build.make.cmd
call build.installer.cmd
