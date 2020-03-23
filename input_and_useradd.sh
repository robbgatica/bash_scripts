#!/bin/bash

# This script creates an account on the local system.
# You will be prompted for the account name and password

# Ask for the user name
read -p 'Enter the username to create: ' USER_NAME
echo "Your username is ${USER_NAME}"

# Ask for the real name
read -p 'Enter the name of the person who owns this account: ' COMMENT
echo "The owner of this account is ${COMMENT}"
# Ask for the password
read -p 'Enter the password to use for this account: ' PASSWORD
echo "Password successfully stored"

# Create the user
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password for the user
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force password to change on first login
passwd -e ${USER_NAME}

