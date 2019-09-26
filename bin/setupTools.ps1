
write-output "Running Tools Setup Script"
write-host "(host) Running Tools Setup Script"

net user Administrator $PASSWORD

Set-ExecutionPolicy Unrestricted -Scope LocalMachine -Force -ErrorAction Ignore
