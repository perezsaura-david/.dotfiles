#!/usr/bin/env bash
# Script inspired by thePrimeagen https://github.com/ThePrimeagen/.dotfiles/

: "${HOME:?HOME must be set}"

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    files=$(find $folder -depth -maxdepth 1 | grep /)
    for file in $files
    do
        file_to_link_test=${file##*/}
	file_linked="${DOTFILES}/${file}" 
	if [[ ! -z $file_to_link_test ]]; then
	    file_to_link="$HOME/${file#*/}"
	    if [[ -z "${file#*/}" || "$file_to_link" == "$HOME" || "$file_to_link" == "/" ]]; then
	        echo "Refusing to touch unsafe path: '$file_to_link'" >&2
	        continue
	    fi
	    echo $file_linked
	    echo $file_to_link
	    #HERE GOES THE MAIN PART IN THIS CASE CREATE THE SYMLINK
	    rm -f $file_to_link
	    ln -s $file_linked $file_to_link
	fi
    done
done
popd
