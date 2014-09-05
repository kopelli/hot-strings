; When pressing CTRL+WIN+{DOWN}, send the Windows message to minimize the window to the currently active window
; Need to do this rather than relying on the window context menu because some programs (GVIM/Chrome) override
; or ignore that command.
^#Down::
;WM_SYSCOMMAND = 0x112
;SC_MINIMIZE = 0xF020
PostMessage, 0x112, 0xF020,,,A
return

; When pressing WIN+{TAB}, send WIN+[T] instead to bring up the taskbar items instead of the 3D window selection
#Tab::
Send #t
return
