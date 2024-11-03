# ITU RAG API

A FastAPI-based RAG (Retrieval Augmented Generation) system designed to answer questions about Istanbul Technical University using Google's Generative AI models.

## Features

- Question answering using RAG architecture
- Integration with Google's Gemini-1.5-pro for text generation
- Document embedding using Google's text-embedding-004 model
- Vector storage using Chroma DB
- FastAPI endpoints for question answering and health checking
- Docker support for easy deployment

## Prerequisites

- Python 3.12+
- Google Cloud Service Account credentials
- Docker (optional, for containerized deployment)

## Required Files

1. `foritu-deneme-7f2584d4844c.json` - Google Cloud Service Account credentials file
2. `merge_from_ofoct.txt` - Source text file containing ITU-related information
3. `requirements.txt` - Python dependencies file

## Project Structure

```
.
├── Dockerfile
├── main.py
├── requirements.txt
├── foritu-deneme-7f2584d4844c.json
├── merge_from_ofoct.txt
└── chroma_db/
```

## Installation

### Local Setup

1. Clone the repository:
```bash
git clone <repository-url>
cd itu-rag-api
```

2. Create and activate a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Place your Google Cloud credentials file (`foritu-deneme-7f2584d4844c.json`) in the project root.

5. Place your source text file (`merge_from_ofoct.txt`) in the project root.

### Docker Setup

1. Build the Docker image:
```bash
docker build -t itu-rag-api .
```

2. Run the container:
```bash
docker run -p 8080:8080 itu-rag-api
```

## Usage

### API Endpoints

1. Health Check:
```bash
GET /health
```
Response:
```json
{
    "status": "healthy"
}
```

2. Ask a Question:
```bash
POST /ask
Content-Type: application/json

{
    "question": "Your question here"
}
```
Response:
```json
{
    "answer": "Generated answer based on the context"
}
```

### Example Usage

```python
import requests

# Health check
response = requests.get("http://localhost:8080/health")
print(response.json())

# Ask a question
question = {
    "question": "What are the admission requirements for ITU?"
}
response = requests.post("http://localhost:8080/ask", json=question)
print(response.json())
```

## Environment Variables

No environment variables are required as the application uses fixed file paths. However, make sure the following files are present:

- `foritu-deneme-7f2584d4844c.json` - Google Cloud credentials
- `merge_from_ofoct.txt` - Source text file

## Development

The system uses a RAG architecture with the following components:

- Text Embedding: Google's text-embedding-004 model
- Vector Store: Chroma DB for efficient similarity search
- LLM: Gemini-1.5-pro for generating responses
- API Framework: FastAPI for handling HTTP requests

## Docker Configuration

The included Dockerfile:
- Uses Python 3.12 slim base image
- Installs necessary system dependencies
- Sets up the working directory as `/temiz-app`
- Installs Python dependencies from requirements.txt
- Exposes port 8080
- Runs the FastAPI application using uvicorn

## Error Handling

The API implements error handling for:
- System initialization failures
- Question processing errors
- Missing credentials or source files

## License

[Your chosen license]

## Contributing

[Your contribution guidelines]