#!/usr/bin/env sh
if [ "$1" == "." ] || [ "$1" == "" ]; then
    explorer.exe .
else
    OLD="$OLDPWD"
    if cd "$1"; then
        explorer.exe .
        RTRN=$?
        cd -
        export OLDPWD="$OLD"
        exit $RTRN
    fi
fi
