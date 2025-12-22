#!/bin/bash

counter=1
for file in *.jpg; do
  mv "$file" "${counter}.jpg" &>/dev/null
  ((counter++))
done   
