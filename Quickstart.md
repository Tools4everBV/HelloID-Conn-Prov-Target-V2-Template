# QuickStart

## Before you begin

Before you begin developing a connector, make sure to have installed the following:

- [ ] [PowerShell 7](https://github.com/PowerShell/PowerShell)
- [ ] [VSCode](https://code.visualstudio.com/download)
- [ ] [PowerShell extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
- [ ] [ConnectorGenerator VSCode extension](https://github.com/JeroenBL/ConnectorGenerator)

>[!TIP]
While __PowerShell 7__ is not a strict requirement, its advised to have it installed locally if your connector will be executed using __HelloID__ cloud PowerShell.

## Project structure

A connector project comes with a lot of files. Each with its own purpose. The table below specifies each file and its use.

| File Name              | Description                                          |
| ---------------------- | ---------------------------------------------------- |
| ./test/config.json     | keep your configuration settings for local debugging |
| ./test/debugStart.json | debugStart for easy debugging                        |
| ./test/demoPerson.json | pre-filled person skeleton                           |
| .gitignore             | ignore the test folder                               |
| CHANGELOG.md           | keep track of notable changes to the connector       |
| configuration.json     | connector configuration.json                         |
| create.ps1             | connector create lifecycle action                    |
| delete.ps1             | connector delete lifecycle action                    |
| disable.ps1            | connector disable lifecycle action                   |
| enable.ps1             | connector enable lifecycle action                    |
| fieldMapping.json      | connector field mapping                              |
| grantPermission.ps1    | connector grant lifecycle action                     |
| permissions.ps1        | connector permission retrieval action                |
| README.md              | pre-filled README to keep with the connector         |
| resources.ps1          | connector resource creation action                   |
| revokePermission.ps1   | connector revoke lifecycle action                    |
| update.ps1             | connector update lifecycle action                    |

Please note that not all lifecycle actions may be necessary for your project. You can safely remove actions that you don't need.

## Testing and debugging a lifecycle action

You will probably spend a lot time developing your code. And, you want to make sure it runs properly __before__ moving to __HelloID__. Its advised to first execute and test your code locally.

Every project includes a _test_ folder that contains everything you need to test (and debug) your code locally.

>[!TIP]
Make sure the `debugStart.ps1` is loaded __before__ executing one of the lifecycle actions.

To debug a lifecycle action:

1. Open one of the lifecycle actions.
2. Set breakpoints in your code.
3. Press `Run` or `F5` to execute the code.
4. Find output of your connector in the `PowerShell Extension Logs` window.

## What's next

Developing a connector requires extensive knowledge of _PowerShell_ and _HelloID_ provisioning. If you don't know where to go from here, there are plenty of resources that can help you.

### Samples

We have a huge collection of connectors available on the [Tools4ever GitHub](https://github.com/Tools4everBV) repository you can adapt from.

### Documentation

Make sure to explore our [documentation](https://docs.helloid.com/en).

### ChatGPT

ChatGPT is a great tool that can answer your questions and generate code. See: [OpenAI](https://chat.openai.com/).

### Forum

Lastly, if you find yourself stuck and require assistance, make sure to visit our [forum](https://forum.helloid.com). Here, you can ask questions and connect with our consultants and developers.


