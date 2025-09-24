@echo off
REM Test Execution Script for SDET Assignment - Windows Version
REM This script demonstrates how to run all the test suites

echo ===============================================
echo SDET Assignment - Test Suite Execution
echo Todo Application Testing Framework
echo ===============================================
echo.

REM Backend Tests
echo 🧪 BACKEND TESTS
echo ==================
echo Testing FastAPI application with pytest...
echo.

cd backend
if exist "requirements.txt" (
    echo Installing backend dependencies...
    pip install fastapi uvicorn sqlalchemy pytest openai
    echo.
)

echo Running backend tests...
python -m pytest tests/ -v --tb=short
echo.

REM Frontend Tests
echo 🌐 FRONTEND TESTS
echo ==================
echo Testing Next.js application with Jest...
echo.

cd ..\frontend
if exist "package.json" (
    echo Installing frontend dependencies...
    npm install
    echo.
)

echo Running Jest unit tests...
npm test -- --verbose --watchAll=false
echo.

REM E2E Tests (Cypress)
echo 🔄 END-TO-END TESTS
echo ====================
echo Running Cypress E2E tests...
echo Note: This requires both backend and frontend servers to be running
echo.

echo To run E2E tests manually:
echo 1. Start backend: cd backend ^&^& uvicorn main:app --reload
echo 2. Start frontend: cd frontend ^&^& npm run dev
echo 3. Run Cypress: cd frontend ^&^& npx cypress run
echo.

REM Load Tests
echo 📊 LOAD TESTING
echo ================
echo Setting up Locust load testing...
echo.

cd ..\backend
echo Installing load testing dependencies...
pip install locust
echo.

echo Load test script is available at: backend\load_test.py
echo To run load tests:
echo 1. Start the backend server: uvicorn main:app --reload
echo 2. Run load tests: locust -f load_test.py --host=http://localhost:8000
echo 3. Open http://localhost:8089 to configure and run tests
echo.

echo ===============================================
echo ✅ TEST SUITE SETUP COMPLETE
echo ===============================================
echo.
echo Test Summary:
echo - Backend: pytest with comprehensive API testing
echo - Frontend: Jest with React Testing Library
echo - E2E: Cypress for complete user workflows
echo - Load: Locust for performance testing
echo.
echo All test suites are ready for execution!
echo See TEST_SUITE_SUMMARY.md for detailed documentation.

pause