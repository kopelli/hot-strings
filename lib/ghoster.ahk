;Ghoster
; Shows a transparent image across the desktop, dims inactive windows
;Skrommel @2005

#SingleInstance,Force
SetBatchLines,-1
SetWindelay,0
OnExit,QUIT

START:
Gosub,READINI
Gosub,TRAYMENU
CoordMode,Mouse,Screen
WinGet,oldid,ID,A
WinGet,oldtop,ExStyle,ahk_id %oldid%
oldtop:=oldtop & 0x8

params=
If multimon=1
{
  SysGet,mon1,Monitor,1
  SySGet,mon2,Monitor,2
  SysGet,mon3,Monitor,3
  SySGet,mon4,Monitor,4
  desktopw:=mon1Right
  If mon2Right>%desktopw%
    desktopw:=mon2Right
  If mon3Right>%desktopw%
    desktopw:=mon3Right
  If mon4Right>%desktopw%
    desktopw:=mon4Right
  desktoph:=mon1Bottom
  If mon2Bottom>%desktoph%
    desktoph:=mon2Bottom
  If mon3Bottom>%desktoph%
    desktoph:=mon3Bottom
  If mon4Bottom>%desktoph%
    desktoph:=mon4Bottom
}
Else
{
  desktopw=%desktopw%
  desktoph=%desktoph%
}
If stretchwidth=1
{
  width=%desktopw%
  x=0
}
If stretchheight=1
{
  height=%desktoph%
  y=0
}
If keepaspect=1
  If width<>
    height=-1
  Else
    width=-1
If x<>
  params=%params% X%x%
If y<>
  params=%params% Y%y%
If width<>
  params=%params% W%width%
If height<>
  params=%params% H%height%
  
Gui,+ToolWindow +AlwaysOnTop -Disabled -SysMenu -Caption
Gui,Margin,0,0
If backcolor<>
  Gui,Color,%backcolor% 
If image<>
  Gui,Add,Picture,%params%,%image%
Gui,Show,X0 Y0 W%A_ScreenWidth% H%A_ScreenHeight%,GhosterWindow
WinSet,Transparent,%transparency%,GhosterWindow


LOOP:
Sleep,50
WinGet,winid,ID,A
If winid<>%oldid%
{
  WinGet,wintop,ExStyle,ahk_id %winid%
  wintop:=wintop & 0x8
  If oldtop
    WinSet,AlwaysOnTop,On,ahk_id %oldid%
  Else
    WinSet,AlwaysOnTop,Off,ahk_id %oldid%
  If !showontop
    WinSet,Top,,GhosterWindow
  WinGetClass,winclass,ahk_id %winid%
  If showdesktop
    If winclass=Progman 
      WinHide,GhosterWindow
    Else
      WinShow,GhosterWindow
  WinSet,Top,,ahk_id %winid%
  If jump
    WinSet,AlwaysOnTop,On,ahk_id %winid%
  oldid=%winid%
  oldtop=%wintop%
}
MouseGetPos,x,y
SetEnv,x1,%x%
SetEnv,y1,%y%
EnvAdd,x1,1
EnvAdd,y1,1
EnvSub,x,1
EnvSub,y,1
WinSet,Region,0-0 %A_ScreenWidth%-0 %A_ScreenWidth%-%A_ScreenHeight% 0-%A_ScreenHeight% 0-0 %x%-%y% %x1%-%y% %x1%-%y1% %x%-%y1% %x%-%y%,GhosterWindow
Goto,LOOP


ABOUT:
Gosub,DESTROY
about=Ghoster shows a transparent image across the screen and dims inactive windows.
about=%about%`n
about=%about%`nChange the image and other settings by editing the Ghoster.ini-file.
about=%about%`n
about=%about%`nSkrommel @2005    http://www.donationcoders.com/skrommel
MsgBox,0,Ghoster,%about%
about=
Goto,START
Return


READINI:
IfNotExist,Ghoster.ini 
{
ini=;Ghoster.ini
ini=%ini%`n`;backcolor=000000-FFFFFF or leave blank to speed up screen redraw.
ini=%ini%`n`;image=                     Path to image or leave blank to speed up screen redraw.
ini=%ini%`n`;x=any number or blank      Moves the image to the right.
ini=%ini%`n`;y=any number or blank      Moves the image down.
ini=%ini%`n`;width=any number or blank  Makes the image wider.
ini=%ini%`n`;height=any number or blank Makes the image taller.
ini=%ini%`n`;stretchwidth=1 or 0        Makes the image fill the width of the screen.
ini=%ini%`n`;stretchheight=1 or 0       Makes the image fill the height of the screen.
ini=%ini%`n`;keepaspect=1               Keeps the image from distorting.
ini=%ini%`n`;transparency=0-255         Makes the ghosting more or less translucent.
ini=%ini%`n`;jump=1 or 0                Makes the active window show through the ghosting.
ini=%ini%`n`;showdesktop=1 or 0         Removes the ghosting when the desktop is active.
ini=%ini%`n`;showontop=1 or 0           Removes ghosting from ontop windows like the taskbar.
ini=%ini%`n`;multimon=1 or 0            Dim all monitors in a multimonitor system
ini=%ini%`n
ini=%ini%`n[Settings]
ini=%ini%`nbackcolor=000000
ini=%ini%`nimage=C:\Windows\Bubbles.bmp
ini=%ini%`nx=
ini=%ini%`ny=
ini=%ini%`nwidth=
ini=%ini%`nheight=
ini=%ini%`nstretchwidth=1
ini=%ini%`nstretchheight=1
ini=%ini%`nkeepaspect=1
ini=%ini%`ntransparency=150
ini=%ini%`njump=1
ini=%ini%`nshowdesktop=1
ini=%ini%`nshowontop=0
ini=%ini%`nmultimon=1
ini=%ini%`n
FileAppend,%ini%,Ghoster.ini
ini=
}
IniRead,backcolor,Ghoster.ini,Settings,backcolor
IniRead,image,Ghoster.ini,Settings,image
IniRead,x,Ghoster.ini,Settings,x
IniRead,y,Ghoster.ini,Settings,y

IniRead,width,Ghoster.ini,Settings,width
IniRead,height,Ghoster.ini,Settings,height
IniRead,stretchwidth,Ghoster.ini,Settings,stretchwidth
IniRead,stretchheight,Ghoster.ini,Settings,stretchheight
IniRead,keepaspect,Ghoster.ini,Settings,keepaspect
IniRead,transparency,Ghoster.ini,Settings,transparency
IniRead,jump,Ghoster.ini,Settings,jump
IniRead,showdesktop,Ghoster.ini,Settings,showdesktop
IniRead,showontop,Ghoster.ini,Settings,showontop
IniRead,multimon,Ghoster.ini,Settings,multimon
Return


TRAYMENU:
Menu,Tray,NoStandard
Menu,Tray,DeleteAll
Menu,Tray,Add,Ghoster,ABOUT
Menu,Tray,Add,
Menu,Tray,Add,&Settings,SETTINGS
Menu,Tray,Add,&About,ABOUT
Menu,Tray,Add,&Restart,RESTART
Menu,Tray,Add,E&xit,QUIT
Menu,Tray,Default,Ghoster
Return


SETTINGS:
Run,Ghoster.ini
Return


RESTART:
Gosub,DESTROY
Goto,START


DESTROY:
If oldtop
  WinSet,AlwaysOnTop,On,ahk_id %oldid%
Else
  WinSet,AlwaysOnTop,Off,ahk_id %oldid%
Gui,Destroy
Return


QUIT:
WinActivate,ahk_class Shell_TrayWnd
WinWaitActive,ahk_class Shell_TrayWnd,,1
Gosub,DESTROY
WinActivate,ahk_id %oldid%
ExitApp 
