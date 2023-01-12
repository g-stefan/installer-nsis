// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2022-2023 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

messageAction("installer");

Shell.mkdirRecursivelyIfNotExists("release");

Shell.setenv("PRODUCT_NAME", "installer-nsis");
Shell.setenv("PRODUCT_VERSION", Project.version);
Shell.setenv("PRODUCT_BASE", "nsis");

exitIf(Shell.system("makensis.exe /NOCD \"source\\nsis-installer.nsi\""));
exitIf(Shell.system("grigore-stefan.sign \"Nullsoft Install System\" \"release\\nsis-" + Project.version + "-installer.exe\""));

var fileName = "nsis-" + Project.version + "-installer.exe";
var jsonName = "nsis-" + Project.version + "-installer.json";

var json = {};
json[fileName] = SHA512.fileHash("release/" + fileName);
Shell.filePutContents("release/" + jsonName, JSON.encodeWithIndentation(json));
