#NoEnv      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn All   ; Enable warnings to assist with detecting common errors.
#SingleInstance force
#Persistent

SendMode Input                  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%     ; Ensures a consistent starting directory.

#include lib\outlook.ahk
#include lib\console.ahk
#include lib\windows.ahk
#include lib\keepass.ahk
#include lib\hotstrings.ahk
#include lib\avaya.ahk
