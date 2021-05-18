# license-check-configuration

<!--TOC-->

- [license-check-configuration](#license-check-configuration)
  - [Overview](#overview)
  - [Usage](#usage)
    - [Setup pre-commit](#setup-pre-commit)
    - [Setup license list](#setup-license-list)
  - [Contribution](#contribution)

<!--TOC-->

## Overview

Checking the licenses of your open source dependencies is important. But the necessary collection is something, that you don't want to do again for each project. To simplify this, codecentric collects a central list of licenses that can be used for specific purposes. This list is provided as an external configuration file for the [pre-commit-license-checks](https://github.com/nbyl/pre-commit-license-checks) which can be used by [pre-commit](https://pre-commit.com/).

**This repository does not contain any legal advice which licenses can be used for which purposes. Please check the list before using it. You have been warned.**

## Usage

### Setup pre-commit

To use this make sure, you have `pre-commit` [installed](https://pre-commit.com/#install).

When setting a new project, create a new file called `.pre-commit-config.yaml` that contains at least the following hooks:

```
---
repos:
  - repo: https://github.com/nbyl/pre-commit-license-checks
    rev: v1.3.1
    hooks:
      - id: license-check-npm
      - id: license-check-pipenv
```

Afterwards, you can setup your local git hooks using:

```
pre-commit install
```

From now on, alle your git commits will be checked locally with the configured hooks.

### Setup license list

To use the external license list, create a file `.license-check.yaml` next to your package manager file:

```
---
include:
- url: https://raw.githubusercontent.com/codecentric/license-check-configuration/main/commercial-use/$FILE
```

Replace `$FILE` with the file for your supported package manager according to this table:

| Package Manager | Package Manager File | $FILE                       |
| --------------- | -------------------- | --------------------------- |
| npm             | `package.json`       | `license-check-npm.yaml`    |
| pipenv          | `Pipfile`            | `license-check-python.yaml` |

## Contribution

If you want to update the list of allowed license, please edit the corresponding configuration file and submit a pull request.
