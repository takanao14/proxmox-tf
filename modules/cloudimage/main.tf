
resource "proxmox_vm_qemu" "cimage" {

  for_each = var.vms

  name        = each.key
  target_node = each.value.node

  clone       = each.value.template
  os_type     = "cloud-init"
  boot        = "order=virtio0"

  sockets     = each.value.sockets
  cores       = each.value.cores
  memory      = each.value.memory

  cloudinit_cdrom_storage = each.value.storage
  ipconfig0               = "ip=${each.value.ip4},gw=${var.ip4gw}"
  nameserver              = var.nameserver
  ciuser                  = var.user
  cipassword              = var.passwd
  sshkeys                 = var.ssh_keys

  scsihw      = "virtio-scsi-pci"

  disks {
    virtio {
      virtio0 {
        disk {
          size    = each.value.disk_size
          storage = each.value.storage
        }
      }
    }
  }

  network {
    bridge  = "vmbr0"
    model   = "virtio"
  }

}
