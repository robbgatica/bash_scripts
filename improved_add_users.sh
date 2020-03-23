#!/bin/bash

# This script creates a new user on the locval system.
# You must supply a username as an argument to the script
# Optionally, you can also provide a comment for the account as an argument
# A password will be automatically generated for the account
# The username, password, and host for the account will be displayed

# Make sure the script is being executed with superuser privileges
if [[ "${UID}" -ne 0 ]] 
then
echo 'Please run with sudo or as root'
exit 1
fi

# If they don't supply at least one argument, give them help
if [[ "${#}" -lt 1 ]] 
then
echo "Usage: ${0} USER_NAME [COMMENT]..."
echo 'Create an account on the local system with name of USER_NAME and a comments field of COMMENT.'exit 1
fi

# The first positional parameter is the username
USER_NAME="${1}"

# The rest of the parameters are comments
# Since we captured position 1, we can shift the remaining parameters
shift
COMMENT="${@}"

# Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c15)

# Create the user with the password
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check the exit code to see if useradd was successful
if [[ "${?}" -ne 0 ]]
then
echo 'There was a problem adding the user'
exit 1
fi

# Set password on the account
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see if passwd command succeeded
if [[ "${?}" -ne 0 ]] 
then
echo 'Password could not be set'
exit 1
fi

# Force password change on first login
passwd -e ${USER_NAME}

# Display the information (or output the info to file)
echo >>  'New User Details'
echo "Username: ${USER_NAME}" >> new_user_log
echo "password: ${PASSWORD}" >> new_user_log
echo "host:     ${HOSTNAME}" >> new_user_log
echo


 
