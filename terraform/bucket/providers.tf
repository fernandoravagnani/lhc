provider "mgc" {
  alias = "sudeste"
  region = var.mgc_region
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
  #backend "s3" {
  #  bucket                      = "terraform-state-lhc"
  #  key                         = "terraform.tfstate"
  #  #secret_key                  = local.mgc_key_secret
  #  #access_key                  = local.mgc_key_id
  #  region                      = "br-se1"
  #  skip_region_validation      = true
  #  skip_credentials_validation = true
  #  skip_metadata_api_check     = true
  #  endpoint                    = "https://br-se1.magaluobjects.com"
  #}
}