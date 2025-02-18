# User Creation Script

This script automates the creation of user accounts on a Linux system based on information stored in a CSV file. It is designed for system administrators who need to onboard multiple users efficiently.

## Features

- Reads user data (username and full name) from a CSV file.
- Generates secure random passwords for each user.
- Creates new user accounts with specified usernames and full names.
- Forces users to change their password upon first login for enhanced security.
- Outputs user details and saves username-password pairs to an output file.

## Requirements

- The script must be executed with root privileges.
- The `openssl` package must be installed to generate random passwords.

## Usage

1. **Prepare the CSV File**: Create a CSV file named `employee.csv` in the same directory as the script. The CSV file should have the following format:

    ```
    username1,Full Name 1
    username2,Full Name 2
    ...
    ```

2. **Run the Script**: Execute the script using the following command:

    ```bash
    sudo ./Script.sh
    ```

 
3. **Check Output**: After running the script, the usernames and their generated passwords will be logged in `out.txt`. 

## Example CSV File

```csv
jdoe,John Doe
asmith,Alice Smith
bwhite,Bob White