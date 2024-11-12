#!/bin/bash
if [ $# -ne 2 ]; then
  echo "Error: You must provide exactly two arguments: a directory and a search string."
  exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
  echo "Error: $filesdir is not a valid directory."
  exit 1
fi

file_count=0
line_count=0

for file in $(find "$filesdir" -type f); do
  ((file_count++))
  matching_lines=$(grep -c "$searchstr" "$file")
  ((line_count+=matching_lines))
done

echo "The number of files are $file_count and the number of matching lines are $line_count"

exit 0

