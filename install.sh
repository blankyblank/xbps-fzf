#!/usr/bin/env bash
# shellcheck disable=2016
set -e

_install_msg_home="Installed xfzf in $HOME/.local/bin"
_pathmgs='if you dont have .local/bin in your path already put this in your shell configuration file
PATH="$PATH":"$HOME"/.local/bin'


[[ -x ./xfzf ]] || { chmod +x ./xfzf ; printf '%s\n' "making executable"; }

install() {
  if [ "$(id -u)" != 0 ]; then 
    if [[ -d $HOME/.local/bin ]]; then 
      cp -v ./xfzf "$HOME"/.local/bin/ 
      printf '\n%s\n\n' "$_install_msg_home"
      printf '%s\n\n' "$_pathmgs"
    else
      mkdir -vp "$HOME"/.local/bin && cp -v ./xfzf "$HOME"/.local/bin/
      printf '\n%s\n\n' "$_install_msg_home"
      printf '%s\n\n' "$_pathmgs"
    fi
  else
    cp -v ./xfzf /usr/local/bin/
    printf '\n%s\n\n' ' Installed xfzf system wide'
  fi
  exit
}

uninstall() {
  if [ "$(id -u)" != 0 ]; then 
    if [[ -e $HOME/.local/bin/xfzf ]]; then
      rm -v "$HOME"/.local/bin/xfzf
      printf '\n%s\n\n' "Uninstalled xfzf"
      exit
    else
      printf '%s\n' "xfzf not found in $HOME/.local/bin"
      exit 1
    fi
  else
    if [[ -e /usr/local/bin/xfzf ]]; then
      rm -v /usr/local/bin/xfzf
      printf '\n%s\n\n' "Uninstalled xfzf system wide"
      exit
    else
      printf '%s\n' "xfzf not found in /usr/local/bin"
      exit 1
    fi
  fi
}

usage() {
  cat << HERE_EOF
Usage: ./install.sh [option]
To install xfzf run:
./install.sh -i

To uninstall xfzf run:
./install.sh -u

To install xfzf systemd wide run:
sudo ./install.sh -i

To uninstall xfzf system wide run:
sudo ./install.sh -u
HERE_EOF
  exit 1
}

while getopts "iu" flag; do
  case "$flag" in
    i) install ;;
    u) uninstall ;;
    \?) usage>&2 ;;
  esac
done

if [ -n "$OPTIND" ]; then
  { usage >&2; }
fi
