#!/bin/bash

# Usage: Other scripts can include functions of this file using:
# DOTVIMHOME=~/.vim
# source $DOTVIMHOME/scripts/handy_functions.sh

warn() {
  echo "$1" >&2
}
die() {
  warn "$1"
  exit 1
}
byebye() {
  echo -e "\t=======\t"
  if [ $# -gt 0 ]; then
    echo -e "\t$1\t"
  fi
  echo -e "\tByeBye!\t"
  echo -e "\t=======\t"
  exit 0
}
