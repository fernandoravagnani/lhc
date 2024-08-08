resource "mgc_network_security_groups" "web_server" {
  name        = "web_server"
  description = "security group para servidores web"

}

resource "mgc_network_rules" "allow_http" {
  security_group_id = mgc_network_security_groups.web_server.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_max    = "80"
  port_range_min    = "80"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "mgc_network_rules" "allow_https" {
  security_group_id = mgc_network_security_groups.web_server.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_max    = "443"
  port_range_min    = "443"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "mgc_network_rules" "allow_ssh" {
  security_group_id = mgc_network_security_groups.web_server.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_max    = "22"
  port_range_min    = "22"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}