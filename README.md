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
