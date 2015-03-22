# Folding@Home

## Installation instructions Ubuntu

1. Download packages
  ```bash
  wget --no-check-certificate https://fah.stanford.edu/.../fahclient_7.4.4_amd64.deb
  wget --no-check-certificate https://fah.stanford.edu/.../fahcontrol_7.4.4-1_all.deb
  wget --no-check-certificate https://fah.stanford.edu/.../fahviewer_7.4.4_amd64.deb
  ```

2. Install packages
  ```bash
  sudo dpkg -i --force-depends fahclient_7.4.4_amd64.deb
  sudo dpkg -i --force-depends fahcontrol_7.4.4-1_all.deb
  sudo dpkg -i --force-depends fahviewer_7.4.4_amd64.deb
  ```

3. Configuration
  ```bash
  sudo vim /etc/fahclient/config.xml
  ```
  ```xml
  <user v='USERNAME' />
  <team v='TEAM_NUMBER' />
  <allow v='IP_ADDRESS_YOU_WILL_CONECT_FROM' />
  <password v='PASSWORD_YOU_WILL_ENTER_IN_FAHCONTROL' />
  ```
  and then finally restart FAHClient
  ```bash
  sudo /etc/init.d/FAHClient restart
  ```

4. Track progress
  1. Get your machines public IP
  2. in FAHControl click '+Add'-button
  3. Enter your machines IP and the password you entered in step 3.