#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f """${0}""")")

ADDRESS=${1:-localhost:4000}
MODEL_NAME=${2:-Qwen/Qwen2.5-3B-Instruct}

source "${SCRIPT_DIR}/../../secrets/litellm/.env"

curl -v "http://${ADDRESS}/v1/chat/completions" \
	-H "Authorization: Bearer ${LITELLM_MASTER_KEY}" \
	-H "Content-Type: application/json" \
	-d '{
	  "model": "'"${MODEL_NAME}"'",
	  "messages": [
	    {"role": "user", "content": "Make a joke, in one sentence."}
	  ],
	  "max_tokens": 100
	}' \
	| jq '.'
