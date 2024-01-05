# PS-ProxmoxDeployFromClone

 I couldn't figure out how to make the ansible module (community.general.proxmox module) idempotent when you make a hardware change. By the I mean, when you make a change to ipconfigN or netN it always reports as a change. Anyhow, I like using powershell so I made a VM deployment from clone. Nothing ground breaking...

This was build with the intention of running it from ansible so you can pass all the variabled.
 ```powershell
 ./Build.ps1 -NodeFQDN {{ node_fqdn }} -Name {{ Name }} -VMID {{ VMID }} -Node {{ Node }} -password '{{ pwsh_password }}' -memory {{ memory }} -sockets {{ sockets }} -ipconfig0 {{ ipconfig0 }} -ipconfig1 {{ ipconfig1 }} -net1 {{ net1 }} -Username {{ Username }} -TokenName {{ TokenName }} -Token {{ Token }}
 ```