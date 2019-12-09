sudo pacman -Q | grep -oE '^\S+' | { while read name; do pacman -Qi "$name" | tr '\n' ' ' | grep -E '[[:digit:]]{3}.?[^. ]+ MiB' | awk '{ print $3 }'; done; } | xargs pacman -Qi | less
