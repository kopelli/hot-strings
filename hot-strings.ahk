#NoEnv      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn All   ; Enable warnings to assist with detecting common errors.
#SingleInstance force
#Persistent

SendMode Input                  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%     ; Ensures a consistent starting directory.

;MsgBox, %A_ScriptDir%
#include %A_ScriptDir%\lib\outlook.ahk
#include %A_ScriptDir%\lib\console.ahk
#include %A_ScriptDir%\lib\windows.ahk
#include %A_ScriptDir%\lib\keepass.ahk
#include %A_ScriptDir%\lib\hotstrings.ahk
#include %A_ScriptDir%\lib\avaya.ahk
