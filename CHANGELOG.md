# Change Log

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com), and this project adheres to [Semantic Versioning](https://semver.org).

## [1.3.0] - 03-07-2024

### Added
 - Added default ActionContext for easier debugging

### Changed
 - Moved the processing DryRun block one level closer to the actual web call. To skip only the web call in the target system in preview mode. To remove the difference between a preview run and actual enforcement. And test more connector code in Preview mode.
 - Changed the debugStart to use ActionContext.json instead of Powershell Object
 - Some textual improvements

### Removed
- Removed explicit DryRun messages for preview mode
- Removed the Invoke-<connectorName>RestMethod from the template
- Removed Person.DisplayName from logging
- Removed Start EndDate from FieldMapping.

## [1.2.0] - 18-04-2024

### Added

- Created new subfolders:
  - permissions/groups
  - resources/groups

### Changed

- Renamed the header in file `grantPermission.ps1` from 'Grant' to  'GrantPermission-Group' to match the file name and folder change.
- Renamed the header in file `revokePermission.ps1` from 'Revoke' to  'RevokePermission-Group' to match the file name and folder change.
- Renamed the header in file `permissions.ps1` from 'Permissions' to  'Permissions-Group' to match the file name and folder change.
- Renamed the header in file `resources.ps1` from 'Resources' to  'Resources-Group' to match the file name and folder change.

- Moved the following files to the _permissions/groups_ folder:
  - grantPermission.ps1
  - revokePermission.ps1
  - permissions.ps1

- Moved the following file to the _resources/groups_ folder:
  - resources.ps1

- Converted the properties of both `$correlatedAccount` and `$desiredAccount` in the `update.ps1` lifecycle action to arrays _@()_ for consistent handling.

- Changed logic and flow in both `grantPermission.ps1` and `revokePermission.ps1` lifecycle actions.
  - Modified the condition to check if `$correlatedAccount` is not null before determining the action _GrantPermission_ or _NotFound_ and constructing the corresponding message.
  - Added `switch` statement to handle the different actions.
  - Adjusted the log message inside the `$actionContext.DryRun -eq $true` block to use the constructed `$dryRunMessage`.
  - Adjusted the dryRun information message to display `$actionContext.References.Permission.DisplayName` instead of `$actionContext.References.Permission.Reference`.
  - Adjusted the information message inside the `if (-not($actionContext.DryRun -eq $true))` block to display both the `$actionContext.References.Permission.DisplayName` and `$actionContext.References.Permission.Reference`.
  - Renamed 'entitlement' to 'permission' to be consistent in all informational and audit messages.

### Removed

- Removed line `Write-Information 'Adding body to request'` from the `Invoke-{connectorName}RestMethod` function in each of the __*ps1*__ files.

## [1.1.0] - 22-03-2024

### Added
- Added start and end date in the field mapping as complex mapping
- Added vscode AuditLogs integration in DebugStart
- Added Quick start

### Changed
- Replaced Write-Verbose with Write-Information
- Fixed Empty $action variable in the create script
- Added Links to configuration and field mapping in the README
- Other small textual changes

## [1.0.1] - 22-02-2024

### Added

### Changed
- Commented out the PreviousData assignment, which causes an error in HelloId Preview
- Changed Outdated `$p.` reference to `$personContext`

### Removed
 - Removed incorrect compare condition.

## [1.0.0] - 05-02-2024

### Added

- Added: _resource_ script.
- Added: default value for _accountReference_ to `create` lifecycle action.
- Added: 'ToDo' in all lifecycle actions indicating that each 'POST, PUT or PATCH' call must be tested using diacritical characters.
- Added: _fieldMapping.json_.

### Changed

- In case of an error, changed `Write-Verbose` to `Write-Warning`.
- Updated correlation configuration so that the account will always be created if the correlation configuration is not enabled.
- Improved error handling function.

### Removed

- Removed: `IsDebug` switch from configuration.
- Removed: `auditlog.Action` in situations where its does not reflect the value from the enum.

## [0.0.2] - 13-01-2024

### Added

- Added: _delete_ lifecycle action.
- Added: `$outputContext.AccountCorrelated = $true` to _create_ lifecycle action.

### Changed

### Deprecated

### Removed

## [0.0.1] - 10-12-2023

Initial alpha release.

### Added

- The following life cycle actions have been added:
  - create
  - update
  - enable
  - disable
  - grant
  - revoke
  - permissions

All actions are primarily based on the _V1_ target connector. For the most part, the same logic is being used.

### Changed

### Deprecated

### Removed
