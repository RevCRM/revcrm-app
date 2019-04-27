#!/bin/bash
docker tag revcrm:latest gcr.io/macro-duality-233703/revcrm:$1
docker push gcr.io/macro-duality-233703/revcrm:$1
