#!/bin/bash
: '
______________________________________________

               UsrMerge LXC Fix
               By Jordan Hillis
             jordan@hillis.email
           https://jordanhillis.com
______________________________________________

MIT License

Copyright (c) 2023 Jordan S. Hillis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
______________________________________________
'

# Script information
title="UsrMerge LXC Fix"
author="Jordan Hillis <jordan@hillis.email>"
version="1.0"

# Colors
bold=$(tput bold)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
reset=$(tput sgr0)

# Function to display the script header
display_header() {
    echo "${bold}----------------------------------------"
    echo "${green}$title"
    echo "${cyan}By $author"
    echo "Version: $version"
    echo "----------------------------------------${reset}"
}

# Function to modify the file by inserting 'exit;' at the 4th line
modify_file() {
    echo "${green}Modifying the convert-usrmerge file..."
    sed -i '4iexit;' "$convert_usrmerge_file"
    echo "Modification complete!${reset}"
}

# Function to undo the changes by removing the 'exit;' statement
undo_changes() {
    echo "${green}Undoing the changes made to the convert-usrmerge file..."
    sed -i '4d' "$convert_usrmerge_file"
    echo "Undo complete!${reset}"
}

# Display the script header
display_header

# Path to the convert-usrmerge file
convert_usrmerge_file="/usr/lib/usrmerge/convert-usrmerge"

# Prompt the user to choose an action
read -rp "${bold}Press [Enter] to modify the convert-usrmerge file or [Ctrl+C] to exit.${reset}"

# Modify the file
modify_file

echo "${bold}${cyan}Now you can attempt to update your system.${reset}"

# Prompt the user to undo the changes
read -rp "When finished press [Enter] to undo the changes made to the convert-usrmerge file.${reset}"

# Undo the changes
undo_changes

# Display completion message
echo "${green}Process completed.${reset}"
