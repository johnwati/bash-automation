#!/bin/bash
prompt_project_name() {
    local prompt="$1"
    read -p "$prompt: " PROJECT_NAME
}

prompt_model_name() {
    local prompt="$1"
    read -p "$prompt: " MODEL_NAME
    echo "$MODEL_NAME"
}

set_base_dir() {
    local project_name="$1"
    echo "$(pwd)/$project_name"
}

# Function to create project directories
create_project_directories() {
    # Create the project directory
    local PROJECT_NAME="$1"
    BASE_DIR="$(pwd)/$PROJECT_NAME"
    echo "Project Name: $PROJECT_NAME"
    echo "Base Directory: $BASE_DIR"
    mkdir "$PROJECT_NAME"
    cd $PROJECT_NAME

}

# Function to define and create folders
create_folders() {
    # Define folders
    declare -a FOLDERS=(
        "src/application/commands/handlers"
        "src/application/queries/handlers"
        "src/application/services"
        "src/application/mappers"
        "src/domain/models"
        "src/domain/entities"
        "src/domain/aggregates"
        "src/domain/repositories"
        "src/domain/services"
        "src/domain/events"
        "src/domain/exceptions"
        "src/domain/policies"
        "src/domain/factories"
        "src/infrastructure/persistence/repositories"
        "src/infrastructure/persistence/schemas"
        "src/infrastructure/events"
        "src/infrastructure/config"
        "src/infrastructure/logging"
        "src/infrastructure/security"
        "src/interface/controllers"
        "src/interface/dtos"
        "src/interface/api"
        "src/ui/components/shared"
        "src/ui/layouts"
        "src/ui/pages"
        "src/ui/hooks"
        "src/shared/utils"
        "src/shared/types"
        "src/shared/exceptions"
        "tests/unit/domain/services"
        "tests/unit/domain/entities"
        "tests/integration/application"
        "tests/integration/infrastructure"
        "tests/e2e/api"
        "tests/e2e/scenarios"
        "docs/architecture/diagrams"
        "docs/use-cases"
        "scripts"
    )

    # Create folders
    for FOLDER in "${FOLDERS[@]}"; do
        mkdir -p "$FOLDER"
    done

    # Create the directory structure
    mkdir -p src/{domain,application,interface,infrastructure}
    mkdir -p src/domain/{models,services,repositories}
    mkdir -p src/infrastructure/{persistence,api}
    mkdir -p src/interface/rest/{controllers,dtos}
    mkdir -p env
}
# Function to create placeholder files
create_placeholder_files() {
    # Create placeholder files
    touch ".env"
    touch "requirements.txt"
    touch "setup.py"
    touch "README.md"
}

# Function to initialize Python environment and install dependencies
initialize_python_env() {

# Initialize Python environment
python3 -m venv venv
source venv/bin/activate

# Install required dependencies
pip install fastapi uvicorn pydantic sqlalchemy mysql-connector-python python-decouple alembic pymysql cryptography python-dotenv

    # Create requirements.txt
cat >requirements.txt <<EOL
    fastapi==0.115.5
    uvicorn==0.32.1
    pydantic==2.10.2
    SQLAlchemy==2.0.36
    mysql-connector-python==9.1.0
    python-decouple==3.8
    ## The following requirements were added by pip freeze:
    alembic==1.14.0
    annotated-types==0.7.0
    anyio==4.6.2.post1
    cffi==1.17.1
    click==8.1.7
    cryptography==44.0.0
    greenlet==3.1.1
    h11==0.14.0
    idna==3.10
    Mako==1.3.6
    MarkupSafe==3.0.2
    pycparser==2.22
    pydantic_core==2.27.1
    PyMySQL==1.1.1
    sniffio==1.3.1
    starlette==0.41.3
    typing_extensions==4.12.2
EOL
}

# Function to create environment files
create_env_files() {

# Create environment files
cat >.env <<EOL
ENVIRONMENT=dev
DB_PORT=3306
DB_USER=transactions_log_dev
DB_PASSWORD=transactions_log_dev
DB_HOST=3.70.187.169
DB_NAME=transactions_log_dev
EOL

mkdir -p env
for ENV in dev test prod; do
cat >env/.env.$ENV <<EOL
DB_PORT=3306
DB_USER=transactions_log_dev
DB_PASSWORD=transactions_log_dev
DB_HOST=3.70.187.169
DB_NAME=transactions_log_dev
EOL
done

}

create_readme() { 
# Create README.md
cat >README.md <<EOL
Project Setup Script Documentation
==================================

This repository provides a Bash script for automating the setup and scaffolding of a new Python-based project with a structured architecture. The script is tailored to set up FastAPI as the primary web framework, SQLAlchemy for ORM, and Alembic for database migrations.

Features
--------

1.  **Interactive Input Prompts**
    
    *   Prompts for the project name and model name.
        
    *   Prompts for model fields and their data types.
        
2.  **Folder Structure Generation**
    
    *   Automatically creates a hierarchical folder structure for domain-driven design (DDD), including:
        
        *   src (source code)
            
        *   tests (unit and integration tests)
            
        *   docs (documentation files)
            
3.  **Environment Setup**
    
    *   Initializes a Python virtual environment.
        
    *   Installs required dependencies for FastAPI, SQLAlchemy, and Alembic.
        
    *   Creates .env and environment-specific files in the env folder.
        
4.  **Code Generation**
    
    *   Generates Pydantic models.
        
    *   Implements SQLAlchemy ORM classes and repository patterns.
        
    *   Creates service and controller classes.
        
    *   Configures database connection handling.
        
5.  **Alembic Configuration**
    
    *   Updates alembic.ini with environment-specific configurations.
        
    *   Generates and applies database migrations for the model.
        
6.  **FastAPI Boilerplate**
    
    *   Creates a basic FastAPI app with routing and CRUD endpoints for the model.
        

Script Workflow
---------------

### 1\. **Prompting for Input**

*   The script starts by prompting the user for:
    
    *   **Project Name**: The root directory for the project.
        
    *   **Model Name**: The name of the domain model (e.g., User).
        

### 2\. **Folder Structure Creation**

*   The script creates a predefined directory structure based on best practices for DDD:
    
    *   src/domain: Models, entities, aggregates, repositories, services.
        
    *   src/infrastructure: Persistence, configurations, and migrations.
        
    *   src/interface: REST API controllers and DTOs.
        
    *   tests: Unit, integration, and end-to-end test files.
        
    *   docs: Architecture diagrams and use cases.
        

### 3\. **Python Environment Initialization**

*   Initializes a Python virtual environment and installs dependencies:
    
    *   FastAPI, SQLAlchemy, Alembic, and additional libraries for database and environment management.
        

### 4\. **Model Creation**

*   Asks for fields and data types to define:
    
    *   **Pydantic models** for request/response validation.
        
    *   **SQLAlchemy ORM classes** for database persistence.
        

### 5\. **Service and Repository Layers**

*   Implements:
    
    *   **Repository Pattern**: Handles database operations for the model.
        
    *   **Service Layer**: Business logic for the model.
        

### 6\. **Controller Creation**

*   Generates RESTful CRUD endpoints for the model.
    

### 7\. **Database Configuration**

*   Configures SQLAlchemy and Alembic for database connectivity and migrations.
    
*   Creates env.py for Alembic to link with SQLAlchemy metadata.
    

### 8\. **FastAPI Main App**

*   Creates a main.py file to include generated routes.
    

Usage
-----

1. **Run the Script**

    ./setup\_project.sh
    
2.  **Follow the Prompts**
    
    *   Enter the project name.
        
    *   Define the model name and fields.

1. **Start the Server**

    uvicorn src.main:app --reload

4.  **Access API**

    Open your browser at http://127.0.0.1:8000/docs. 

Example Directory Structure
---------------------------

After execution, the directory structure will look like:
  
    project-name/
    ├── src/
    │   ├── application/
    │   ├── domain/
    │   ├── infrastructure/
    │   ├── interface/
    │   ├── main.py
    ├── tests/
    ├── docs/
    ├── env/
    ├── requirements.txt
    ├── .env
    ├── README.md


Dependencies
------------

*   Python 3.8 or higher
    
*   FastAPI
    
*   SQLAlchemy
    
*   Alembic
    
*   MySQL connector
    

Notes
-----

*   Customize the script as needed to fit your project requirements.
    
*   Ensure alembic.ini and database configurations are correctly set for your environment.
    

This script aims to accelerate project setup and establish a robust structure for scalable and maintainable software development.
EOL
}
# Function to update Alembic configuration
update_alembic_config() {
local MODEL_NAME_LOWER="$1"

# Update Alembic configuration
sed -i.bak "s|sqlalchemy.url = .*|sqlalchemy.url = mysql+mysqlconnector://dev_user:dev_password@localhost:3306/my_database_dev|g" src/infrastructure/migrations/alembic.ini

# Initialize Alembic
alembic init src/infrastructure/migrations

# Configure Alembic
cat >src/infrastructure/migrations/env.py <<EOL
from alembic import context
from sqlalchemy import engine_from_config, pool
from src.infrastructure.persistence.${MODEL_NAME_LOWER}_orm import Base  # Replace with the actual path to your Base

# Set up the Alembic context with your SQLAlchemy models
config = context.config
target_metadata = Base.metadata  # Link Alembic to your models' metadata

def run_migrations_online():
    connectable = engine_from_config(
        config.get_section(config.config_ini_section),
        prefix="sqlalchemy.",
        poolclass=pool.NullPool,
    )
    with connectable.connect() as connection:
        context.configure(
            connection=connection,
            target_metadata=target_metadata,
        )
        with context.begin_transaction():
            context.run_migrations()

run_migrations_online()

EOL

# Define the path to the Python script
PYTHON_SCRIPT="update_alembic_ini.py"

# Create the Python script dynamically
cat <<'EOF' >$PYTHON_SCRIPT
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Retrieve database connection details from environment variables
db_user = os.getenv("DB_USER")
db_password = os.getenv("DB_PASSWORD")
db_host = os.getenv("DB_HOST")
db_name = os.getenv("DB_NAME")

# Construct the SQLAlchemy database URL
sqlalchemy_url = f"mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}"

# Path to alembic.ini
alembic_ini_path = "alembic.ini"

# Update alembic.ini with the correct sqlalchemy.url
try:
    with open(alembic_ini_path, "r") as file:
        lines = file.readlines()

    with open(alembic_ini_path, "w") as file:
        for line in lines:
            if line.startswith("sqlalchemy.url"):
                file.write(f"sqlalchemy.url = {sqlalchemy_url}\n")
            else:
                file.write(line)

    print("Successfully updated alembic.ini with the correct sqlalchemy.url")
except FileNotFoundError:
    print(f"Error: {alembic_ini_path} not found.")
except Exception as e:
    print(f"An error occurred: {e}")
EOF

# Inform the user
echo "Python script 'update_alembic_ini.py' has been created."

# Run the Python script
echo "Running 'update_alembic_ini.py'..."
python3 $PYTHON_SCRIPT

}

# Function to handle model creation
create_model() {

    local MODEL_NAME="$1"
    MODEL_NAME_LOWER=$(echo "$MODEL_NAME" | tr '[:upper:]' '[:lower:]')

    # Prompt for model fields
    echo "Enter the fields and their data types for the model (type 'done' to finish):"
    FIELDS=()
    while true; do
        read -p "Field name: " FIELD_NAME
        if [[ "$FIELD_NAME" == "done" ]]; then
            break
        fi
        read -p "Data type (str, int, float, etc.): " FIELD_TYPE
        COLUMN_SIZE=""
        if [[ "$FIELD_TYPE" == "str" ]]; then
            read -p "Enter column size for $FIELD_NAME (e.g., 255): " COLUMN_SIZE
        fi
        FIELDS+=("$FIELD_NAME:$FIELD_TYPE:$COLUMN_SIZE")
    done

    # Create model file
    MODEL_FILE="src/domain/models/${MODEL_NAME_LOWER}.py"
    cat >"$MODEL_FILE" <<EOL
from pydantic import BaseModel

class $MODEL_NAME(BaseModel):
EOL

    for FIELD in "${FIELDS[@]}"; do
        FIELD_NAME=$(echo "$FIELD" | cut -d':' -f1)
        FIELD_TYPE=$(echo "$FIELD" | cut -d':' -f2)
        echo "    $FIELD_NAME: $FIELD_TYPE" >>"$MODEL_FILE"
    done

    # Create ORM class
    ORM_FILE="src/infrastructure/persistence/${MODEL_NAME_LOWER}_orm.py"
    cat >"$ORM_FILE" <<EOL
from sqlalchemy import Column, Integer, String, Float
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class ${MODEL_NAME}ORM(Base):
    __tablename__ = "${MODEL_NAME_LOWER}s"
    id = Column(Integer, primary_key=True, autoincrement=True)
EOL

    for FIELD in "${FIELDS[@]}"; do
        FIELD_NAME=$(echo "$FIELD" | cut -d':' -f1)
        FIELD_TYPE=$(echo "$FIELD" | cut -d':' -f2)
        COLUMN_SIZE=$(echo "$FIELD" | cut -d':' -f3)
        SQL_TYPE="String"
        if [[ "$FIELD_TYPE" == "int" ]]; then
            SQL_TYPE="Integer"
        elif [[ "$FIELD_TYPE" == "float" ]]; then
            SQL_TYPE="Float"
        elif [[ "$FIELD_TYPE" == "str" ]]; then
            if [[ -n "$COLUMN_SIZE" ]]; then
                SQL_TYPE="String($COLUMN_SIZE)"
            else
                SQL_TYPE="String"
            fi
        fi
        echo "    $FIELD_NAME = Column($SQL_TYPE)" >>$ORM_FILE
    done

    # Repository implementation
REPO_FILE="src/infrastructure/persistence/${MODEL_NAME_LOWER}_repository_impl.py"
cat >"$REPO_FILE" <<EOL
from sqlalchemy.orm import Session
from .${MODEL_NAME_LOWER}_orm import ${MODEL_NAME}ORM, Base
from src.domain.models.${MODEL_NAME_LOWER} import $MODEL_NAME

class ${MODEL_NAME}RepositoryImpl:
    def __init__(self, session: Session):
        self.session = session

    def create_${MODEL_NAME_LOWER}(self, ${MODEL_NAME_LOWER}: $MODEL_NAME) -> $MODEL_NAME:
        orm_obj = ${MODEL_NAME}ORM(**${MODEL_NAME_LOWER}.dict())
        self.session.add(orm_obj)
        self.session.commit()
        self.session.refresh(orm_obj)
        return $MODEL_NAME(**vars(orm_obj))

    def get_${MODEL_NAME_LOWER}_by_id(self, id: int) -> $MODEL_NAME:
        orm_obj = self.session.query(${MODEL_NAME}ORM).filter(${MODEL_NAME}ORM.id == id).first()
        if orm_obj:
            return $MODEL_NAME(**vars(orm_obj))
        return None

    def get_all_${MODEL_NAME_LOWER}s(self) -> list[$MODEL_NAME]:
        return [
            $MODEL_NAME(**vars(obj)) for obj in self.session.query(${MODEL_NAME}ORM).all()
        ]

    def update_${MODEL_NAME_LOWER}(self, id: int, ${MODEL_NAME_LOWER}: $MODEL_NAME) -> $MODEL_NAME:
        orm_obj = self.session.query(${MODEL_NAME}ORM).filter(${MODEL_NAME}ORM.id == id).first()
        if orm_obj:
            for key, value in ${MODEL_NAME_LOWER}.dict().items():
                setattr(orm_obj, key, value)
            self.session.commit()
            self.session.refresh(orm_obj)
            return $MODEL_NAME(**vars(orm_obj))
        return None

    def delete_${MODEL_NAME_LOWER}(self, id: int):
        orm_obj = self.session.query(${MODEL_NAME}ORM).filter(${MODEL_NAME}ORM.id == id).first()
        if orm_obj:
            self.session.delete(orm_obj)
            self.session.commit()
EOL

    # Service implementation
SERVICE_FILE="src/domain/services/${MODEL_NAME_LOWER}_service.py"
cat >"$SERVICE_FILE" <<EOL
from src.infrastructure.persistence.${MODEL_NAME_LOWER}_repository_impl import ${MODEL_NAME}RepositoryImpl
from src.domain.models.${MODEL_NAME_LOWER} import $MODEL_NAME
from sqlalchemy.orm import Session

class ${MODEL_NAME}Service:
    def __init__(self, repository: ${MODEL_NAME}RepositoryImpl):
        self.repository = repository

    def create_${MODEL_NAME_LOWER}(self, ${MODEL_NAME_LOWER}: $MODEL_NAME) -> $MODEL_NAME:
        return self.repository.create_${MODEL_NAME_LOWER}(${MODEL_NAME_LOWER})

    def get_${MODEL_NAME_LOWER}_by_id(self, id: int) -> $MODEL_NAME:
        return self.repository.get_${MODEL_NAME_LOWER}_by_id(id)

    def get_all_${MODEL_NAME_LOWER}s(self) -> list[$MODEL_NAME]:
        return self.repository.get_all_${MODEL_NAME_LOWER}s()

    def update_${MODEL_NAME_LOWER}(self, id: int, ${MODEL_NAME_LOWER}: $MODEL_NAME) -> $MODEL_NAME:
        return self.repository.update_${MODEL_NAME_LOWER}(id, ${MODEL_NAME_LOWER})

    def delete_${MODEL_NAME_LOWER}(self, id: int):
        return self.repository.delete_${MODEL_NAME_LOWER}(id)
EOL

    # Controller implementation
    CONTROLLER_FILE="src/interface/rest/controllers/${MODEL_NAME_LOWER}_controller.py"
cat >$CONTROLLER_FILE <<EOL
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from src.infrastructure.persistence.${MODEL_NAME_LOWER}_repository_impl import ${MODEL_NAME}RepositoryImpl
from src.domain.services.${MODEL_NAME_LOWER}_service import ${MODEL_NAME}Service
from src.domain.models.${MODEL_NAME_LOWER} import $MODEL_NAME
from src.infrastructure.persistence.database import get_db

router = APIRouter()

@router.post("/", response_model=$MODEL_NAME)
def create_${MODEL_NAME_LOWER}(${MODEL_NAME_LOWER}: $MODEL_NAME, db: Session = Depends(get_db)):
    service = ${MODEL_NAME}Service(${MODEL_NAME}RepositoryImpl(db))
    return service.create_${MODEL_NAME_LOWER}(${MODEL_NAME_LOWER})

@router.get("/{id}", response_model=$MODEL_NAME)
def get_${MODEL_NAME_LOWER}_by_id(id: int, db: Session = Depends(get_db)):
    service = ${MODEL_NAME}Service(${MODEL_NAME}RepositoryImpl(db))
    result = service.get_${MODEL_NAME_LOWER}_by_id(id)
    if not result:
        raise HTTPException(status_code=404, detail="${MODEL_NAME} not found")
    return result

@router.get("/", response_model=list[$MODEL_NAME])
def get_all_${MODEL_NAME_LOWER}s(db: Session = Depends(get_db)):
    service = ${MODEL_NAME}Service(${MODEL_NAME}RepositoryImpl(db))
    return service.get_all_${MODEL_NAME_LOWER}s()

@router.put("/{id}", response_model=$MODEL_NAME)
def update_${MODEL_NAME_LOWER}(id: int, ${MODEL_NAME_LOWER}: $MODEL_NAME, db: Session = Depends(get_db)):
    service = ${MODEL_NAME}Service(${MODEL_NAME}RepositoryImpl(db))
    result = service.update_${MODEL_NAME_LOWER}(id, ${MODEL_NAME_LOWER})
    if not result:
        raise HTTPException(status_code=404, detail="${MODEL_NAME} not found")
    return result

@router.delete("/{id}")
def delete_${MODEL_NAME_LOWER}(id: int, db: Session = Depends(get_db)):
    service = ${MODEL_NAME}Service(${MODEL_NAME}RepositoryImpl(db))
    service.delete_${MODEL_NAME_LOWER}(id)
    return {"message": "${MODEL_NAME} deleted successfully"}
EOL

}

database_config() {
# Database connection handling
DATABASE_FILE="src/infrastructure/persistence/database.py"
cat >$DATABASE_FILE <<EOL
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from decouple import config

DATABASE_URL = f"mysql+mysqlconnector://{config('DB_USER')}:{config('DB_PASSWORD')}@{config('DB_HOST')}:{config('DB_PORT')}/{config('DB_NAME')}"

engine = create_engine(DATABASE_URL, echo=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
EOL

}

# Run the FastAPI server
echo "Run the server using: uvicorn src.main:app --reload"

create_main_file() {
local MODEL_NAME_LOWER="$1"
# Main API file
MAIN_FILE="src/main.py"
cat >$MAIN_FILE <<EOL
from fastapi import FastAPI
from src.interface.rest.controllers.${MODEL_NAME_LOWER}_controller import router

app = FastAPI()

app.include_router(router, prefix="/${MODEL_NAME_LOWER}", tags=["${MODEL_NAME_LOWER}s"])
EOL
}

alembic_migrations() {
    local MODEL_NAME_LOWER="$1"
    # Generate Alembic migration
    alembic revision --autogenerate -m "create ${MODEL_NAME_LOWER}s table"
    # Apply migrations
    alembic upgrade head
}
main() {
    # local PROJECT_NAME="$1"
    prompt_project_name "Enter the model name"
    create_project_directories "$PROJECT_NAME"
    create_folders "$PROJECT_NAME"
    create_placeholder_files
    create_readme
    initialize_python_env
    create_env_files
    database_config
    create_env_files
    MODEL_NAME=$(prompt_model_name "Enter the model name")
    MODEL_NAME_LOWER=$(echo "$MODEL_NAME" | tr '[:upper:]' '[:lower:]')
    create_model "$MODEL_NAME"
    update_alembic_config "$MODEL_NAME_LOWER"
    create_main_file "$MODEL_NAME_LOWER"
    alembic_migrations "$MODEL_NAME_LOWER"
}
# Main script execution
main
