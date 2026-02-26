#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f """${0}""")")

ADDRESS=${1:-localhost:8000}

source "${SCRIPT_DIR}/../../secrets/vllm/.env"

curl -v "http://${ADDRESS}/v1/models" \
	-H "Authorization: Bearer ${VLLM_API_KEY}" \
	| jq '.'

exit $?
