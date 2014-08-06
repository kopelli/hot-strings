; Force the title match mode to contain the text anywhere in the title, rather than it starting with the text.
SetTitleMatchMode, 2
GroupAdd, NameHotstringDisabled, Microsoft Visual Studio
GroupAdd, NameHotstringDisabled, ahk_class Notepad++
return

#IfWinNotActive ahk_group NameHotstringDisabled
::\email::
EnvGet, sUserEmail, USER_EMAIL
If (StrLen(sUserEmail)=0) {
    MsgBox, 0x2030, Environment Variable Required, Need to define the environment variable 'USER_EMAIL' with your appropriate email address
} else {
    SendInput sUserEmail
}
return

::\me::
EnvGet, sUserName, USER_FULLNAME
If (StrLen(sUserName)=0) {
    MsgBox, 0x2030, Environment Variable Required, Need to define the environment variable 'USER_FULLNAME' with your full name
} else {
    SendInput sUserName
}
return

::np::
SendInput no problem
return

::ty::
SendInput thank you
return

#IfWinNotActive
