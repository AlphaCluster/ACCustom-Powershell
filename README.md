ACCustom-Powershell
===================

Powershell module for my own custom functions.

###How to Install
Drop the ACCusom folders in the WindowsPowerShell\Modules folder in your documents folder or create a symlink into that folder from the git repo.

###How to Use
Before you can use the installed cmdlets you have to import the modules:
```Powershell
Import-Module AACustom
```

###Current Cmdlets
|Cmdlet|Description|
|------------|--------|
|Get-HostsEntries|Parse and Print current entries in Windows Hosts File.|
