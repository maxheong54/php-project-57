PORT ?= 9000

start:
	PHP_CLI_SERVER_WORKERS=5 php -S 0.0.0.0:$(PORT) -t public

install: setup

setup:
	composer install
	cp -n .env.example .env
	php artisan key:generate

validate:
	composer validate

lint:
	./vendor/bin/pint --test
	php -d memory_limit=512M ./vendor/bin/phpstan analyse

lint-fix:
	./vendor/bin/pint

test:
	php artisan test