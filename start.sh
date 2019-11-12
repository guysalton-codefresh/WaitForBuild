#!/bin/bash

echo "the context of my CLI is:"
codefresh auth current-context

BUIL_ID=$(codefresh get build --pipeline-name=${PIPELINE_NAME} --revision ${CF_REVISION} -o json -l 1 | jq -r .id)

echo ${PIPELINE_NAME}

while true; do echo Waiting for build https://g.codefresh.io/build/$BUIL_ID && sleep 30; done &"

codefresh wait $BUIL_ID || true

cf_export BUILD_PASSED=$(codefresh get build $BUIL_ID -o json | jq -r .status)
