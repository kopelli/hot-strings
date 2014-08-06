; When pressing CTRL+WIN+{DOWN}, bring up the current window menu and choose to minimize it.
^#Down::
Send !{Space}n
;KeyHistory
return

; When pressing WIN+{TAB}, send WIN+[T] instead to bring up the taskbar items instead of the 3D window selection
#Tab::
Send #t
return
