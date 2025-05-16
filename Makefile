.PHONY: up down status plan apply destroy clean

TERRAFORM := terraform

up:
	@echo "Starting LocalStack with Docker Compose..."
	docker compose up -d

down:
	@echo "Stopping LocalStack..."
	docker compose down

status:
	@echo "Checking LocalStack status..."
	docker compose ps

plan:
	@echo "Initializing Terraform with reconfigure..."
	$(TERRAFORM) init -reconfigure
	@echo "Creating Terraform plan..."
	$(TERRAFORM) plan

apply:
	@echo "Initializing Terraform with reconfigure..."
	$(TERRAFORM) init -reconfigure
	@echo "Applying Terraform configuration..."
	$(TERRAFORM) apply -auto-approve

destroy:
	@echo "Initializing Terraform with reconfigure..."
	$(TERRAFORM) init -reconfigure
	@echo "Destroying Terraform resources..."
	$(TERRAFORM) destroy

clean:
	@echo "Cleaning up..."
	rm -rf .terraform
	rm -f terraform.tfstate*
	rm -rf .terraform.lock.hcl
