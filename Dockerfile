# FROM python:3.10-slim
FROM python:3.10-bullseye

WORKDIR /app

RUN apt-get update && apt-get install -y libgomp1
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends libgomp1 && \
#     rm -rf /var/lib/apt/lists/*

COPY flask_app/ /app/

COPY tfidf_vectorizer.pkl /app/tfidf_vectorizer.pkl

RUN pip install -r requirements.txt

RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

CMD ["python", "app.py"]