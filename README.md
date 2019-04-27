# RevCRM Odoo Application Server

This repository contains our customised docker image and addons

## Configuration

Our docker image uses environment variables for database credentials

You'll need to create a `odoo.env` file before running the scripts below
(you can copy *odoo.env-example* to do this)

The repository uses two docker *volumes*:

* **odoo-addons** - *(mounted at /mnt/odoo/addons)* - RevCRM odoo addons
* **odoo-data** - *(mounted at /mnt/odoo/data)* - Odoo filestore and session storage

## Scripts

```bash
# Build the revcrm docker image
./build.sh

# Run the docker image - default configuration
./run.sh

# Run with a specific database
./run.sh odoo-start -d db_name

# Run and initialise a new database (with demo data disabled)
./run.sh odoo-start -d db_name -i base --without-demo=all

# Run the container and access the terminal
./run.sh bash
```

## Odoo Notes

### Debug Modes

Developer Mode: `/web?debug`
Assets Debug Mode: `/web?debug=assets` (serves assets individually on the fly)

### Resolving missing asset issues

Web assets are held in the filestore and referenced from `ir_attachment` database table

Run the following SQL on the database to reset the asset cache:

```sql
-- Delete ALL attachments
DELETE FROM ir_attachment;
```

Now run the server with -u base (example below works in the container)

```bash
./entrypoint.sh odoo-start --no-http -d intcrm -u base
```
