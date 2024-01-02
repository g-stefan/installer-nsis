// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2021-2024 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

messageAction("release");

exitIf(Shell.system("fabricare clean"));
exitIf(Shell.system("fabricare make"));
exitIf(Shell.system("fabricare installer"));
