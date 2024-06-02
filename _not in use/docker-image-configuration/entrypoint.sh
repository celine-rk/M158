#!/bin/bash
envs=(
  MOODLE_DB_TYPE
  MOODLE_DB_HOST
  MOODLE_DB_PORT
  MOODLE_DB_NAME
  MOODLE_DB_USER
  MOODLE_DB_PASSWORD
  MOODLE_DB_PREFIX
  MOODLE_WWW_ROOT
  MOODLE_DATA_ROOT
)

# Check if all environment variables are set
for env in "${envs[@]}"; do
  if [ -z "${!env}" ]; then
    echo "Error: $env is not set"
    exit 1
  fi
done

# Create Moodle config file
cat <<EOL > /var/www/html/moodle/config.php
<?php
unset(\$CFG);
global \$CFG;
\$CFG = new stdClass();
\$CFG->dbtype    = getenv('MOODLE_DB_TYPE');
\$CFG->dblibrary = 'native';
\$CFG->dbhost    = getenv('MOODLE_DB_HOST');
\$CFG->dbname    = getenv('MOODLE_DB_NAME');
\$CFG->dbuser    = getenv('MOODLE_DB_USER');
\$CFG->dbpass    = getenv('MOODLE_DB_PASSWORD');
\$CFG->prefix    = getenv('MOODLE_DB_PREFIX');
\$CFG->wwwroot   = getenv('MOODLE_WWW_ROOT');
\$CFG->dataroot  = getenv('MOODLE_DATA_ROOT');
\$CFG->admin     = 'admin';

\$CFG->directorypermissions = 02777;

require_once(__DIR__ . '/lib/setup.php');
EOL

# Ensure the web server is running
service apache2 restart

# Execute the command passed to the Docker run command
exec "$@"
