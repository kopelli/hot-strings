; When pressing WIN+K, open KeePass
#K::
;EnvUpdate
; For the options, 1 = Info Icon, 16 = No Sound
TrayTip, AutoHotKey, Opening up KeePass..., 1, 17
EnvGet, sKeePassExe, KeePassExe
iExeLength := StrLen(sKeePassExe)
If (iExeLength=0) {
    MsgBox, 0x2030, Environment Variable Required, Need to define the environment variable 'KeePassExe' pointing to where KeePass exists
} else {
    Run, %sKeePassExe%
}
return
