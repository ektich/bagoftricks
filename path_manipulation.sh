#!/bin/bash
#
# September 2018
#
# Example on how to manipulate PATH variable
#
# "source" this file if you want "father" shell's PATH to get
# modified. Otherwise changes will stay within this script's subshell
# another trick is to launch subshell out of this one with "eval
# /bin/bash", but this leads to "shell in the shell" situation

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
