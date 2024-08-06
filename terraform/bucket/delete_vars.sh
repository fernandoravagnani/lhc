#!/bin/bash

# Gerar o arquivo terraform.tfvars
cat <<EOF > terraform.tfvars
mgc_api_key = "MGC_API_KEY"
mgc_obj_key_id = "MGC_OBJ_KEY_ID"
mgc_obj_key_secret = "MGC_OBJ_KEY_SECRET"
mgc_region = "MGC_REGION"
mgc_env = "MGC_ENV"
EOF