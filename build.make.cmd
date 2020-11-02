@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build.config.cmd

echo -^> make %PRODUCT_NAME%

@echo on

if exist build\ rmdir /Q /S build
if exist release\ rmdir /Q /S release

mkdir build

7z x "vendor/nsis-%PRODUCT_VERSION%.zip" -aoa -obuild
7z x "vendor/EnVar_plugin.zip" -aoa -obuild\EnVar
7z x "vendor/NsProcess.zip" -aoa -obuild\NsProcess

set NSIS_BUILD=build\nsis-3.06.1

move build\NsProcess\Example\nsProcessTest.nsi %NSIS_BUILD%\Examples\nsProcessTest.nsi
move build\NsProcess\Include\nsProcess.nsh %NSIS_BUILD%\Include\nsProcess.nsh
move build\NsProcess\Plugin\nsProcess.dll %NSIS_BUILD%\Plugins\x86-ansi\nsProcess.dll
move build\NsProcess\Plugin\nsProcessW.dll %NSIS_BUILD%\Plugins\x86-unicode\nsProcess.dll
mkdir %NSIS_BUILD%\Contrib\NsProcess
copy build\NsProcess\Source\* %NSIS_BUILD%\Contrib\NsProcess\
move build\NsProcess\Readme.txt %NSIS_BUILD%\Contrib\NsProcess\Readme.txt

xcopy /E build\EnVar\* %NSIS_BUILD%\

move /Y "build\nsis-%PRODUCT_VERSION%" "release"

if exist build\ rmdir /Q /S build
