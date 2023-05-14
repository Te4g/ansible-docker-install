start: ## Start the project
	docker compose up -d

stop: ## Stop the project
	docker compose down

ip: ## Get the ip of the container
	@docker compose exec ubuntu hostname -I

ansible: ## Run ansible playbook
	ansible-playbook -i ./hosts -l servers ./playbooks/docker.yml --ask-become

.DEFAULT_GOAL := help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
