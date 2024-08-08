variable "mgc_api_key" {}
variable "mgc_api_key_id" {}
variable "mgc_api_key_secret" {}
variable "mgc_region" {}
variable "mgc_env" {}
variable "vm_size" {}
variable "db_username" {}
variable "db_password" {}

provider "mgc" {
  alias = "sudeste"
  region = "br-se1"
  api_key = "a250d8ec-f5ed-4aac-aaba-6d7445dfa8e7"
}

provider "mgc" {
  alias = "nordeste"
  region = "br-ne1"
  api_key = "a250d8ec-f5ed-4aac-aaba-6d7445dfa8e7"
}

terraform {
  required_providers {
    mgc = {
      source = "magalucloud/mgc"
    }
  }
}