# PoShSkyTap

## SkyTap PowerShell Module

PowerShell module for SkyTap's REST API.

Exposes the available methods of the REST API for SkyTap.

## Latest Update

* Published to [PowerShell Gallery](https://www.powershellgallery.com/packages/PoShSkyTap/1.0.0)

## Getting Started

### Pre-Requisites

* Requires PowerShell v3 (minimum)
* Active [SkyTap account](https://cloud.skytap.com)

### Install & Use

#### PowerShellGet Installation

[PoShSkyTap on PowerShell Gallery](https://www.powershellgallery.com/packages/PoShSkyTap/1.0.0)

```powershell
Install-Module PoShSkyTap
```

```powershell
Import-Module PoShSkyTap
```

#### Manual Installation

Save the module to your PowerShell modules folder of choice.

Find your local PowerShell module paths with the following command:

```powershell
$env:PSModulePath
```

My favorite is `C:\Users\<username>\Documents\WindowsPowerShell\Modules`.

The name of the folder for the module should be "PoShSkyTap".

Import the module:

```powershell
Import-Module PoShSkyTap
```

Discover commands:

```powershell
Get-Command PoShSkyTap
```

## Author

* Joe Garcia, CISSP - [joeco.de](https://joeco.de)

## License

MIT