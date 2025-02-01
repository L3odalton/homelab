resource "proxmox_vm_qemu" "srv-test" {
    name = "srv-test"
    target_node = "pve-s13-02"
    vmid = "100248"
    desc = "TF Test"
    bios = "ovmf"
    onboot = true
    vm_state = "running"
    agent = 1
    clone_id = "7002"
    full_clone = true
    scsihw = "virtio-scsi-pci"
    cores = 2
    sockets = 1
    cpu_type = "host"
    memory = 4096

    os_type = "cloud-init"
    ipconfig0 = "ip=10.0.100.248/24,gw=10.0.100.1"
    ciuser = "mgrsys"
    ciupgrade = true
    searchdomain = "local.darksaber.fyi"
    nameserver = "10.0.100.1"
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