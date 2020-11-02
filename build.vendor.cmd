@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build.config.cmd

echo -^> vendor %PRODUCT_NAME%

if not exist vendor\ mkdir vendor

set WEB_LINK=https://sourceforge.net/projects/nsis/files/NSIS%%203/%PRODUCT_VERSION%/nsis-%PRODUCT_VERSION%.zip/download
if not exist vendor\nsis-%PRODUCT_VERSION%.zip curl --insecure --location %WEB_LINK% --output vendor\nsis-%PRODUCT_VERSION%.zip

set WEB_LINK=https://nsis.sourceforge.io/mediawiki/images/7/7f/EnVar_plugin.zip
if not exist vendor\EnVar_plugin.zip curl --insecure --location %WEB_LINK% --output vendor\EnVar_plugin.zip

set WEB_LINK=https://nsis.sourceforge.io/mediawiki/images/1/18/NsProcess.zip
if not exist vendor\NsProcess.zip curl --insecure --location %WEB_LINK% --output vendor\NsProcess.zip
