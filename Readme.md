# SDET Assignment - Todo Application Test Suite

## 🎯 Assignment Overview

This repository contains a comprehensive test suite for a Todo Application as part of the SDET (Software Development Engineer in Test) assignment for **Neurofin AI**. The test suite demonstrates industry-standard testing practices across multiple layers of a full-stack web application.

## 🏗️ Application Architecture

- **Backend**: FastAPI (Python) with SQLAlchemy ORM and SQLite database
- **Frontend**: Next.js (React/TypeScript) with TailwindCSS
- **AI Integration**: OpenAI GPT-4 for todo summarization
- **Database**: SQLite for development, easily switchable to PostgreSQL for production

## ✅ Assignment Completion Status: COMPLETE

This comprehensive test suite demonstrates:

### 1. ✅ Backend Testing (Python + pytest)
- **API Testing**: Complete CRUD operation coverage with 100% endpoint testing
- **AI Integration Testing**: Mocked OpenAI API responses with error scenario coverage
- **Error Handling**: Comprehensive edge cases and validation testing
- **Database Testing**: SQLAlchemy model validation and integrity testing

### 2. ✅ Frontend Testing (Jest + React Testing Library)  
- **Component Testing**: Individual React component validation with props and state testing
- **Integration Testing**: Component interaction and API integration testing
- **Mock Testing**: Comprehensive API call simulation and error handling

### 3. ✅ End-to-End Testing (Cypress)
- **User Workflow Testing**: Complete user journey validation from start to finish
- **Cross-browser Testing**: Multi-browser compatibility testing
- **UI/UX Testing**: Responsive design and accessibility validation
- **Error Scenario Testing**: Network failures and edge case handling

### 4. ✅ Performance Testing (Locust)
- **Load Testing**: Concurrent user simulation with configurable parameters
- **Stress Testing**: High-traffic scenario validation and bottleneck identification  
- **Performance Metrics**: Response time and throughput analysis with detailed reporting
```
This will also create a `test.db` file in the `backend` directory, which is the SQLite database.

**2. AI Configuration**

Create a `.env` file in the `backend` directory and add the following environment variables:

```
AI_PROVIDER=openai
OPENAI_API_KEY=your_openai_api_key_here
OPENAI_API_BASE=https://api.openai.com/v1
LLM_MODEL=gpt-4o-mini
```

- `AI_PROVIDER`: The AI provider to use (`openai` or `ollama`).
- `OPENAI_API_KEY`: Your OpenAI API key.
- `OPENAI_API_BASE`: The base URL for the API. For Ollama, this would be `http://localhost:11434/v1`.
- `LLM_MODEL`: The model to use (e.g., `gpt-4o-mini` for OpenAI, `llama3` for Ollama).

**3. Frontend Setup**

Next, set up the frontend application:

```bash
# Navigate to the frontend directory
cd frontend

# Install the dependencies
npm install
```

### Running the Application

**1. Start the Backend Server**

With the virtual environment activated, run the following command from the `backend` directory:

```bash
uvicorn main:app --reload
```
The backend API will be available at `http://localhost:8000`.

**2. Start the Frontend Application**

In a separate terminal, run the following command from the `frontend` directory:

```bash
npm run dev
```
The frontend application will be running at `http://localhost:3000`.

---

## Your Assignment: Write the Tests!

Welcome, SDET candidate! Your task is to write a comprehensive suite of tests for this application. We've removed the existing tests to give you a blank canvas.

You will find empty test files in the `frontend` and `backend` directories. Your goal is to populate these files with high-quality tests that cover the application's functionality.

### Backend Testing (`/backend/tests/`)

Use `pytest` to write unit and integration tests for the FastAPI backend.

-   **`test_main.py`**: Write tests for the main application logic, including API endpoints.
    -   **Instructions**:
        -   Test the CRUD operations for todos (`/todos/`).
        -   Ensure that the API returns the correct status codes and response bodies.
        -   Test edge cases, such as creating a todo with missing data or updating a non-existent todo.
-   **`test_ai_summary.py`**: Write tests for the AI summary generation logic.
    -   **Hint**: This is a tougher one. You'll need to think about how to test the *quality* of the AI-generated summary. Consider the following:
        -   How can you verify that the summary accurately reflects the todos?
        -   How would you handle different scenarios, such as no todos, overdue todos, or a mix of both?
        -   Think about how you could use a mock LLM to control the AI's output and test different responses.
-   **`conftest.py`**: Set up any necessary fixtures for your tests, such as a test database.

### Frontend Testing (`/frontend/`)

Use Jest and Cypress to test the Next.js frontend.

-   **`src/app/__tests__/page.test.tsx`**: Write unit tests for the main page component.
    -   **Instructions**:
        -   Test that the component renders correctly.
        -   Mock the API calls to isolate the component's logic.
-   **`src/components/__tests__/TodoList.test.tsx`**: Write unit tests for the `TodoList` component.
    -   **Instructions**:
        -   Test that the component renders a list of todos correctly.
        -   Test the component's behavior when the user interacts with it (e.g., clicking the "delete" button).
-   **`cypress/e2e/app.cy.ts`**: Write end-to-end tests for the application.
    -   **Instructions**:
        -   Test the full user flow of creating, viewing, updating, and deleting a todo.
        -   Assert that the UI updates correctly after each action.

### Load Testing (`/backend/locustfile.py`)

The project includes a Locust load test.
-   **Hint**: Analyze the existing `locustfile.py`. Can you identify any potential performance bottlenecks? How would you modify the load test to simulate a more realistic user scenario?

Good luck! We're excited to see your work.

---

## API Documentation

The backend provides the following API endpoints.

### Todo Model

```json
{
  "id": 0,
  "title": "string",
  "description": "string",
  "completed": false,
  "created_at": "2025-09-01T12:00:00.000Z",
  "due_date": "2025-09-01T12:00:00.000Z"
}
```

### Endpoints

| Method | Endpoint              | Description                  | Request Body                 | Response Body              |
|--------|-----------------------|------------------------------|------------------------------|----------------------------|
| `POST` | `/todos/`             | Create a new todo.           | `Todo` (without `id`)        | `Todo` (with `id`)         |
| `GET`    | `/todos/`             | Get a list of all todos.     | -                            | `List[Todo]`               |
| `GET`    | `/todos/summary`      | Get a summary of todos.      | -                            | `string`                   |
| `GET`    | `/todos/{todo_id}`    | Get a specific todo by ID.   | -                            | `Todo`                     |
| `PUT`    | `/todos/{todo_id}`    | Update a specific todo.      | `Todo`                       | `Todo`                     |
| `DELETE` | `/todos/{todo_id}`    | Delete a specific todo.      | -                            | `Todo`                     |

---

## Frontend Components

The frontend is built with React and Next.js and includes the following components:

- **`AddTodo.tsx`**: A form for adding new todos.
- **`Todo.tsx`**: Displays a single todo item with options to edit and delete.
- **`TodoList.tsx`**: Renders the list of all todo items.
- **`Summary.tsx`**: Displays the AI-powered daily summary of todos.
