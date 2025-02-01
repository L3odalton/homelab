resource "proxmox_vm_qemu" "srv-test" {
    name = "srv-test"
    desc = "TF Test"
    vmid = "100248"
    target_node = "pve-s13-02"

    clone = "ubuntu-cloud-init-2"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 4096

    os_type = "cloud-init"
    ipconfig0 = "ip=10.0.100.248/24,gw=10.0.100.1"

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