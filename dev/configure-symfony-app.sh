#!/bin/sh

cd /var/www

COMPOSER_BIN=$(/usr/bin/env composer)

# Run Composer
if [ -f "composer.phar" ]; then
    COMPOSER_BIN="php composer.phar"
fi
$COMPOSER_BIN install

# Cache clear
rm -rf app/cache/*

# Symfony2 actions
php app/console doctrine:database:create --env=dev --no-interaction
php app/console doctrine:schema:update --force --env=dev --no-interaction
php app/console doctrine:fixtures:load --env=dev --no-interaction
php app/console assets:install web --symlink
#php app/console assetic:dump --env=dev
php app/console cache:clear --env=dev

exec /usr/local/bin/run-apache.sh -D FOREGROUND
