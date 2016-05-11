;==============================================================================
; Redefine only when the active window is the Avaya One-X window
#IfWinActive Avaya one-X
!F4::
CoordMode,Mouse,Screen

WinGetActiveStats, WinTitle, WinWidth, WinHeight, WinX, WinY
MouseGetPos, MouseX, MouseY

BlockInput On
TrayTip,Avaya One-X,Sending Close,10,0
; Move mouse to the window Close
MouseMove,WinX+465,WinY+17,0
MouseClick,Left
; Move mouse back to original position
MouseMove, MouseX, MouseY, 0
TrayTip

BlockInput Off

; Go back to global settings
#IfWinActive
;==============================================================================
