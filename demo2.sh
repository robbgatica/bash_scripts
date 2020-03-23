#!/bin/bash

# Display the UID and username of the user executing this script.
# Display if the user is the root user or not

# Display the ID
echo "Your UID is ${UID}"

# Display the username
# The output of bash commands/builtins is stored to variables  using $() format
USER_NAME=$(id -un)
echo "Your username is ${USER_NAME}"

# Display if user is root or not
# See the 'test' man page for more about conditional tests (-eq, -lt, etc)
if [[ "${UID}" -eq 0 ]]
then
echo 'You are root'
else
echo 'You are not root'
fi
