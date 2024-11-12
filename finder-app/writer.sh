#!/bin/bash
if [ $# -ne 2 ]; then
  echo "Error: You must provide exactly two arguments: a file path and a string to write."
  exit 1
fi

writefile=$1
writestr=$2

dirpath=$(dirname "$writefile")

if [ ! -d "$dirpath" ]; then
  mkdir -p "$dirpath"
  if [ $? -ne 0 ]; then
    echo "Error: Failed to create the directory path."
    exit 1
  fi
fi

echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
  echo "Error: Failed to create or write to the file."
  exit 1
fi

exit 0
