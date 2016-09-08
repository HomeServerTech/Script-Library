#!/bin/bash

test_site (){
  for ((n=0;n<3;n++)); do
    printf "pinging $1..."
    ping -q -w 4 -c 2 "$1" > /dev/null
    PINGVAL=$?
    if [ $PINGVAL -eq 0 ]; then
      printf "success\n"
      break
    else
      printf "failed\n"
    fi # end if ping $1
    sleep 10
  done # end for $i in [1..3]
} # end function test_site

test_site $*
