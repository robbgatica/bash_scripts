#!/bin/bash

# This script displays various info to the screen

# Display 'Hello'
echo 'Hello'

# Assign a value to a variable
WORD='script'

# Display that value using the variable
echo "$WORD"

# Demonstrate that single quotes cause variables to NOT expand

echo '$WORD'

# If you want the value of the variable, use "", if you want the text printed
# as-is, use ''

# Combine the variable with a hard-coded word
echo "This is a shell $WORD"

# Use alternate syntax to display a variable's contents
echo "This is a shell ${WORD}"

# Append text to a variable
echo "${WORD}ing is fun"

# How NOT to append text to a variable
echo "$WORDing is fun!"

# Create a new variable
ENDING='ed'

# Combine these two variables
echo "This is ${WORD}${ENDING}"


