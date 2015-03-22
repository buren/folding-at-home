# Folding@Home

## Automatic installation (Ubuntu / Debian)

Run: 
```bash
git clone git@github.com:buren/folding-at-home
bash folding-at-home/install.bash
```
and just follow the instructions.

## Manual installation instructions (Ubuntu / Debian)

1. Download packages
  ```bash
  wget --no-check-certificate https://fah.stanford.edu/file-releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb
  wget --no-check-certificate https://fah.stanford.edu/file-releases/public/release/fahcontrol/debian-testing-64bit/v7.4/fahcontrol_7.4.4-1_all.deb
  wget --no-check-certificate https://fah.stanford.edu/file-releases/public/release/fahviewer/debian-testing-64bit/v7.4/fahviewer_7.4.4_amd64.deb
  ```

2. Install packages
  ```bash
  sudo dpkg -i --force-depends fahclient_7.4.4_amd64.deb
  sudo dpkg -i --force-depends fahcontrol_7.4.4-1_all.deb
  sudo dpkg -i --force-depends fahviewer_7.4.4_amd64.deb
  ```

3. Configure (optional)
  ```bash
  sudo vim /etc/fahclient/config.xml
  ```
  then restart FAHClient
  ```bash
  sudo /etc/init.d/FAHClient restart
  ```

4. Track progress
  1. Get your machines public IP
  2. in FAHControl click '+Add'-button
  3. Enter your machines IP and the password you entered in step 3.

## Crontab

Use root's crontab:
```bash
sudo crontab -e
```

Stop the folding when on workday start.
```bash
00 09 * * 1-5 /etc/init.d/FAHClient stop
```

Start the folding on workday end.
```bash
00 19 * * 1-5 /etc/init.d/FAHClient start
```

### Notes

Seems like some dependencies are not installed, which will make `apt-get install` complain and not install anything. Please run `sudo apt-get -f install` to fix this.
