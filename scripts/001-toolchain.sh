#!/bin/bash
# ps2-packer.sh by fjtrujy

## Download the source code.
if test ! -d "ps2toolchain/.git"; then
	git clone https://github.com/ps2dev/ps2toolchain && cd ps2toolchain || exit 1
else
	cd ps2toolchain &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

# We reset to the concrete branch
git checkout v1.y || { exit 1; }

## Build and install.
./toolchain.sh || { exit 1; }
