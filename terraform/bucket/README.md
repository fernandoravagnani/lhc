# lhc
Uso do Terraform na Magalu Cloud

## Passo a passo

1. Crie uma key no https://id.magalu.com/api-keys para ser utilizada no código

2. Crie o arquivo `terraform.tfvars` e adicione as variáveis, ex:
```
mgc_api_key = "MGC_API_KEY"
mgc_obj_key_id = "MGC_OBJ_KEY_ID"
mgc_obj_key_secret = "MGC_OBJ_KEY_SECRET"
mgc_region_sudeste = "MGC_REGION_SUDESTE"
mgc_region_nordeste = "MGC_REGION_NORDESTE"
lhc_bucket = "LHC_BUCKET"
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

6. Obter a URL pública de acesso ao bucket, ex:
```
mgc object-storage buckets public-url --dst="lhc-bucket"
```

7. Acessar a página estática no browser (abrindo o index.html):
```
https://br-se1.magaluobjects.com/lhc-bucket/index.html
```