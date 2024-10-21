# HelloID-Conn-Prov-Target-{connectorName}

> [!IMPORTANT]
> This repository contains the connector and configuration code only. The implementer is responsible to acquire the connection details such as username, password, certificate, etc. You might even need to sign a contract or agreement with the supplier before implementing this connector. Please contact the client's application manager to coordinate the connector requirements.

<p align="center">
  <img src="">
</p>

## Table of contents

- [HelloID-Conn-Prov-Target-{connectorName}](#helloid-conn-prov-target-connectorname)
  - [Table of contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Getting started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Connection settings](#connection-settings)
    - [Correlation configuration](#correlation-configuration)
    - [Available lifecycle actions](#available-lifecycle-actions)
    - [Field mapping](#field-mapping)
  - [Remarks](#remarks)
  - [Development resources](#development-resources)
    - [API endpoints](#api-endpoints)
    - [API documentation](#api-documentation)
  - [Getting help](#getting-help)
  - [HelloID docs](#helloid-docs)

## Introduction

_HelloID-Conn-Prov-Target-{connectorName}_ is a _target_ connector. _{connectorName}_ provides a set of REST API's that allow you to programmatically interact with its data.

## Getting started

### Prerequisites

<!--
Describe the specific requirements that must be met before using this connector, such as the need for an agent, a certificate or IP whitelisting.

**Please ensure to list the requirements using bullet points for clarity.**

Example:

- **SSL Certificate**:<br>
  A valid SSL certificate must be installed on the server to ensure secure communication. The certificate should be trusted by a recognized Certificate Authority (CA) and must not be self-signed.
- **IP Whitelisting**:<br>
  The IP addresses used by the connector must be whitelisted on the target system's firewall to allow access. Ensure that the firewall rules are configured to permit incoming and outgoing connections from these IPs.
-->

### Connection settings

The following settings are required to connect to the API.

| Setting  | Description                        | Mandatory |
| -------- | ---------------------------------- | --------- |
| UserName | The UserName to connect to the API | Yes       |
| Password | The Password to connect to the API | Yes       |
| BaseUrl  | The URL to the API                 | Yes       |

### Correlation configuration

The correlation configuration is used to specify which properties will be used to match an existing account within _{connectorName}_ to a person in _HelloID_.

| Setting                   | Value                             |
| ------------------------- | --------------------------------- |
| Enable correlation        | `True`                            |
| Person correlation field  | `PersonContext.Person.ExternalId` |
| Account correlation field | `EmployeeNumber`                  |

> [!TIP]
> _For more information on correlation, please refer to our correlation [documentation](https://docs.helloid.com/en/provisioning/target-systems/powershell-v2-target-systems/correlation.html) pages_.

### Available lifecycle actions

The following lifecycle actions are available:

| Action                                  | Description                                                                                 |
| --------------------------------------- | ------------------------------------------------------------------------------------------- |
| create.ps1                              | Creates a new account.                                                                      |
| delete.ps1                              | Removes an existing account or entity.                                                     |
| disable.ps1                             | Disables an account, preventing access without permanent removal.                           |
| enable.ps1                              | Enables an account, granting access.                                                       |
| update.ps1                              | Updates the attributes of an account.                                                      |
| permissions/groups/grantPermission.ps1  | Grants specific permissions to an account.                                            |
| permissions/groups/revokePermission.ps1 | Revokes specific permissions from an account.                                         |
| permissions/groups/permissions.ps1      | Retrieves all available permissions.                                                       |
| resources/groups/resources.ps1          | Manages resources, such as creating groups.                                                |
| configuration.json                      | Contains the connection settings and general configuration for the connector.              |
| fieldMapping.json                       | Defines mappings between person fields and target system person account fields.              |

### Field mapping

The field mapping can be imported by using the _fieldMapping.json_ file.

## Remarks

<!--
Provide remarks on special aspects of the code or the internal workings of the connector.

**Please ensure to use `###` tags for H3 headings for each remark.**

Example:

### GET Account API Limitation
- **No GET Endpoint**: The API does not support a GET request to retrieve account details. You may need to use alternative methods or endpoints to access account information, such as using a POST request with appropriate parameters.

### Correlation Based on Email Address
- **Email Address Correlation**: The connector relies on email addresses to correlate and match records between systems. Ensure that email addresses are accurately maintained and consistent across systems to avoid issues with data synchronization and matching.
-->

## Development resources

### API endpoints

The following endpoints are used by the connector

| Endpoint | Description               |
| -------- | ------------------------- |
| /Users   | Retrieve user information |

### API documentation

<!--
If publicly available, provide the link to the API documentation
-->

## Getting help

> [!TIP]
> _For more information on how to configure a HelloID PowerShell connector, please refer to our [documentation](https://docs.helloid.com/en/provisioning/target-systems/powershell-v2-target-systems.html) pages_.

> [!TIP]
>  _If you need help, feel free to ask questions on our [forum](https://forum.helloid.com)_.

## HelloID docs

The official HelloID documentation can be found at: https://docs.helloid.com/
