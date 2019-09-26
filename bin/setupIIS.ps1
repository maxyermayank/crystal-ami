write-output "Running IIS Setup Script"
write-host "(host) Running IIS Setup Script"

# Install IIS Web Management Tools
Add-WindowsFeature Web-Mgmt-Tools

C:\Windows\System32\inetsrv\appcmd.exe stop site 'Default Web Site'
C:\Windows\System32\inetsrv\appcmd.exe start site 'Default Web Site'

Set-ExecutionPolicy Unrestricted -Scope LocalMachine -Force -ErrorAction Ignore
