#!/bin/bash
# gsKit.sh by fjtrujy

## Download the source code.
if test ! -d "gsKit/.git"; then
	git clone https://github.com/ps2dev/gsKit && cd gsKit || exit 1
else
	cd gsKit &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

# We reset to the concrete tag
git reset --hard 34ef76e73baa55cfbceb3f4ab191cf1c444ececb || { exit 1; }

## Build and install.
make --quiet clean && make --quiet && make --quiet install && make --quiet clean || { exit 1; }
