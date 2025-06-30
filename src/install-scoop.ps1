# Install scoop
if (Get-Command scoop -ErrorAction SilentlyContinue) {
    Write-Host "Scoop is installed."
} else {
    Write-Host "Scoop is NOT installed."
    Write-Host "[ Installing Scoop, a command-line installer for Windows]"
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

# Add 'scoop' to PATH (Temporary)
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
$scoopPath = "$env:USERPROFILE\scoop\shims"
if (-not ($oldPath -split ";" | Where-Object { $_ -eq $scoopPath })) {
    $newPath = "$oldPath;$scoopPath"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Host "Added $scoopPath to User PATH."
} else {
    Write-Host "Path already contains $scoopPath"
}
# Add Extras bucket
Write-Host "[ Add 'extras' bucket to scoop ]"
scoop bucket add extras
