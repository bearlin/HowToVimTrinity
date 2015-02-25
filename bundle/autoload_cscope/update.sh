#!/bin/bash

# Reference: 
# http://derekingrouville.com/2012/cscope-will-change-the-way-you-code/
# http://vim.sourceforge.net/scripts/script.php?script_id=157

rm -rf plugin
wget http://vim.sourceforge.net/scripts/download_script.php?src_id=14884 -O autoload_cscope.vim

mkdir plugin
mv autoload_cscope.vim plugin
