compose_command = docker compose
compose_file = local_stack/docker/compose.yaml

up:
	@echo "Running backend services"
	$(compose_command) -f $(compose_file) up -d

down:
	@echo "Stopping backend services"
	$(compose_command) -f $(compose_file) down
