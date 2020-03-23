#!/bin/bash

# Display the UID and username of the user executing this script
# Display if the user is the vagrant user or not

# Display the UID
echo "Your user ID is ${UID}"

# Only display if the UID does not match 1000.
UID_TEST='1000'
if [[ "${UID}" -ne "${UID_TEST}" ]]
then
echo "Your UID does not match ${UID_TEST}."
exit 1
fi

# Display the username
USER_NAME=$(id -un)

# Test if the command succeeded
if [[ "${?}" -ne 0 ]]
then
echo 'The id command did not execute successfully.'
exit 1
fi
echo "Your username is ${USER_NAME}"
# Use a string test conditional
USER_NAME_TEST='vagrant'
if [[ "${USER_NAME}" = "${USER_NAME_TEST}" ]]
then
echo "Your username matches ${USER_NAME_TEST}."
fi

# Test for != (not equal) for the string
if [[ "${USER_NAME}" != "${USER_NAME_TEST}" ]]
then
echo "Your username does not match ${USER_NAME_TEST}."
exit 1
fi
exit 0



