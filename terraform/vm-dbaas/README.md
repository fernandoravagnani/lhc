# lhc
Uso do Terraform na Magalu Cloud

## Passo a passo

1. Crie uma key no https://id.magalu.com/api-keys para ser utilizada no código

2. Crie o arquivo `terraform.tfvars` e adicione as variáveis, ex:
```
mgc_api_key = "MGC_API_KEY"
mgc_api_key_id = "MGC_API_KEY_ID"
mgc_api_key_secret = "MGC_API_KEY_SECRET"
mgc_region = "MGC_REGION"
mgc_env = "MGC_ENV"
vm_size = "VM_SIZE"
db_username = "DB_USERNAME"
db_password = "DB_PASSWORD"
```

3. Instale o cli-mgc https://docs.magalu.cloud/docs/cli-mgc/how-to/download-and-install e faça o login:
```
mgc auth login
```
4. Configure o cli-mgc para utilizar a key (recentemente criada) para interagir com o bucket
```
mgc object-storage api-key list
mgc object-storage api-key set --uuid xxx-xxx-xxx
```

5. Execute o terraform
```
terraform init
terraform plan
terraform apply
```