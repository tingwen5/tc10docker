$licfileExsit=Test-Path "C:\lic\splm9.lic";

if ($licfileExsit) {
    Write-Host '-v lic file exsit';
    Copy-Item "C:\lic\splm9.lic" -Destination "C:\Siemens\PLMLicenseServer\splm9.lic" -Force; 
}
Write-Host 'restart Siemens PLM License Server service';
Restart-Service 'Siemens PLM License Server' -Verbose;
Write-Host 'log :'
Get-Content -Path 'C:\Siemens\PLMLicenseServer\splm_ugslmd.log' -Wait | Write-Host;




