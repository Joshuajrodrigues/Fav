#!/bin/bash


DB="$HOME/.favlist.txt"

if [ ! -e ./favlist.txt ]; then
  touch "$DB"
fi

flag=$1
tag=$2
current_path=$(pwd)

if [ "$flag" = "--add" ]; then 
  if [ -n "$tag" ]; then
    if grep -q "^$tag |" "$DB"; then
      echo "Error: Tag '$tag' already exists."
    else
      echo "$tag | $current_path" >> "$DB"
    fi
  else
    folder=$(basename "$current_path")
    if grep -q "^$folder |" "$DB"; then
      echo "Error: Tag '$folder' already exists."
    else
      echo "$folder | $current_path" >> "$DB"
    fi
  fi
elif [ "$flag" = "--list" ]; then
  echo "--Tag--|--Path--"
  cat $DB
elif [ "$flag" = "--remove" ]; then
  echo "remove"
  if [ -n "$tag" ]; then
    if ! grep -q "^$tag |" "$DB"; then
      echo "Error: Tag '$tag' not found."
    else
      echo "removd tag '$tag'."
      grep -v "^$tag |" "$DB" > temp.txt
      mv temp.txt "$DB"
      echo "Updated list !"
    fi
  else
    echo "Please provide valid tag to remove"
  fi
elif [ "$flag" = "--help" ] || [ "$flag" = "-h" ]; then
  cat << EOF
  Usage: fav [flag] [tag]
  
  Flags:
    --add [tag]       Add current directory with optional tag
    --remove [tag]    Remove a tag
    --list            List all favourites
    [tag]             Output the path for a tag (use with cd)

  Example cd \$(fav site)
EOF
else
  target=$(grep "^$1 |" "$DB" | cut -d '|' -f 2 | xargs)
  if [ -n "$target" ]; then 
    echo "$target"
  fi
fi



