#!/bin/bash

set -x

DIR="$(dirname $(readlink -f $0))"

cd "/usr/lib/modules/$(uname -r)/extra"

xz -d razercore.ko.xz
xz -d razerkbd.ko.xz
xz -d razerfirefly.ko.xz
xz -d razerkraken.ko.xz
xz -d razermouse.ko.xz
xz -d razermug.ko.xz
xz -d razeraccessory.ko.xz

KSCRIPTS="/usr/src/kernels/$(uname -r)/scripts"

$KSCRIPTS/sign-file sha512 "$DIR/MOK.priv" "$DIR/MOK.der" razercore.ko
$KSCRIPTS/sign-file sha512 "$DIR/MOK.priv" "$DIR/MOK.der" razerkbd.ko
$KSCRIPTS/sign-file sha512 "$DIR/MOK.priv" "$DIR/MOK.der" razerfirefly.ko
$KSCRIPTS/sign-file sha512 "$DIR/MOK.priv" "$DIR/MOK.der" razerkraken.ko
$KSCRIPTS/sign-file sha512 "$DIR/MOK.priv" "$DIR/MOK.der" razermouse.ko
$KSCRIPTS/sign-file sha512 "$DIR/MOK.priv" "$DIR/MOK.der" razermug.ko
$KSCRIPTS/sign-file sha512 "$DIR/MOK.priv" "$DIR/MOK.der" razeraccessory.ko

xz -c razercore.ko > razerkore.ko.xz
xz -c razerkbd.ko > razerkbd.ko.xz
xz -c razerfirefly.ko > razerfirefly.ko.xz
xz -c razerkraken.ko > razerkraken.ko.xz
xz -c razermouse.ko > razermouse.ko.xz
xz -c razermug.ko > razermug.ko.xz
xz -c razeraccessory.ko > razeraccessory.ko.xz
