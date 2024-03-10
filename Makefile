project_name = portfolio-backend
docker_path = dev_stack/docker
compose_file = $(docker_path)/compose.yaml
dev_tool_compose_file = $(docker_path)/compose.dev-tool.yaml
compose_command = docker compose -p $(project_name)

.PHONY: up
up:
	@echo "Running backend services"
	$(compose_command) -f $(compose_file) up -d

.PHONY: down
down:
	@echo "Stopping backend services"
	$(compose_command) -f $(compose_file) down

.PHONY: clean
clean:
	@echo "Removing backend services"
	$(compose_command) -f $(compose_file) down --volumes --remove-orphans --rmi all

.PHONY: linter
linter:
	@echo "Running linter"
	$(compose_command) -f $(dev_tool_compose_file) run --rm linter
