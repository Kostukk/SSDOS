#!/bin/bash

user=$1
dir=$2

if id -u "$1" >/dev/null 2>&1; then
  echo "User '$1' exists"
else
  echo "User '$1' does not exist"
  exit
fi

if [ -d "$dir" ];
  then
   echo "Directory '$dir' found"
  else
   echo "Directory '$dir' not found"
  exit
fi

echo "Changing ownership for '$dir'"
 sudo chown -R "$user":"$user" "$dir"
   echo "Done"
exit
