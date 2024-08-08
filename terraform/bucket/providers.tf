variable "mgc_api_key" {}
variable "mgc_obj_key_id" {}
variable "mgc_obj_key_secret" {}
variable "mgc_region_sudeste" {}
variable "mgc_region_nordeste" {}
variable "lhc_bucket" {}

provider "mgc" {
  alias = "sudeste"
  region = var.mgc_region_sudeste
  api_key = var.mgc_api_key
  object_storage = {
    key_pair = {
      key_id = var.mgc_obj_key_id
      key_secret = var.mgc_obj_key_secret
    }
  }
}

provider "mgc" {
  alias = "nordeste"
  region = var.mgc_region_nordeste
  api_key = var.mgc_api_key
  object_storage = {
    key_pair = {
      key_id = var.mgc_obj_key_id
      key_secret = var.mgc_obj_key_secret
    }
  }
}

terraform {
  required_providers {
    mgc = {
      source = "magalucloud/mgc"
    }
  }
}