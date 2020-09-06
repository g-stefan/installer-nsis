@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

echo -^> clean nsis

if exist release\ rmdir /Q /S release
if exist build\ rmdir /Q /S build
