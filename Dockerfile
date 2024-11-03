FROM python:3.12-slim

# Gerekli sistem bağımlılıklarını yükle
RUN apt-get update && apt-get install -y \
  build-essential \
  python3-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Çalışma dizinini ayarla
WORKDIR /temiz-app

# requirements.txt dosyasını kopyala
COPY requirements.txt .

# requirements.txt dosyasındaki bağımlılıkları yükle
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama dosyalarını kopyala
COPY . .


EXPOSE 8080
# Uygulamayı başlat
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
