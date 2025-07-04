EXEC_PHP=docker compose exec php
SYMFONY_BIN=$(EXEC_PHP) php bin/console

.PHONY: up down create install shell cc migrate perms

up:
	docker compose up -d --build

down:
	docker compose down -v

create:
	docker compose run --rm php composer create-project symfony/skeleton /var/www/symfony

install:
	$(EXEC_PHP) composer install

shell:
	$(EXEC_PHP) sh

cc:
	$(SYMFONY_BIN) cache:clear

migrate:
	$(SYMFONY_BIN) doctrine:migrations:migrate

# Remet les droits corrects sur Linux
perms:
	sudo chown -R $(id -u):$(id -g) symfony
	@if [ -d symfony/var ]; then sudo chown -R $(id -u):$(id -g) symfony/var; fi
	@if [ -d symfony/vendor ]; then sudo chown -R $(id -u):$(id -g) symfony/vendor; fi

