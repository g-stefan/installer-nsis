// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2022-2024 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

messageAction("vendor");

Shell.mkdirRecursivelyIfNotExists("vendor");

if (!Shell.fileExists("vendor/nsis-3.08.zip")) {
	var webLink = "https://sourceforge.net/projects/nsis/files/NSIS%203/3.08/nsis-3.08.zip/download";
	var cmd = "curl --insecure --location " + webLink + " --output vendor/nsis-3.08.zip";
	Console.writeLn(cmd);
	exitIf(Shell.system(cmd));
};

if (!Shell.fileExists("vendor/EnVar_plugin.zip")) {
	var webLink = "https://nsis.sourceforge.io/mediawiki/images/7/7f/EnVar_plugin.zip";
	var cmd = "curl --insecure --location " + webLink + " --output vendor/EnVar_plugin.zip";
	Console.writeLn(cmd);
	exitIf(Shell.system(cmd));
};

if (!Shell.fileExists("vendor/NsProcess.7z")) {
	var webLink = "https://nsis.sourceforge.io/mediawiki/images/1/18/NsProcess.zip";
	var cmd = "curl --insecure --location " + webLink + " --output vendor/NsProcess.7z";
	Console.writeLn(cmd);
	exitIf(Shell.system(cmd));
};
