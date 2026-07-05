# Minecraft Modpack

This repo is configured to use a Dev Container for Minecraft modpack development.

## Packwiz setup

The `.devcontainer/devcontainer.json` file installs Packwiz on container create/rebuild by downloading the latest `packwiz.jar` and creating a `/usr/local/bin/packwiz` wrapper.

### To use Packwiz

1. Open this workspace in the Dev Container.
2. Run `Dev Containers: Rebuild Container` in VS Code.
3. Verify installation:
   ```bash
   command -v packwiz
   packwiz --version
   ```

### If Packwiz is not found

- Make sure you are inside the Dev Container and not in the local host shell.
- Rebuild/reopen the container again.
- If needed, check `.devcontainer/devcontainer.json` for the install commands.



### startup guide for host PC - SSH remote Tunneling:

1. start up the ssh agent to allow vm to see public ssh key. on host pc.
   run the following on host terminal:
	Start-Service ssh-agent

2. add the private key to the windows agent so that host pc can confirm vm's authentication
   run the following on host terminal:
	ssh-add

3. start vm

4. tunnel into vm using remote-ssh extension in host-pc's vscode instance

5. 

optional-shut-off: 
   run the following on host terminal:
	Stop-Service ssh-agent


# System Architecture & Security Audit
Development ChoiceSecurity StrengthPotential Weakness or VulnerabilityUsing a Linux VM SandboxMalicious code (like rogue NPM/Python packages) is physically trapped and cannot infect your Windows host OS.Resource Overhead: The GUI (GNOME) uses unnecessary memory and causes the shutdown hangs you experienced.NAT Network AdapterThe VM is hidden from your local home network (router) but can still safely download internet packages.Outbound Exfiltration: If malicious code runs in the VM, it still has internet access to send your data outward.Key Stored on WindowsIf the VM gets hacked or corrupted, the attacker gets nothing. Your private key never touches the VM disk.Single point of failure on Windows; if Windows gets malware, the key is exposed.Manual ssh-agent StartupGuarantees absolute 0% CPU/RAM footprint when the service is stopped.Minor workflow friction; relies on you remembering to manually kill the service.Bypassing Workspace TrustAllows full VS Code extension features to work immediately.If you clone a malicious repo, VS Code will execute its background scripts inside the VM.The Biggest Technical Vulnerability: Agent ForwardingThe most advanced security choice we made was using ForwardAgent yes in VS Code to pipe your Windows key into the VM. While this keeps the actual key file completely safe on Windows, it introduces a specific vulnerability known as SSH Agent Hijacking.How the vulnerability works:When you are actively connected to the VM with VS Code, Windows creates a temporary "socket" (an invisible pipe) inside the Linux system.If you accidentally download a malicious virus into your VM, and that virus gains root (administrator) access, it cannot steal your key file.However, it can find that invisible pipe and use it to authenticate to GitHub as you, but only while your VS Code connection is actively open. The second you close VS Code, the pipe vanishes and they lose access.
