#!/bin/bash
VERSION=1.0.0
echo "Pushing RevCRM v$VERSION"
docker tag revcrm:latest gcr.io/macro-duality-233703/revcrm:$VERSION
docker push gcr.io/macro-duality-233703/revcrm:$VERSION
