download_pkgs() {
  local base_url=https://fah.stanford.edu/file-releases/public/release
  echo 'Downloading all FAH client'
  wget --no-check-certificate $base_url/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb
  echo 'Downloaded all FAH client'
}

install_pkgs() {
  echo 'Installing all FAH client'
  sudo dpkg -i --force-depends fahclient_7.4.4_amd64.deb
  echo 'Installed all FAH client'
}

set_run_schedule() {
  local root_crontab_path=/var/spool/cron/crontabs/root

  echo '

# FAH Schedule start
00 08 * * 1-5 sudo /etc/init.d/FAHClient stop
00 18 * * 1-5 sudo /etc/init.d/FAHClient start
# FAH Schedule start

' | sudo tee -a $root_crontab_path

  echo 'Crontab set:'
  echo 'FAH is setup to run between 18:00-09:00 on workdays, plus weekends.'
}

main() {
  download_pkgs
  install_pkgs
  set_run_schedule
  echo 'FAH is now configured. Thank you for contributing!'
}

main
