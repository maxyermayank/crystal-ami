
write-output "Running Crystal Report Setup Script"
write-host "(host) Running Crystal Report Setup Script"

Install-WindowsFeature NET-Framework-45-ASPNET
Install-WindowsFeature Web-Asp-Net45

Start-Process -FilePath 'msiexec' -ArgumentList '/i', 'C:/resources/CRRuntime_64bit_13_0_25.msi', '/quiet', '/NoRestart', '/L*V C:/logs/cr64.log' -Wait
md "C:/Program Files (x86)/MSBuild/Microsoft/VisualStudio/v14.0/WebApplications"
mv C:/resources/Microsoft.WebApplication*.* "C:/Program Files (x86)/MSBuild/Microsoft/VisualStudio/v14.0/WebApplications"
Invoke-WebRequest "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile "C:\windows\nuget.exe" -UseBasicParsing

$env:NUGET_PATH="C:\windows\"
$env:MSBUILD_PATH="C:\windows\microsoft.net\framework\v4.0.30319"
$env:PATH=$env:NUGET_PATH + ';' + $env:MSBUILD_PATH + ';' + $env:PATH; [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

Set-ExecutionPolicy Unrestricted -Scope LocalMachine -Force -ErrorAction Ignore
