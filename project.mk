.PHONY: install
install: ## Install all artifacts into local repository
	mvn clean install

.PHONY: test
test: ## Run all tests
	mvn test

.PHONY: display-dependency-updates
display-dependency-updates: ## Display dependency updates in 'maven-boms'
	mvn versions:display-dependency-updates \
	   --update-snapshots \
	   --projects maven-boms \
	   --also-make-dependents

.PHONY: display-plugin-updates
display-plugin-updates: ## Display plugin updates in 'maven-parents'
	mvn versions:display-plugin-updates \
	   --update-snapshots \
	   --projects maven-parents \
	   --also-make-dependents

.PHONY: display-property-updates
display-property-updates: ## Display property updates in all modules
	mvn versions:display-property-updates \
	   --update-snapshots
