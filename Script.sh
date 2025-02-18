#!/bin/bash

# Define the CSV file containing employee information
CSV_FILE="employee.csv"

# Check if the script is run as root
if [ "$UID" -ne 0 ]
then
        echo "This script must be run as root."
        exit 1
fi

# Check if the CSV file exists
if [ ! -f "$CSV_FILE" ]
then
        echo "CSV file not found: $CSV_FILE"
        exit 1
fi

# Read the CSV file line by line
while IFS=, read -r username full_name
do
        # Generate a random password using openssl 
        password=$(openssl rand -base64 12)

        # Create a new user with the specified username and full name
        useradd -m -c "$full_name" "$username"
        
        # Set the user's password
        echo "$username:$password" | chpasswd

        # Force the user to change their password on first login
        chage -d 0 "$username"

        # Output user creation details
        echo "User created: $username"
        echo "Full Name: $full_name"
        echo "Random Password: $password"
        echo "---------------------------"

        # Append the username and password to the output file
        echo "$username, $password" >> out.txt
done < "$CSV_FILE"

# Final message indicating completion
echo "Hello $username Your account creation completed successfully!"