variable "mgc_api_key" {}
variable "mgc_obj_key_id" {}
variable "mgc_obj_key_secret" {}
variable "mgc_region" {}
variable "mgc_env" {}

resource "mgc_object_storage_buckets" "lhc-bucket" {
  provider          = mgc.sudeste
  bucket            = "lhc-bucket"
  enable_versioning = true
  recursive         = true 
  bucket_is_prefix  = false
  public_read       = true
}

resource "null_resource" "upload_files" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Iniciando cópia dos arquivos para o bucket: ${mgc_object_storage_buckets.lhc-bucket.bucket}"
      mgc object-storage objects upload-dir --dst="${mgc_object_storage_buckets.lhc-bucket.bucket}/" --src="files/" --storage-class="cold"

      echo "Definindo permissão public-read para index.html"
      mgc object-storage objects acl set --dst="${mgc_object_storage_buckets.lhc-bucket.bucket}/index.html" --public-read
    EOT
  }
  triggers = {
    always_run = "${timestamp()}"
  }
  depends_on = [mgc_object_storage_buckets.lhc-bucket]
}

output "bucket_name" {
  value       = mgc_object_storage_buckets.lhc-bucket.bucket
}

output "uploaded_files" {
  value = [
    for file in fileset("files", "**/*"): file
  ]
}