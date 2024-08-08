resource "mgc_virtual_machine_instances" "lhc_vm" {
  provider = mgc.sudeste
  name     = "lhc_vm"
  machine_type = {
    name = "cloud-bs1.xsmall"
  }
  image = {
    name = "cloud-ubuntu-22.04 LTS"
  }
  network = {
    associate_public_ip = true
    delete_public_ip    = true
    interface = {
      security_groups = [{ id = mgc_network_security_groups.web_server.id }]
    }
  }
  ssh_key_name = "fp_ravagnani"
  depends_on = [mgc_network_rules.allow_ssh]
}

resource "null_resource" "deploy_lhc_vm" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Iniciando deploy do nginx na instância: ${mgc_virtual_machine_instances.lhc_vm.name}"
      ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@${mgc_virtual_machine_instances.lhc_vm.network.public_address} << 'EOF'
        sudo apt -qq update
        sudo apt -qq install -y nginx
      EOF
    EOT
  }
  depends_on = [
    mgc_virtual_machine_instances.lhc_vm,
    mgc_network_rules.allow_ssh
  ]
}

resource "mgc_dbaas_instances" "lhc_dbaas" {
  flavor_id = "8bbe8e01-40c8-4d2b-80e8-189debc44b1c"
  name = "lhc_dbaas"
  user = var.db_username
  password = var.db_password
  engine_id = "063f3994-b6c2-4c37-96c9-bab8d82d36f7"
  volume = {
    size = 10
    type = "CLOUD_NVME_15K"
  }
}

output "lhc_vm_id" {
  value = mgc_virtual_machine_instances.lhc_vm.id
}

output "lhc_vm_private_ip" {
  value = mgc_virtual_machine_instances.lhc_vm.network.private_address
}

output "lhc_vm_public_ip" {
  value = mgc_virtual_machine_instances.lhc_vm.network.public_address
}

output "lhc_dbaas_id" {
  value = mgc_dbaas_instances.lhc_dbaas.id
}

output "lhc_dbaas_private_ip" {
  value = mgc_dbaas_instances.lhc_dbaas.addresses
}
