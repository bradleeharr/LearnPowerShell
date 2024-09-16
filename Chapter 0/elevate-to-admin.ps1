<# 
Add two useful functions to $PROFILE:
    <br/> 1. CheckAdmin - Checks if the current script is run by an administrative user
    <br/> 2. NewAdminWindow - Opens a new Admin-level Windows terminal
    <br/> Sets an Alias 'Admin' That will create a new Admin Window
#>

$adminScript = @'
function CheckAdmin {
    $principalObject = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    Return $principalObject.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function NewAdminWindow {
    # Start Windows Terminal 'wt' as administrator
    Start-Process wt -Verb RunAs
}

Set-Alias -Name Admin -Value NewAdminWindow

'@

if (-not (Test-Path $PROFILE)) {
    $profileDir = Split-Path $PROFILE
    if (-not (Test-Path $profileDir)) {
        mkdir $profileDir
    }
    New-Item -ItemType File -Force -path $PROFILE
}

if (-not (Get-Content $PROFILE | Select-String -Pattern "function NewAdminWindow")) {
    $adminScript >> $profile
    Write-Host "Admin Function Added"
}
else {
    Write-Host "Admin Function Already Present"
}

. $PROFILE
Write-Host "Profile Reloaded."