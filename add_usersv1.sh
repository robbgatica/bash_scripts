#!/bin/bash

# Make sure the script is being executed with superuser privileges
if [[ "${UID}" -ne 0 ]]
then
echo 'You are not root'
exit 1
fi
# Get the username (login)
read -p 'Enter the username to create: ' USER_NAME
# Get the real name (comment/description)
read -p 'Enter the name of the person who owns this account: ' COMMENT
# Get the password
read -p 'Enter the password for this account: ' PASSWORD
# Create the user with the password
useradd -c "${COMMENT}" -m ${USER_NAME}
# Check to see if the ueradd command succeeded
if [[ "${?}" -ne 0 ]]
then
echo 'Unable to add user'
exit 1
fi
# Set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}
# Check to see if the passwd command succeeded
if [[ "${?}" -ne 0 ]]
then
echo 'Password error'
exit 1
fi
# Force the password change on first login
passwd -e ${USER_NAME}
# Display the username, password, and the host where the user was created
echo >> new_user_log
echo 'New User Details' >> new_user_log
echo "username: ${USER_NAME}" >> new_user_log
echo "password: ${PASSWORD}" >> new_user_log
echo "host: ${HOSTNAME}" >> new_user_log
echo >> new_user_log
exit 0
