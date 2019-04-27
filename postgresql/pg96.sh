#!/bin/sh
# -e POSTGRES_PASSWORD=some_password  <-- Add this option to set initial password
docker run --rm -p 5432:5432 -v $PWD/data/data96:/var/lib/postgresql/data postgres:9.6