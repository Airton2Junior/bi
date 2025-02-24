# app/Dockerfile

FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Airton2Junior/bi.git .

RUN pip install streamlit

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["python3", "-m", "streamlit", "run", "primeiro_dashboard.py", "--server.port=8501", "--server.address=0.0.0.0"]