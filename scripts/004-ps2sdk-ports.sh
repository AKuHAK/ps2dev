#!/bin/bash
# ps2sdk-ports.sh by fjtrujy

## Download the source code.
if test ! -d "ps2sdk-ports/.git"; then
	git clone https://github.com/ps2dev/ps2sdk-ports && cd ps2sdk-ports || exit 1
else
	cd ps2sdk-ports &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

# We reset to the concrete tag
git reset --hard v1.0 || { exit 1; }

## Build and install.
make --quiet || { exit 1; }
