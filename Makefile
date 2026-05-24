application := 
options := 

.PHONY: help

all: help

help: ## Print usage information
	$(info Available targets:)
	$(info ------------------)
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_-]+:.*##/ {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

start: ## Start a service (optional: 'application' argumet)
	@docker compose up -d $(options)  $(application)

stop: ## Stop a service (optional: 'application' argumet)
	@docker compose down $(options) $(application)

status: ## Status of running services
	@printf '\n%s\n' '--- Services ---'
	@docker compose ls
	@printf '\n%s\n' '--- Containers ---'
	@docker ps
	@printf '\n%s\n' '--- Processes ---'
	@docker compose top

logs: ## Get logs from a running service (optional: 'application' argumet)
	@docker compose logs -f $(options) $(application)
