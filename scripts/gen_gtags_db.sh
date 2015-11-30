#!/bin/bash

DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

usage() {
  echo "Usage: " && \
  echo "Init gtags files: ./gen_gtags_db.sh init" && \
  echo "Update gtags files: ./gen_gtags_db.sh update" && \
  echo "Clear gtags files: ./gen_gtags_db.sh clean"
}

if [ "$#" -lt 1 ]; then
  usage
  byebye "$@"
fi

if [ "$1" == "init" ] || [ "$1" == "update" ] || [ "$1" == "clean" ]; then
  echo "para=$1"
else
  die "Unknow parameters \"$1\", exit!"
fi

hasGtags=0
setFlagsHasGtagsAndExitIfEqualZero "$@"
echo "hasGtags=$hasGtags"

if [ "$1" == "clean" ]; then
  echo "clean generated gtags files in current folder..."
  rm GPATH GRTAGS GTAGS
elif [ "$1" == "init" ]; then
  # References:
  # 在 Vim 中使用 Gtags 进行代码导航 : http://blog.wittyfox.me/p/use-gtags-for-source-code-navigation-in-vim/
  # brew install global : http://brewformulas.org/Global
  # --skip-unreadable : Skip unreadable files.
  # --statistics      : Print statistics information.
  echo "Build the database with (gtags --skip-unreadable --statistics)..."
  gtags --skip-unreadable --statistics
elif [ "$1" == "update" ]; then
  echo "Update the database with (global -u)..."
  global -u
else
  usage
  byebye "$@"
fi

byebye "$@"
