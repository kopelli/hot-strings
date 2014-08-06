;==============================================================================
; Redefine only when the active window is a console window
#IfWinActive ahk_class ConsoleWindowClass

; Close the command window with CTRL+W
$^w::
WinGetTitle sTitle
If (InStr(sTitle, "-")=0) {
    Send EXIT{Enter}
} else {
    Send ^w
}
return

; CTRL+UP to scroll the window up
^Up::
Send {WheelUp}
return

; CTRL+DOWN to scroll the window down
^Down::
Send {WheelDown}
return

; Paste in the command window
^v::
; Sends ALT+SPACE to bring up the window's context menu, then sends `e` for Edit and `p` for Paste
Send !{Space}ep
return

; Shift+F10 to bring up the context menu for the window, same as Windows Explorer
+F10::
Send !{Space}
return

; Go back to global settings
#IfWinActive
;==============================================================================

