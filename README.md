# UsrMerge LXC Fix (Bookworm)

This repository contains a helper script for updating Debian within an LXC (Linux Containers) environment. The script `usrmerge-lxc-fix.sh` is designed to fix a specific error related to the `usrmerge` package that occurs when updating to Debian Bookworm.

## Background

The `usrmerge` package in Debian is designed to streamline the system's directory structure by merging directories like `/bin`, `/sbin`, `/lib*` into `/usr`. This structure is common in several other Linux distributions. However, in an LXC container environment, this can cause problems due to the way LXC handles directories and filesystems using bind mounts.

The error message usually seen is "FATAL ERROR: /lib/modules/ is a mount point." This is due to the `usrmerge` package interpreting the mount point as a sign that the system is using User Mode Linux (UML), a different type of Linux virtualization. This leads to the failure of the package configuration.

## Solution

To solve this issue, I've developed a script called `usrmerge-lxc-fix.sh` which is provided in this repository. The script modifies the `convert-usrmerge` file by inserting an `exit;` command at the 4th line to bypass the process that checks for mount points, which leads to the error.

After running the script, you can proceed with your Debian Bookworm update as usual. Once the update is completed, the script will prompt you to undo the changes made to the `convert-usrmerge` file. This ensures that your system will not have residual modifications from this temporary fix.

## How to Use

1. Download the `usrmerge-lxc-fix.sh` script from this repository.
2. Run the script in your LXC Debian container before proceeding with the update to Debian Bookworm.

```
git clone https://github.com/jordanhillis/usrmerge-lxc-fix.git
cd usrmerge-lxc-fix
chmod +x usrmerge-lxc-fix.sh
./usrmerge-lxc-fix.sh
```

## Contribution
Contributions are always welcome! If you have any suggestions, bug reports, or enhancements, feel free to open an issue or a pull request.

## Developers

* **Jordan Hillis** - *Lead Developer*

## License
This project is licensed under the terms of the MIT license. See LICENSE for more details.

## Disclaimer
While this script has been created to address this specific issue, system updates can sometimes present unexpected challenges. If you encounter other issues or need further assistance, I recommend seeking advice from knowledgeable communities or professionals who have a deep understanding of Debian and LXC environments.
