resource "proxmox_lxc" "basic" {
  target_node  = "pve-s13-01"
  ostemplate   = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
  cores        = 1
  hostname     = "srv-beszel"
  memory       = 512
  password     = var.lxc_password
  onboot       = true
  vmid         = 100251
  unprivileged = true

  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFuOhwlgxLF/4v06qha9jPQ4egOaW2nUFlC7988tPh9X
  EOT

  rootfs {
    storage = "local-lvm"
    size    = "6G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "10.0.100.251/24"
  }
}