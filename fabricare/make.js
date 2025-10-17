// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2022-2024 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

Fabricare.include("vendor");

// ---

messageAction("make");

Shell.mkdirRecursivelyIfNotExists("output");
Shell.mkdirRecursivelyIfNotExists("temp");

if (Shell.fileExists("temp/build.done.flag")) {
	return;
};

Shell.system("7z x vendor/nsis-3.11.zip -aoa -otemp");
Shell.system("7z x vendor/EnVar_plugin.zip -aoa -otemp/EnVar");
Shell.system("7z x vendor/NsProcess.7z -aoa -otemp/NsProcess");

Shell.copyDirRecursively("temp/nsis-3.11", "output");
Shell.rename("temp/NsProcess/Example/nsProcessTest.nsi", "output/Examples/nsProcessTest.nsi");
Shell.rename("temp/NsProcess/Include/nsProcess.nsh", "output/Include/nsProcess.nsh");
Shell.rename("temp/NsProcess/Plugin/nsProcess.dll", "output/Plugins/x86-ansi/nsProcess.dll");
Shell.rename("temp/NsProcess/Plugin/nsProcessW.dll", "output/Plugins/x86-unicode/nsProcess.dll");
Shell.mkdir("output/Contrib/NsProcess");
Shell.copyDirRecursively("temp/NsProcess/Source", "output/Contrib/NsProcess");
Shell.rename("temp/NsProcess/Readme.txt", "output/Contrib/NsProcess/Readme.txt");

Shell.copyDirRecursively("temp/EnVar", "output");

Shell.filePutContents("temp/build.done.flag", "done");
