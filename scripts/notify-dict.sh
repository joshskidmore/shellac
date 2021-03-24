#!/usr/bin/env bash

QUERY="${QUTE_SELECTED_TEXT-$1}"

[[ -z "$QUERY" ]] && \
  exit

resp=$(curl --silent "dict://dict.org/d:${QUERY}:wn")

if [[ "$(echo -e "$resp" | grep '^552')" ]]; then
  notify-send.sh "$QUERY" "no match"
else
  notify-send.sh "$(echo -e "$resp" | sed '/^[0-9].*/d' | sed '$d')"
fi