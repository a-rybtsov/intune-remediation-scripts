# 1. Clean up system Temp folder
Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

# 2. Clean up Temp folders for all user profiles
$users = Get-ChildItem -Path "C:\Users" -Directory
foreach ($user in $users) {
    $userTempPath = "$($user.FullName)\AppData\Local\Temp\*"
    if (Test-Path $userTempPath) {
        Remove-Item -Path $userTempPath -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# 3. Clear Recycle Bin for all drives and users
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

Write-Output "Disk cleanup completed successfully."
exit 0