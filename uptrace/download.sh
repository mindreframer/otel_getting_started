#!/usr/bin/env bash 

# works for Mac ARM CPU
if ! test -f "uptrace/uptrace";  then
	echo "yes"
	wget https://github.com/uptrace/uptrace/releases/download/v1.3.1/uptrace_darwin_arm64
	chmod  +x uptrace_darwin_arm64
	mv uptrace_darwin_arm64 uptrace/uptrace
fi
