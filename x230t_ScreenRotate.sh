#!/bin/bash
# @2022 ScreenRotate for Thinkpad x230t based on Displayplacer - (https://github.com/jakehilborn/displayplacer)

# Setup Displayplacer binary path, can be determined by "which diplayplacer"
DIPLAYPLACER_BIN_PATH="/usr/local/bin/displayplacer"

## Get screen persistant ID
SCREEN_ID=$($DIPLAYPLACER_BIN_PATH list | grep "Persistent screen id:" | awk '{print $4}')

## Get current rotation state
ROTATE_VALUE=$($DIPLAYPLACER_BIN_PATH list | grep 'Rotation:' | awk '{print $2}')

## Procces rotation
case $ROTATE_VALUE in
	0)
	$DIPLAYPLACER_BIN_PATH "id:$SCREEN_ID res:1366x768 color_depth:4 scaling:off origin:(0,0) degree:90"
	;;
	90)
	$DIPLAYPLACER_BIN_PATH "id:$SCREEN_ID res:768x1366 color_depth:4 scaling:off origin:(0,0) degree:180"
	;;
	180)
	$DIPLAYPLACER_BIN_PATH "id:$SCREEN_ID res:1366x768 color_depth:4 scaling:off origin:(0,0) degree:270"
	;;
	270)
	$DIPLAYPLACER_BIN_PATH "id:$SCREEN_ID res:768x1366 color_depth:4 scaling:off origin:(0,0) degree:0"
	;;
esac
