Commerce Cloud Management CLI

Use the Commerce Cloud Management CLI to initiate build and deploy actions in Commerce Cloud outside of the Cloud Portal.

Installation Instructions
* Prerequisites: sapmachine11 is installed and configured on your machine.
* Unpack the zip file to convenient location.
* The bin/ directory contains sapccm starter scripts for Windows, Linux and MacOS.
* To verify the installation, run sapccm --help in the bin/ directory. The help content should display.
* You need to provide an API token for remote commands to work. Use the command  "sapccm config set auth-credentials {TOKEN_VALUE}". 
For more information on generating tokens, see Security>API Tokens in the Cloud Portal help at https://help.sap.com/viewer/0fa6bcf4736c46f78c248512391eb467/SHIP/en-US. 

CLI Help
Use the --help command to find a list of valid commands. The help includes an explanation of the command and the valid syntax.
