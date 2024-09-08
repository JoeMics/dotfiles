#!/bin/zsh

#Absolute path for the oh-my-zsh "custom" dir
CUSTOM_ZSH_DIR="$HOME/.oh-my-zsh/custom"

if [[ ! -e "$CUSTOM_ZSH_DIR" ]]; then
	echo "Could not find oh-my-zsh/custom directory."
	return 1
fi

# Check if sym links in custom directory are good
# Delete broken sym links
echo "Purging broken sym links in $CUSTOM_ZSH_DIR"
find "$CUSTOM_ZSH_DIR" -type l ! -exec test -e {} \; -delete
echo "\nCreating sym links..."

# Absolute path for this script's directory
DIR="$(cd "$(dirname $0)" && pwd)"

# Create links for new files
# Iterate through all .zsh files
for file in "$DIR"/*.zsh; do
	filename="$(basename $file)"
	target="$CUSTOM_ZSH_DIR/$filename"

	if [ -e "$target" ]; then
		echo "File $target exists. Skipping."
	elif [ -L "$target" ]; then
		echo "Symlink $target already exists. Skipping"
	else
		ln -s "$file" "$target" && echo "Created sym link: $target -> $file"
	fi
done
