PORT ?= 9000

start:
	PHP_CLI_SERVER_WORKERS=5 php -S 0.0.0.0:$(PORT) -t public

install: setup

setup:
	composer install
	php artisan key:generate

validate:
	composer validate

lint:
	composer exec --verbose phpcs -- --standard=PSR12 app tests
	./vendor/bin/phpstan analyse

lint-fix:
	composer exec --verbose phpcbf -- --standard=PSR12 app tests

test:
	php artisan test