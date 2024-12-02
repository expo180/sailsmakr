# Sailsmakr

**Sailsmakr** is a powerful, cloud-based platform designed to optimize and streamline business operations across various industries. The platform is built using cutting-edge technologies to ensure scalability, security, and flexibility. This README provides an overview of the technology stack, setup instructions, and key components behind Sailsmakr.

## Table of Contents
- [Technologies](#technologies)
- [Getting Started](#getting-started)
- [Code Infrastructure](#code-infrastructure)
- [Database Management](#database-management)
- [Cloud and Containerization](#cloud-and-containerization)
- [Front-End Development](#front-end-development)
- [APIs and Integrations](#apis-and-integrations)
- [Testing and CI/CD](#testing-and-cicd)

---

## Technologies

Sailsmakr leverages a variety of modern technologies to deliver a seamless experience:

- **Python (Flask)**: Backend framework for handling requests and API logic.
- **Code as Infrastructure**: Ensuring that infrastructure is defined and maintained programmatically, using tools such as Terraform.
- **Firestore**: Cloud-based NoSQL database for storing user-generated data such as files and media.
- **Neon DB (PostgreSQL)**: High-performance, secure PostgreSQL database for structured data management.
- **VanillaJS & ES6**: JavaScript standard used for building interactive front-end functionalities.
- **JQuery**: Simplifying HTML DOM manipulation and event handling.
- **TailwindCSS**: Utility-first CSS framework used for building responsive and modern UI components.
- **Bootstrap MD from Creative TIM**: Material design-based UI kit for building beautiful, functional user interfaces.
- **Docker**: Containerization platform for packaging the application and its dependencies to run consistently across environments.
- **Jenkins**: CI/CD tool used for automated testing and continuous integration.
- **Render Cloud**: Cloud platform for hosting and scaling the application.
- **OpenCage**: Geolocation API for converting coordinates into readable addresses.
- **FedEx & Freightos APIs**: Used for providing real-time shipping and freight suggestions.

---

## Getting Started

### Prerequisites

To run Sailsmakr locally, ensure you have the following tools installed:

- **Docker**: For running the application in a containerized environment.
- **Python 3.x**: For the backend.
- **Node.js & npm**: For managing frontend dependencies and build tools.
- **Jenkins**: If you plan to set up continuous integration and testing locally.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/sailsmakr/sailsmakr.git
   cd sailsmakr

2.Set Up the Backend:

    Create a Python virtual environment and install dependencies
    ```bash 
        python3 -m venv venv
        source venv/bin/activate
        pip install -r requirements.txt

3.Set Up the Frontend:

Install npm dependencies:
    ```bash
    npm install


Run Docker Containers:

Ensure Docker is installed and running:
 
```bash
docker-compose up --build

Set Up Environment Variables:

Create a .env file and add the necessary environment variables, such as API keys for OpenCage, FedEx, Freightos, and database credentials.
Code Infrastructure
Sailsmakr is designed using Infrastructure as Code (IaC) principles, which ensures that the infrastructure is automated, scalable, and consistent across environments. The deployment and provisioning of resources like databases, cloud instances, and storage are managed programmatically using tools like Terraform.

Python (Flask) serves as the core backend framework for handling API requests and business logic.
The backend interacts with Neon DB (PostgreSQL) for managing relational data and Firestore for file storage.
Database Management
Neon DB (PostgreSQL)
Sailsmakr uses Neon DB for managing structured data in a relational format. PostgreSQL handles large-scale transactional queries and ensures data integrity.

Features: ACID-compliant, high performance, and secure.
Usage: Customer information, transaction records, and core business logic.
Firestore (NoSQL)
For handling unstructured data such as files, media uploads, and logs, Sailsmakr integrates Firestore, a cloud-based NoSQL solution.

Benefits: Scalability, flexibility, and real-time updates.
Usage: File storage, media management, and document-oriented data.
Cloud and Containerization
Sailsmakr runs on Render Cloud, a powerful and flexible cloud platform that allows seamless scaling and hosting of the application. Additionally, Docker is used for containerization, ensuring that the software runs consistently across different environments.

Docker: Used to containerize the application for easier deployment and scaling. The backend, frontend, and databases are all containerized for smooth and reliable operation.
Docker Commands:
Start Containers:
bash
 
```bash
docker-compose up --build

Stop Containers:
 
```bash
docker-compose down

Front-End Development
Sailsmakr's front-end is built using a combination of VanillaJS, ES6, and JQuery to deliver a dynamic and responsive user experience. The UI is styled using TailwindCSS and Bootstrap MD from Creative TIM.

Front-End Libraries and Frameworks:
TailwindCSS: Utility-first CSS framework for creating responsive designs quickly.
Bootstrap MD: Material Design components from Creative TIM for modern UI.
VanillaJS (ES6): Core JavaScript standard for interactive components.
JQuery: Simplifies DOM manipulation and event handling.
APIs and Integrations
Sailsmakr integrates several third-party APIs to enhance functionality:

OpenCage: Geolocation API that converts geographic coordinates into human-readable addresses, useful for location-based features.
FedEx & Freightos: APIs for providing real-time shipping rates, tracking information, and freight suggestions, ensuring that customers get the best shipping options.
Testing and CI/CD
Sailsmakr uses Jenkins for continuous integration and automated testing. This ensures that code pushed to the repository is automatically tested, and builds are generated for deployment.

License
Sailsmakr Softwares is the sole owner of all source code. No code may be redistributed or reproduced without explicit permission from Sailsmakr Software.

For questions or issues, contact Bader Salissou Saâdou, Lead Software Architect.

 

This README.md provides comprehensive documentation for the Sailsmakr project, detailing its technology stack, setup process, and contribution guidelines.