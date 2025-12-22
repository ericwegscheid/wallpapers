#!/bin/bash

cd ./public/images/
counter=1
for file in *.jpg; do
  mv "$file" "${counter}.jpg" &>/dev/null
  ((counter++))
done

cd ../..

# Generate image tags for all files in ./public/images/
temp_file=$(mktemp)
echo '  <div class="gallery">' > "$temp_file"
for file in ./public/images/*; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    echo "    <img src=\"./images/${filename}\"/>" >> "$temp_file"
  fi
done
echo '  </div><!-- .gallery -->' >> "$temp_file"

# Replace the .gallery div in the HTML file
sed -i.bak '/<div class="gallery">/,/<\/div><!-- .gallery -->/d' ./public/index.html
sed -i.bak '/<h1>Wallpapers<\/h1>/r '"$temp_file" ./public/index.html

# Clean up
rm -f "$temp_file" ./public/index.html.bak
