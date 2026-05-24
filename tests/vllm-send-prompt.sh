#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f """${0}""")")

PROMPT=${1:-Make a joke, in one sentence}
MAX_TOKENS=${2:-100}
MODEL_NAME=${3:-Qwen/Qwen2.5-3B-Instruct}
ADDRESS=${4:-localhost:8000}

source "${SCRIPT_DIR}/../../secrets/vllm/.env"

curl -v "http://${ADDRESS}/v1/chat/completions" \
	-H "Authorization: Bearer ${VLLM_API_KEY}" \
	-H "Content-Type: application/json" \
	-d "{
	  \"model\": \"${MODEL_NAME}\",
	  \"messages\": [
	    {\"role\": \"user\", \"content\": \"${PROMPT}\"}
	  ],
	  \"max_tokens\": ${MAX_TOKENS}
	}" \
	| jq '.'
