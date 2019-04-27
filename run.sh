#!/bin/bash
set -x
docker run --rm -it -v $PWD/odoo-addons:/mnt/odoo-addons:z -v $PWD/odoo-data:/mnt/odoo-data:z -p 8069:8069 --env-file=odoo.env revcrm $@
