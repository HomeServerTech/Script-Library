#!/bin/bash

#add to .bashrc file
cat > ~/.bashrc << EOF
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
EOF

# make .bash_aliases file
touch .bash_aliases

# reload .bashrc file
. ~/.bashrc
