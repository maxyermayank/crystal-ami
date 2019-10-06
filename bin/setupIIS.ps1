write-output "Running IIS Setup Script"
write-host "(host) Running IIS Setup Script"

# Install IIS Web Management Tools
Add-WindowsFeature Web-Mgmt-Tools

##### http binding #####
$
Import-Module WebAdministration
Set-Location IIS:\Sites\
New-WebBinding -Name "Default Web Site" -IPAddress "*" -Port 80 -HostHeader $SITE_BINDING_NAME

##### Logging #####
#Site variable
$siteName = "Default Web Site"
#Site path
$iislogdir = "D:\IISLogs"
Import-Module WebAdministration
Add-WindowsFeature Web-Custom-Logging, Web-Log-Libraries, Web-ODBC-Logging, Web-Request-Monitor
Set-Location IIS:\Sites\

#Create Log directory if missing
if (!(Test-Path $iislogdir)) {
    Write-Host "No Log directory path found. Creating $iislogdir" -ForegroundColor Green
    New-Item -ItemType directory -Path $iislogdir
}
Set-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.applicationHost/sites/siteDefaults/logFile" -name "directory" -value "$iislogdir"

C:\Windows\System32\inetsrv\appcmd.exe stop site 'Default Web Site'
C:\Windows\System32\inetsrv\appcmd.exe start site 'Default Web Site'

Set-ExecutionPolicy Unrestricted -Scope LocalMachine -Force -ErrorAction Ignore
