#!/bin/bash

send_to_slack () {

local opt OPTIND CHANNEL BOTNAME BOTEMOJI MESSAGE TOKEN

CHANNEL="@randy"
BOTNAME="The Borg"
BOTEMOJI=":borgcube:"
MESSAGE="RESISTANCE IS FUTILE! YOU WILL BE ASSIMILATED!"
TOKEN="<API_TOKEN>"

progname="$0"

function usage () {
   cat <<EOF
Usage: $progname [-c Slack Channel] [-b Slack bot name] [-e Slack Bot Enoji avatar] [-m Message to be sent] [-t API Token]
EOF
   exit 0
}

while getopts c:b:e:m: opt; do
  case "$opt" in
    c) CHANNEL="${OPTARG}" ;;
    b) BOTNAME="${OPTARG}" ;;
    e) BOTEMOJI="${OPTARG}" ;;
    m) MESSAGE="${OPTARG}" ;;
    t) TOKEN="${OPTARG}" ;;
    *) usage ;;
  esac
done

header="Content-Type: application/json"
request_body=$(< <(cat <<EOF
{
     "channel": "$CHANNEL",
    "username": "$BOTNAME",
  "icon_emoji": "$BOTEMOJI",
        "text": "$MESSAGE"
}
EOF
))

curl -g -X POST -H "${header}" --data "${request_body}" https://hooks.slack.com/services/${TOKEN}
}

send_to_slack "$@"
