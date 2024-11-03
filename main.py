from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import os
import shutil
from typing import List
from pathlib import Path

from langchain import PromptTemplate
from langchain.docstore.document import Document
from langchain.document_loaders import TextLoader
from langchain_text_splitters import CharacterTextSplitter
from langchain.schema import StrOutputParser
from langchain.schema.runnable import RunnablePassthrough
from langchain_google_genai import GoogleGenerativeAIEmbeddings, ChatGoogleGenerativeAI
from langchain_chroma import Chroma
from google.oauth2 import service_account

from fastapi.middleware.cors import CORSMiddleware



app = FastAPI(title="ITU RAG API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://campusai.flutterflow.app"],  # Güvenilir kökenleri buraya ekleyin
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Model için request şeması
class QuestionRequest(BaseModel):
    question: str

# Sabit yapılandırmalar
CREDENTIALS_PATH = r'foritu-deneme-7f2584d4844c.json'
TEXT_FILE_PATH = r"merge_from_ofoct.txt"
CHROMA_DB_PATH = "./chroma_db"

# Prompt template
LLM_PROMPT_TEMPLATE = """You are an assistant helping to answer questions. You generate responses using the provided context. Your language is friendly and polite. Additionally, respond in the same language as the question.

Context notes:
The context comes from university documents and may include FAQs or information from university regulations. Answer the questions based on this context.
Remember: your role is to assist people.

If the context mentions the university's name, such as ("Istanbul Technical University", "ITU", etc.), avoid including these words in your response.
Additionally, if asked, "what can you do?", respond with something like, "I can answer your questions about the university and guide you on what needs to be done."

Question: {question}
Context: {context}
Answer:"""

class RAGSystem:
    def __init__(self):
        self.credentials = None
        self.embedding_model = None
        self.vectorstore = None
        self.retriever = None
        self.chat_model = None
        self.rag_chain = None

    def cleanup_chroma_db(self):
        """Clean up existing Chroma database"""
        db_path = Path(CHROMA_DB_PATH)
        if db_path.exists():
            try:
                shutil.rmtree(db_path)
                print(f"Successfully removed existing Chroma DB at {CHROMA_DB_PATH}")
            except Exception as e:
                print(f"Error removing Chroma DB: {e}")
                raise

    def initialize(self):
        # Clean up existing database
        self.cleanup_chroma_db()

        # Credentials yükleme
        self.credentials = service_account.Credentials.from_service_account_file(CREDENTIALS_PATH)
        
        # Embedding model başlatma
        self.embedding_model = GoogleGenerativeAIEmbeddings(
            model="models/text-embedding-004",
            credentials=self.credentials
        )
        
        # Metin yükleme ve chunking
        if not os.path.isfile(TEXT_FILE_PATH):
            raise FileNotFoundError(f"File not found: {TEXT_FILE_PATH}")
        
        loader = TextLoader(TEXT_FILE_PATH, encoding="utf-8")
        doc = loader.load()[0]
        
        splitter = CharacterTextSplitter(
            separator="\n\n",
            chunk_size=300,
            chunk_overlap=100,
        )
        
        chunked_texts = splitter.create_documents([doc.page_content])
        
        # Vectorstore oluşturma
        self.vectorstore = Chroma.from_documents(
            documents=chunked_texts,
            embedding=self.embedding_model,
            persist_directory=CHROMA_DB_PATH
        )
        
        # Retriever ayarlama
        self.retriever = self.vectorstore.as_retriever(search_kwargs={"k": 3})
        
        # Chat model başlatma
        self.chat_model = ChatGoogleGenerativeAI(
            model="gemini-1.5-pro",
            temperature=0,
            max_tokens=500,
            timeout=None,
            max_retries=2,
            credentials=self.credentials
        )
        
        # RAG chain oluşturma
        llm_prompt = PromptTemplate.from_template(LLM_PROMPT_TEMPLATE)
        
        def format_docs(docs):
            return "\n\n".join(doc.page_content for doc in docs)
        
        def clean_response(response: str) -> str:
            return response.rstrip()
        
        self.rag_chain = (
            {"context": self.retriever | format_docs, "question": RunnablePassthrough()}
            | llm_prompt
            | self.chat_model
            | StrOutputParser()
            | clean_response
        )

# RAG sistem instance'ı
rag_system = RAGSystem()

@app.on_event("startup")
async def startup_event():
    """Uygulama başlatıldığında RAG sistemini initialize et"""
    try:
        rag_system.initialize()
    except Exception as e:
        print(f"Error initializing RAG system: {e}")
        raise

@app.post("/ask")
async def ask_question(request: QuestionRequest):
    """
    Soru sorma endpoint'i
    
    Parameters:
    - request: QuestionRequest modeli (soru içerir)
    
    Returns:
    - dict: Cevap içeren sözlük
    """
    try:
        if not rag_system.rag_chain:
            raise HTTPException(status_code=500, detail="RAG system not initialized")
        
        answer = rag_system.rag_chain.invoke(request.question)
        return {"answer": answer}
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/health")
async def health_check():
    """Sağlık kontrolü endpoint'i"""
    return {"status": "healthy"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8080)