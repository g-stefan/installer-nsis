@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build\build.config.cmd

echo -^> make %PRODUCT_NAME%

@echo on

if exist temp\ rmdir /Q /S temp
if exist output\ rmdir /Q /S output

mkdir temp

7z x "vendor/nsis-%PRODUCT_VERSION%.zip" -aoa -otemp
7z x "vendor/EnVar_plugin.zip" -aoa -otemp\EnVar
7z x "vendor/NsProcess.zip" -aoa -otemp\NsProcess

set NSIS_BUILD=temp\nsis-%PRODUCT_VERSION%

move temp\NsProcess\Example\nsProcessTest.nsi %NSIS_BUILD%\Examples\nsProcessTest.nsi
move temp\NsProcess\Include\nsProcess.nsh %NSIS_BUILD%\Include\nsProcess.nsh
move temp\NsProcess\Plugin\nsProcess.dll %NSIS_BUILD%\Plugins\x86-ansi\nsProcess.dll
move temp\NsProcess\Plugin\nsProcessW.dll %NSIS_BUILD%\Plugins\x86-unicode\nsProcess.dll
mkdir %NSIS_BUILD%\Contrib\NsProcess
copy temp\NsProcess\Source\* %NSIS_BUILD%\Contrib\NsProcess\
move temp\NsProcess\Readme.txt %NSIS_BUILD%\Contrib\NsProcess\Readme.txt

xcopy /E temp\EnVar\* %NSIS_BUILD%\

move /Y "temp\nsis-%PRODUCT_VERSION%" "output"

if exist temp\ rmdir /Q /S temp
