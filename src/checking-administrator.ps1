# เช็คว่าเป็น Administrator หรือไม่
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

    Write-Host "⏫ Not running as Administrator. Restarting with elevated privileges..."

    # รันตัวเองใหม่ด้วยสิทธิ์ Administrator
    Start-Process powershell "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs

    # ออกจาก shell ปัจจุบัน
    exit
}

Write-Host "✅ Running as Administrator!"
