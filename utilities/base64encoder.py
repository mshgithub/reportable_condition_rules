############################################################################
##                 Utility to base64 encode a file                        ##
##                                                                        ##
##  Usage                                                                 ##
##  Commandline arguments:                                                ##
##  python encode_cql.py /path/to/files filename.fil                      ##
##                                                                        ##
##  User provided runtime arguments:                                      ##
##  python encode_cql.py                                                  ##
############################################################################

import base64
import os
import sys

def get_file_path():
    # If both path and filename are provided as command-line arguments
    if len(sys.argv) >= 3:
        file_path = sys.argv[1]
        file_name = sys.argv[2]
    else:
        # Otherwise prompt the user
        file_path = input("Enter the directory path: ").strip()
        file_name = input("Enter the file name (with extension): ").strip()
    
    return os.path.join(file_path, file_name)

def main():
    full_path = get_file_path()

    try:
        with open(full_path, "r", encoding="utf-8") as f:
            cql_text = f.read()

        encoded_cql = base64.b64encode(cql_text.encode("utf-8")).decode("utf-8")
        print(encoded_cql)

    except FileNotFoundError:
        print(f"Error: File '{full_path}' not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
