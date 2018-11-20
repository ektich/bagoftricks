#!/bin/bash
#
# find symlinks and display where they are pointing to
# NOTE this script works on MAC but won't work on Linux

echo Broken links
find -L . -type l

echo Symbolic links
find . -type l -print0 | xargs -0 stat -f '%N -> %Y'
