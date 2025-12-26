import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_antigravity_first_steps/code.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _linuxKey = GlobalKey();
  final GlobalKey _macKey = GlobalKey();
  final GlobalKey _windowsKey = GlobalKey();
  final GlobalKey _multipleInstallationsKey = GlobalKey();
  final GlobalKey _uninstallKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://go.dev/doc/install');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch \$url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golang Installation Guides'),
        actions: [
          TextButton(
            onPressed: _launchUrl,
            child: Text(
              'https://go.dev/doc/install',
              style: const TextStyle(
                color: Colors.teal, // Changed to teal
                decoration: TextDecoration.underline,
                fontSize: 18.0, // Ensure a readable font size
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0, // horizontal gap between adjacent items
              runSpacing: 4.0, // vertical gap between lines
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _scrollToSection(_linuxKey),
                  child: const Text('Linux'),
                ),
                ElevatedButton(
                  onPressed: () => _scrollToSection(_macKey),
                  child: const Text('Mac'),
                ),
                ElevatedButton(
                  onPressed: () => _scrollToSection(_windowsKey),
                  child: const Text('Windows'),
                ),
                ElevatedButton(
                  onPressed: () => _scrollToSection(_multipleInstallationsKey),
                  child: const Text('Multiple Installations'),
                ),
                ElevatedButton(
                  onPressed: () => _scrollToSection(_uninstallKey),
                  child: const Text('Uninstall'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSection(
                        key: _linuxKey,
                        title: 'Golang Installation on Linux',
                        content:
                            '''
### Method 1: Using Official Binary Release

1.  **Download the Archive:**
    Go to the official Golang website (golang.org/dl) and download the latest Linux tarball (e.g., `go1.x.x.linux-amd64.tar.gz`).

2.  **Extract to /usr/local:**
    Open your terminal and extract the archive to `/usr/local`:
    ```bash
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf go1.x.x.linux-amd64.tar.gz
    ```
    (Replace `go1.x.x.linux-amd64.tar.gz` with the actual filename.)

3.  **Set Environment Variables:**
    Add `/usr/local/go/bin` to your `PATH` environment variable. You can do this by adding the following line to `~/.profile` or `~/.bashrc` (or `~/.zshrc` if you use Zsh):
    ```bash
    export PATH=\$PATH:/usr/local/go/bin
    ```
    Then, apply the changes:
    ```bash
    source ~/.profile
    # or source ~/.bashrc / source ~/.zshrc
    ```

4.  **Verify Installation:**
    Check the Go version:
    ```bash
    go version
    ```

### Method 2: Using Package Manager (e.g., APT for Debian/Ubuntu)

1.  **Update Package List:**
    ```bash
    sudo apt update
    ```

2.  **Install Go:**
    ```bash
    sudo apt install golang-go
    ```

3.  **Verify Installation:**
    ```bash
    go version
    ```
    Note: The version from package managers might not be the absolute latest.

### Method 3: From `code.dart`

$goInstallLinux
''',
                      ),
                      const SizedBox(height: 40),
                      _buildSection(
                        key: _macKey,
                        title: 'Golang Installation on macOS',
                        content: '''
### Method 1: Using Homebrew (Recommended)

1.  **Install Homebrew (if not already installed):**
    Open Terminal and run:
    ```bash
    /bin/bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

2.  **Install Go:**
    ```bash
    brew install go
    ```

3.  **Verify Installation:**
    ```bash
    go version
    ```

### Method 2: Using Official Installer

1.  **Download the Installer:**
    Go to the official Golang website (golang.org/dl) and download the macOS installer package (`.pkg` file).

2.  **Run the Installer:**
    Double-click the downloaded `.pkg` file and follow the on-screen instructions. This will install Go to `/usr/local/go`.

3.  **Set Environment Variables (if necessary):**
    The installer usually sets the `PATH` for you. If `go version` doesn't work, add `/usr/local/go/bin` to your `PATH` in `~/.zshrc` or `~/.bash_profile`:
    ```bash
    export PATH=\$PATH:/usr/local/go/bin
    ```
    Then, apply the changes:
    ```bash
    source ~/.zshrc
    # or source ~/.bash_profile
    ```

4.  **Verify Installation:**
    ```bash
    go version
    ```
''',
                      ),
                      const SizedBox(height: 40),
                      _buildSection(
                        key: _windowsKey,
                        title: 'Golang Installation on Windows',
                        content: '''
### Method 1: Using Official Installer (Recommended)

1.  **Download the Installer:**
    Go to the official Golang website (golang.org/dl) and download the Windows MSI installer.

2.  **Run the Installer:**
    Double-click the downloaded `.msi` file and follow the prompts. The installer will install Go to `C:\\Go` by default and set up the `PATH` environment variable.

3.  **Verify Installation:**
    Open a new Command Prompt or PowerShell window and type:
    ```bash
    go version
    ```

### Method 2: Using Chocolatey Package Manager

1.  **Install Chocolatey (if not already installed):**
    Open PowerShell as Administrator and run the command from chocolatey.org/install.

2.  **Install Go:**
    ```powershell
    choco install go -y
    ```

3.  **Verify Installation:**
    Open a new Command Prompt or PowerShell window and type:
    ```bash
    go version
    ```
''',
                      ),
                      const SizedBox(height: 40),
                      _buildSection(
                        key: _multipleInstallationsKey,
                        title: 'Multiple Go Installations',
                        content: '''
You can install multiple Go versions on the same machine. For example, you might want to test your code on multiple Go versions. For a list of versions you can install this way, see the download page.

Note: To install using the method described here, you'll need to have git installed.

To install additional Go versions, run the go install command, specifying the download location of the version you want to install. The following example illustrates with version 1.10.7:

```
\$ go install golang.org/dl/go1.10.7@latest
\$ go1.10.7 download
```

To run go commands with the newly-downloaded version, append the version number to the go command, as follows:

```
\$ go1.10.7 version
go version go1.10.7 linux/amd64
```

When you have multiple versions installed, you can discover where each is installed, look at the version's GOROOT value. For example, run a command such as the following:

```
\$ go1.10.7 env GOROOT
```

To uninstall a downloaded version, just remove the directory specified by its GOROOT environment variable and the goX.Y.Z binary.
''',
                      ),
                      const SizedBox(height: 40),
                      _buildSection(
                        key: _uninstallKey,
                        title: 'Uninstalling Go',
                        content: '''
You can remove Go from your system using the steps described in this topic.

#### REMOVING USER CONFIG AND DATA

Go stores user configuration in the go directory within the user configuration directory, as returned by os.UserConfigDir. This can also be found as the directory containing the config file returned by go env GOENV.

Go stores intermediate build artifacts in the directory returned by go env GOCACHE. These can be removed with go clean -cache.

Go stores downloaded dependencies in the directory returned by go env GOMODCACHE. These can be removed with go clean -modcache.

#### LINUX / MACOS / FREEBSD

1. Delete the go directory.
   This is usually /usr/local/go.
2. Remove the Go bin directory from your PATH environment variable.
   Under Linux and FreeBSD, edit /etc/profile or \$HOME/.profile. If you installed Go with the macOS package, remove the /etc/paths.d/go file.

#### WINDOWS

The simplest way to remove Go is via Add/Remove Programs in the Windows control panel:

1. In Control Panel, double-click Add/Remove Programs.
2. In Add/Remove Programs, select Go Programming Language, click Uninstall, then follow the prompts.

For removing Go with tools, you can also use the command line:

* Uninstall using the command line by running the following command:

```
msiexec /x go{{version}}.windows-{{cpu-arch}}.msi /q
```

Note: Using this uninstall process for Windows will automatically remove Windows environment variables created by the original installation.
''',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required GlobalKey key,
    required String title,
    required String content,
  }) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(content, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
