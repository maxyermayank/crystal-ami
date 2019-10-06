
write-output "Running Tools Setup Script"
write-host "(host) Running Tools Setup Script"

net user Administrator $PASSWORD

##### Create deployment user #####
New-LocalUser "deploy_usr" -Password $DEPLOY_USER_PASSWORD -FullName "Deploy User" -Description "IIS deploy user" -AccountNeverExpires -PasswordNeverExpires
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "deploy_usr"

Set-ExecutionPolicy Unrestricted -Scope LocalMachine -Force -ErrorAction Ignore
