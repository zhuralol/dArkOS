# <p align="center">Welcome to dArkOS</p>

### <p align="center">Debian based version of the ArkOS operating system for select RK3326 and RK3566 based portable gaming devices.</p>

**Building instructions:**
   - Suggested Environment - Ubuntu or related variants, version 24.04 or newer \
     Because chroot is used in this process, heavy use of sudo is made.  To reduce the possibility of priviledge issues, \
     it's best to be able to execute sudo without needing a password.  This can be done using one of the 2 methods below.
      - Method 1: - Open a Terminal window and type `sudo visudo` \
                    In the bottom of the file, add the following line: `$USER ALL=(ALL) NOPASSWD: ALL` \
                    Where $USER is your username on your system. Save and close the sudoers file (if you haven't changed your \
                    default terminal editor (you'll know if you have), press Ctl + x to exit nano and it'll prompt you to save).
      - Method 2: - Clone this git repo then run `./FreeSudo.sh`.  If there were no errors, it should've completed this change for you. \
                    You can verify this by checking if a `/etc/sudoers.d/$USER` file exists and contains `$USER ALL=(ALL) NOPASSWD: ALL` in it.
     
Now you should be able to just run make <device_name> to build for a supported device.  Example: `make rg353m`

**Notes**
- To build on a different release of Debian, change the DEBIAN_CODE_NAME export in the Makefile.  Other debian code names can be found at https://www.debian.org/releases/
- Initial build time on an Intel I7-8700U unit with a 512GB NVME SSD and 32GB of DDR4 memory is a little over 19 hours.  Subsequent builds are about 6 hours thanks to ccache.
