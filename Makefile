project_name = portfolio-backend
docker_path = dev_stack/docker
compose_command = docker compose
portfolio_compose_file = $(docker_path)/compose.yaml
portfolio_compose_command = $(compose_command) -p $(project_name) -f $(portfolio_compose_file)
dev_tool_compose_file = $(docker_path)/compose.dev-tool.yaml
dev_tool_compose_command = $(compose_command) -p $(project_name)-dev-tool -f $(dev_tool_compose_file)

.PHONY: up
up:
	@echo "Running backend services"
	$(portfolio_compose_command) up --detach

.PHONY: down
down:
	@echo "Stopping backend services"
	$(portfolio_compose_command) down

.PHONY: clean
clean:
	@echo "Removing backend services"
	$(portfolio_compose_command) down --volumes --remove-orphans --rmi all && \
	$(dev_tool_compose_command) down --volumes --remove-orphans --rmi all

.PHONY: linter
linter:
	@echo "Running linter"
	$(dev_tool_compose_command) run --rm linter
