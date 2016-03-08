#!/bin/sh

set -e

export DEVICE=i8200
export VENDOR=samsung

if [ $# -eq 0 ]; then
SRC=adb
else
if [ $# -eq 1 ]; then
SRC=$1
else
echo "$0: bad number of arguments"
echo ""
echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
echo ""
echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
echo "the device using adb pull."
exit 1
fi
fi

BASE=/home/koloses/android/system/vendor/samsung/i8200/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' /home/koloses/android/system/device/samsung/i8200/proprietary-files.txt`; do
echo "Extracting /system/$FILE ..."
DIR=`dirname $FILE`
if [ ! -d $BASE/$DIR ]; then
mkdir -p $BASE/$DIR
fi
if [ "$SRC" = "adb" ]; then
adb pull $FILE $BASE/$FILE
else
cp $SRC/$FILE $BASE/$FILE
fi
done
