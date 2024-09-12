#!/bin/zsh
# Absolute path for this script's directory
# This should be the root of the "dotfiles" repository
DIR="$(cd "$(dirname $0)" && pwd)"

create_link () {
	file_target=$1
	file_source=$2

	if [ -e "$file_target" ]; then
		echo "File $file_target exists. Skipping."
	elif [ -L "$file_target" ]; then
		echo "Symlink $file_target already exists. Skipping"
	else
		ln -s "$file_source" "$file_target" && echo "Created sym link: $file_target -> $file_source"
	fi
}

# oh-my-zsh

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

for file in "$DIR"/oh-my-zsh/*.zsh; do
	filename="$(basename $file)"
	target_file="$CUSTOM_ZSH_DIR/$filename"
	source_file="$DIR"/oh-my-zsh/$filename

	create_link $target_file $source_file 
done

# dotfiles required in home directory

home_dotfiles=(
	.editorconfig
	.tmux.conf
)

for file in ${home_dotfiles[@]}; do
	target_file="$HOME/$file"
	source_file="$DIR"/$file

	create_link $target_file $source_file 
done
