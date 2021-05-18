help:	## Show this help.
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

local-setup: ## Install local repository hooks
	pipenv install -d
	pipenv run pre-commit install

run-webserver: ## Run a local webserver for testing files
	pipenv run python -m http.server

lint:
	pipenv run pre-commit run --all-files
