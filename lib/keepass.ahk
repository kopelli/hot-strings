; When pressing WIN+K, open KeePass
#K::
;EnvUpdate
EnvGet, sKeePassExe, KeePassExe
iExeLength := StrLen(sKeePassExe)
If (iExeLength=0) {
    MsgBox, 0x2030, Environment Variable Required, Need to define the environment variable 'KeePassExe' pointing to where KeePass exists
} else {
    Run, %sKeePassExe%
}
return
