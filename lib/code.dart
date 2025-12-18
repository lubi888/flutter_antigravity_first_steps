const String goHelloCode =
    ('package main\n\n'
    'import "fmt"\n\n'
    'func main() {\n'
    '\t\t\t\tfmt.Printf("hello golang\\n")\n'
    '\t\t\t\tfmt.Println("hello golang on windows, apple, linux.")\n'
    '}');

const String goPowerShell =
    ('Windows PowerShell\n\n'
    'Copyright (C) Microsoft Corporation. All rights reserved.\n\n'
    'Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows\n\n'
    'PS C:\\Users\\adam>go env\n\n'
    'PS C:\\Users\\adam>');

const String goInstallLinux =
    ('Linux\n\n'
    '1, Remove any previous Go installation by deleting the /usr/local/go folder (if it exists), then extract the archive you just downloaded into /usr/local, creating a fresh Go tree in /usr/local/go:\n\n'
    '\t\t\$ rm -rf /usr/local/go && tar -C /usr/local -xzf go1.25.5.linux-amd64.tar.gz\n\n'
    '(You may need to run each command separately with the necessary permissions, as root or through sudo.)\n\n'
    'Do not untar the archive into an existing /usr/local/go tree. This is known to produce broken Go installations.\n\n'
    '2 Add /usr/local/go/bin to the PATH environment variable.\n\n'
    'You can do this by adding the following line to your \$HOME/.profile or /etc/profile (for a system-wide installation):\n\n'
    '\t\texport PATH=\$PATH:/usr/local/go/bin\n\n'
    'Note: Changes made to a profile file may not apply until the next time you log into your computer. To apply the changes immediately, just run the shell commands directly or execute them from the profile using a command such as source \$HOME/.profile.\n\n'
    '3, Verify that you\'ve installed Go by opening a command prompt and typing the following command:\n\n'
    '\t\t\$ go version'
    '4, Confirm that the command prints the installed version of Go.');

const String goInstallMac =
    ('1, Open the package file you downloaded and follow the prompts to install Go.\n\n'
    'The package installs the Go distribution to /usr/local/go. The package should put the /usr/local/go/bin directory in your PATH environment variable. You may need to restart any open Terminal sessions for the change to take effect.\n\n'
    '2, Verify that you\'ve installed Go by opening a command prompt and typing the following command:\n\n'
    '\t\t\$ go version\n\n'
    '3, Confirm that the command prints the installed version of Go.');

const String goInstallWindows =
    ('1, Open the MSI file you downloaded and follow the prompts to install Go.\n\n'
    'By default, the installer will install Go to Program Files or Program Files (x86). You can change the location as needed. After installing, you will need to close and reopen any open command prompts so that changes to the environment made by the installer are reflected at the command prompt.\n\n'
    '2, Verify that you\'ve installed Go.\n\n'
    '1, In Windows, click the Start menu.\n\n'
    '2, In the menu\'s search box, type cmd, then press the Enter key.\n\n'
    '3, In the Command Prompt window that appears, type the following command\:\n\n'
    '\t\t\$ go version\n\n'
    '4, Confirm that the command prints the installed version of Go.');
