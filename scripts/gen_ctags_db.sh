#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

#echo "The script name is        ==> $0"
#echo "Total parameter number is ==> $#"

[ "$#" -lt 1 ] && \
  echo "Usage: " && \
  echo "Init ctags files: ./gen_ctags_db.sh init" && \
  echo "Clear ctags files: ./gen_ctags_db.sh clean" && \
  byebye "$@"

#echo "Your whole parameter is   ==> '$@'"
#echo "The 1st parameter         ==> $1"
#echo "The 2nd parameter         ==> $2"

if [ "$1" == "init" ] || [ "$1" == "clean" ]; then
  echo "para=$1"
else
  die "Unknow parameters \"$1\", exit!"
fi

if [ "$1" == "init" ]; then
  # References:
  # http://blog.chhsu.org/2009/03/multi-projects-of-vim-using-cscope.html
  # http://blog.chhsu.org/2010/06/vim-android-framework.html
  
  # 1. Build the database
  which ctags &>/dev/null
  [ $? -eq 0 ] || echo "ctags command not found, please install ctags first."

  echo "Build the database"
  # -R   Equivalent to --recurse.
  # --recurse[=yes|no] Recurse into directories encountered in the list of supplied files.
  # --sort[=yes|no|foldcase] Indicates  whether the tag file should be sorted on the tag name (default is yes). The foldcase value specifies case insensitive (or case-folded) sorting.
  # Usage 1: No cscope.files
  #ctags --sort=foldcase -R .

  # Usage 2: Using cscope.files
  # Remove double quotes in cscope.files as cscope.files.ctags
  cat cscope.files | sed -e 's/^"//g' -e 's/"$//g' > cscope.files.ctags
  ctags --sort=foldcase -L cscope.files.ctags

elif [ "$1" == "clean" ]; then
  echo "clean generated ctags files in current folder..."
  rm tags
fi

byebye "$@"
