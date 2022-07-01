#!/bin/bash
export e="\e["

function cls          { echo -n "${e}H${e}J${e}0m"; }
function rcls         { echo -n "${e}H${e}J${e}S${e}H${e}J${e}0m${e}u${e}J"; } # not quite yet !
# rcls only works when no funny codes have been issued in between, i.e. the buffer is clean
# below the current screen. And then there can be issues with the first line of the buffer.

function bright       { echo -n "${e}1m"; }
function normal       { echo -n "${e}0m"; }
function colour       { echo -n "${e}$1;$2;$3m"; }
function black        { echo -n "${e}30m"; }
function bg_black     { echo -n "${e}40m"; }
function red          { echo -n "${e}31m"; }
function bg_red       { echo -n "${e}41m"; }
function green        { echo -n "${e}32m"; }
function bg_green     { echo -n "${e}42m"; }
function yellow       { echo -n "${e}33m"; }
function bg_yellow    { echo -n "${e}43m"; }
function blue         { echo -n "${e}34m"; }
function bg_blue      { echo -n "${e}44m"; }
function magenta      { echo -n "${e}35m"; }
function bg_magenta   { echo -n "${e}45m"; }
function cyan         { echo -n "${e}36m"; }
function bg_cyan      { echo -n "${e}46m"; }
function white        { echo -n "${e}37m"; }
function bg_white     { echo -n "${e}47m"; }
function c_up         { echo -n "${e}$1A"; }
function c_down       { echo -n "${e}$1B"; }    # within
function c_right      { echo -n "${e}$1C"; }
function c_left       { echo -n "${e}$1D"; }    # screen
function c_pos        { echo -n "${e}$1;$2f"; } # [Hf]
function c_line       { echo -n "${e}$1d"; }
function screentop    { echo -n "${e}H"; }      # [Hdf]
function linetop      { echo -n "${e}G"; }
function buffertop    { echo -n "${e}u"; }      # depends on other control characters ?
function tab          { echo -n "${e}I"; }
function backtab      { echo -n "${e}Z"; }
function scrolldown   { echo -n "${e}$1T"; }    # within screen
function scrolldown_B { echo -n "${e}$1L"; }    # scroll down below cursor
function scrollup_B   { echo -n "${e}$1M"; }    # scroll up below cursor
function clear        { echo -n "${e}J"; }      # delete to end of screen
function cleanbuffer  { echo -n "${e}S"; }      # copies first screen to bottom and clears
                                                # everything else above the cursor.
#function xxx { echo -n "${e}xxx"; }
#cd server && make build