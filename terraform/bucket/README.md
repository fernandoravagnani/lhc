# lhc
Uso do Terraform na Magalu Cloud

## Passo a passo

1. Crie uma key no https://id.magalu.com/api-keys 

2. Atualize as variáveis do terraform.tfvars

3. Execute o terraform
```
terraform init
terraform plan
terraform apply
```

4. Obter a URL pública de acesso ao bucket, ex:
```
mgc object-storage buckets public-url --dst="lhc-bucket"
```

5. Acessar a página estática no browser (abrindo o index.html):
```
https://br-se1.magaluobjects.com/lhc-bucket/index.html
```