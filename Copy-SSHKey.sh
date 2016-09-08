#!/bin/bash

ssh-keyscan -H -f /usr/local/etc/unixhosts >> ~/.ssh/know_hosts

read -s -p "Password:" PASS

username='whoami'

for ip in $(cat /usr/local/etc/unixhosts); do ssh-keyscan -H $ip >> ~/.ssh/known_hosts; done
    ~/scripts/ssh_key_distribute/expect_ssh $ip $PASS $username ~/.ssh/id_rsa.pub
done

PASS=$NULL
