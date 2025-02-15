resource "proxmox_vm_qemu" "srv-beszel" {
    name = "srv-beszel"
    target_node = "pve-s13-01"
    vmid = "100251"
    desc = "VM used for running beszel"
    bios = "ovmf"
    onboot = true
    vm_state = "running"
    agent = 1
    clone_id = "7001"
    full_clone = true
    scsihw = "virtio-scsi-pci"
    cores = 1
    sockets = 1
    cpu_type = "host"
    memory = 1024
    automatic_reboot = true

    os_type = "cloud-init"
    cicustom = "vendor=local:snippets/qemu-guest-agent.yml"
    ciuser = "mgrsys"
    ciupgrade = true
    searchdomain = "local.darksaber.fyi"
    nameserver = "10.0.100.1"
    ipconfig0 = "ip=10.0.100.251/24,gw=10.0.100.1"
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK43atgPI2XVBwvSM5hGhbeokxgKuetThnThHEJRMiAK
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFuOhwlgxLF/4v06qha9jPQ4egOaW2nUFlC7988tPh9X
    EOF

    network {
        id = 0
        bridge = "vmbr0"
        model  = "virtio"
    }

    disks {
        scsi {
            scsi0 {
                disk {
                    storage = "local-lvm"
                    size    = "20G" 
                }
            }
        }
        ide {
            ide1 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
    }
}