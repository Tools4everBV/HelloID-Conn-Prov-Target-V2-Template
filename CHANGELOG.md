# Change Log

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com), and this project adheres to [Semantic Versioning](https://semver.org).

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
