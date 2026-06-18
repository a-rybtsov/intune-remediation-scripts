# Check C: drive status
$drive = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'"

# Calculate free space percentage
$freePercent = ($drive.FreeSpace / $drive.Size) * 100

if ($freePercent -lt 15) {
    Write-Output "Free space is below 15% ($([math]::Round($freePercent,2))%). Cleanup needed."
    exit 1 # Code 1 tells Intune to trigger the remediation script
} else {
    Write-Output "Free space is sufficient ($([math]::Round($freePercent,2))%)."
    exit 0 # Code 0 tells Intune that everything is fine
}