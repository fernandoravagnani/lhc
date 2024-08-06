#!/bin/bash

# Criar as variáveis de ambiente no SO
source .env

# Ler as variáveis de ambiente do SO
MGC_API_KEY=${MGC_API_KEY}
MGC_OBJ_KEY_ID=${MGC_OBJ_KEY_ID}
MGC_OBJ_KEY_SECRET=${MGC_OBJ_KEY_SECRET}
MGC_REGION=${MGC_REGION}
MGC_ENV=${MGC_ENV}

# Gerar o arquivo terraform.tfvars
cat <<EOF > terraform.tfvars
mgc_api_key = "${MGC_API_KEY}"
mgc_obj_key_id = "${MGC_OBJ_KEY_ID}"
mgc_obj_key_secret = "${MGC_OBJ_KEY_SECRET}"
mgc_region = "${MGC_REGION}"
mgc_env = "${MGC_ENV}"
EOF