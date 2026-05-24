#!/bin/bash

ADDRESS=${1:-localhost:8000}

curl -vf "http://${ADDRESS}/health"

exit $?
