#!/bin/bash
#
# September 2018
#
# Example on how to manipulate PATH variable

newpath=/opt/local/bin

echo $PATH

echo prepending ${newpath} to PATH if it is missing
[[ $PATH =~ ${newpath} ]] || PATH=$newpath:$PATH
echo $PATH

# need `extglob` shell option to be enabled for the matching below to work
# it will revert to the previous value on exit of this script,
# as this script is running in its own subshell
shopt -s extglob
echo removing ${newpath} from PATH if it is present
[[ $PATH =~ ${newpath} ]] && PATH=${PATH/?(:)${newpath}?(:)/}
echo $PATH
