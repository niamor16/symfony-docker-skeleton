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

# Commande pour installer les bundles de base
init-base-bundles:
	$(EXEC_PHP) composer require symfony/maker-bundle --dev
	$(EXEC_PHP) composer require symfony/debug-bundle --dev
	$(EXEC_PHP) composer require symfony/orm-pack
	$(EXEC_PHP) composer require symfony/twig-bundle

# Executer des commandes dans la console Symfony
sf-console:
	$(SYMFONY_BIN) $(filter-out $@,$(MAKECMDGOALS))

# Remet les droits corrects sur Linux
perms:
	sudo chown -R $$(id -u):$$(id -g) symfony symfony/var symfony/vendor

