#!/bin/bash

QUERY=$(echo "$@" | sed 's/ /+/g')
bing_url="https://www.bing.com/search?q=$QUERY"

curl -s -L -A Lynx "$bing_url" |\
tr -d '\n' |
tr '<' '\n' |
sed 's/" /\n/g' |\
grep -oP '(?<=href=")(http[s]?://[^"]+)' |\
grep -v "bing.com\|microsoft.com\|live.com\|creativecommons.org" |\
sort | uniq
