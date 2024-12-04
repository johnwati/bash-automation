Accelerate Your Project Setup: Automating Architecture and Scaffolding with Bash
================================================================================

    Github: [https](https://github.com/johnwati/bash-automation/edit/main/python-crud-scafolding

**Are you tired of repetitive setup tasks when starting new projects?** Manually creating folder structures, environment configurations, and boilerplate code is not only time-consuming but also prone to errors. To overcome this, I created a **Bash script** that automates project scaffolding and sets up a robust architecture, enabling faster, more consistent project starts.

### 🚀 The Problem: Inefficient Manual Setup

Starting a new project often involves redundant tasks:

*   Designing folder structures for scalable architectures.
    
*   Setting up virtual environments and installing dependencies.
    
*   Writing boilerplate code for models, services, and controllers.
    
*   Configuring database connectivity and migrations.
    

These tasks are essential, but they don't add direct value to your product.

### 💡 The Solution: Bash Script for Automated Scaffolding

This Bash script automates the setup process for Python-based projects, **tailored for frameworks like FastAPI and SQLAlchemy**. It follows a **Domain-Driven Design (DDD)** structure, ensuring the project is clean, maintainable, and scalable from day one.

### 🔧 What Does the Script Do?

#### 1️⃣ **Interactive Prompts for Customization**

The script begins by asking for:

*   **Project Name**: Root folder name for your project.
    
*   **Model Name**: Core domain object for CRUD operations (e.g., User, Order).
    

#### 2️⃣ **Predefined Folder Structure**

A robust **DDD-based directory structure** is created automatically:

    project-name/
    ├── src/
    │   ├── application/
    │   ├── domain/
    │   ├── infrastructure/
    │   ├── interface/
    ├── tests/
    ├── docs/
    ├── env/
    ├── requirements.txt
    ├── .env
    ├── README.md


#### 3️⃣ **Environment Setup**

*   Initializes a **Python virtual environment**.
    
*   Installs essential dependencies: FastAPI, SQLAlchemy, Alembic, Pydantic, and more.
    
*   Generates .env files for multiple environments (dev, test, prod).
    

#### 4️⃣ **Code Generation**

*   **Models**: Pydantic models for validation and SQLAlchemy ORM classes for persistence.
    
*   **Repositories**: Implements the repository pattern for data access.
    
*   **Services**: Business logic for your domain.
    
*   **Controllers**: RESTful endpoints with FastAPI.
    

#### 5️⃣ **Database and Alembic Integration**

*   Configures **Alembic** for database migrations.
    
*   Automatically updates alembic.ini with environment-specific settings.
    

### 🧑‍💻 How It Works

1.  Run the Script: Execute the Bash script in your terminal:

        ./setup_project.sh

2.  **Follow Prompts**: Enter project-specific details, such as the project and model names.
    
3.  **Start Development**: Your project is now ready with a structured architecture and boilerplate code.
    

#### Example: Creating a User Model

The script will generate:

*   A Pydantic model (User) in src/domain/models/user.py.
    
*   An SQLAlchemy ORM class (UserORM) in src/infrastructure/persistence/user\_orm.py.
    
*   Repository and service layers for data access and business logic.
    
*   FastAPI REST endpoints for CRUD operations.
    

### 🌟 Benefits of Using This Script

1.  **🚀 Save Time**Eliminate repetitive tasks—focus on building features, not scaffolding.
    
2.  **🔄 Consistency**Ensure all your projects follow a standardized architecture.
    
3.  **🔒 Reduced Errors**Automated setup minimizes human errors in configuration and code.
    
4.  **📈 Scalability**Start with a scalable structure, ideal for growing teams and projects.
    

### 📚 Example Use Case

After running the script for a User model, here's how the generated **API endpoint** looks:

    @router.post("/", response_model=User)
    def create_user(user: User, db: Session = Depends(get_db)):
        service = UserService(UserRepositoryImpl(db))
        return service.create_user(user)


And accessing your API is as simple as:

    uvicorn src.main:app --reload
    

Visit [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs) for interactive Swagger documentation.

### 🚀 Ready to Boost Your Productivity?

This script has been a game-changer for automating tedious tasks and ensuring projects start on a solid foundation. Whether you're an individual developer or part of a team, this tool can significantly improve your workflow.
