#!/bin/bash

BUIL_ID=$(codefresh get build --pipeline-name=guysalton-codefresh/docker-based-pipelines-webinar/aws-kiam-venona --revision ${{CF_REVISION}} -o json -l 1 | jq -r .id)
bash -c "while true; do echo Waiting for build https://g.codefresh.io/build/$BUIL_ID && sleep 30; done &"  
codefresh wait $BUIL_ID || true
cf_export BUILD_PASSED=$(codefresh get build $BUIL_ID -o json | jq -r .status)