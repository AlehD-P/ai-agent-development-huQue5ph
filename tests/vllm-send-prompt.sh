#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f """${0}""")")

PROMPT=${1:-Make a joke, in one sentence}
MODEL_NAME=${2:-Qwen/Qwen2.5-3B-Instruct}
ADDRESS=${3:-localhost:8000}

source "${SCRIPT_DIR}/../../secrets/vllm/.env"

curl -v "http://${ADDRESS}/v1/chat/completions" \
	-H "Authorization: Bearer ${VLLM_API_KEY}" \
	-H "Content-Type: application/json" \
	-d "{
	  \"model\": \"${MODEL_NAME}\",
	  \"messages\": [
	    {\"role\": \"user\", \"content\": \"${PROMPT}\"}
	  ],
	  \"max_tokens\": 100
	}" \
	| jq '.'
