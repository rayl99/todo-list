# Todo List

This project consists of a backend server built with Ruby on Rails and an UI built with ReactJS.

## Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Backend Server](#running-the-backend-server)
- [Running the Frontend Application](#running-the-frontend-application)
- [API Endpoints](#api-endpoints)

## Getting Started

Follow these instructions to set up and run the project on your local machine for development and testing purposes.

## Prerequisites

Make sure you have the following software installed on your machine:

- Ruby (version 3.3.4 or higher)
- Rails (version 7.1.3 or higher)
- Node.js (version 22 or higher)
- npm (version 10 or higher)
- MySQL

## Installation

### Backend (Ruby on Rails)

1. **Clone the repository:**
   ```bash
   git clone https://github.com/rayl99/todo-list.git
   cd todo-list
   ```

2. **Install dependencies:**
   ```bash
   bundle install
   ```

3. **Set up the database:**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

### Frontend (ReactJS)

1. **Navigate to the frontend directory:**
   ```bash
   cd ui
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

## Running the Backend Server

To start the backend server, navigate to the root directory of the project and run:

```bash
rails server
```

The server will start on [http://localhost:3000](http://localhost:3000).

## Running the Frontend Application

To start the frontend application, navigate to the `frontend` directory and run:

```bash
npm start
```

The application will start on [http://localhost:3001](http://localhost:3001).

## API Endpoints

- **GET /api/tasks**: Fetch all tasks
- **POST /api/tasks**: Create a new task
- **PUT /api/tasks/:id**: Update an existing task
- **DELETE /api/tasks/:id**: Delete a task
