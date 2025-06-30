Write-Host "--------------- [ Font Installer ] ---------------"
$Dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$checkingAdmit = Join-Path $dir "checking-administrator.ps1"
& $checkingAdmit


# Specify path
$Dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$fontFolder = Join-Path $Dir "..\assets\fonts"
$windowsFontsFolder = "$env:WINDIR\Fonts"

# Get-ChildItem -Path $fontFolder -Recurse |
# ForEach-Object {
#     Write-Host "Installing font: $($_.Name)"
#     Copy-Item -Path $_.FullName -Destination $windowsFontsFolder -Force
# }