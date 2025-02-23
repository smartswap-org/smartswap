FROM node:18-alpine as webapp-builder
WORKDIR /app/webapp
COPY webapp/package*.json ./
RUN npm install --production
COPY webapp/ .
RUN npm run build && npm cache clean --force

FROM python:3.9-slim as python-base
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

FROM python-base as aegis
WORKDIR /app/aegis
COPY aegis/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && find /usr/local/lib/python3.9/site-packages -name "*.pyc" -delete \
    && find /usr/local/lib/python3.9/site-packages -name "__pycache__" -delete
COPY aegis/ .
ENV PYTHONPATH=/app/aegis
EXPOSE 5001
CMD ["python", "run.py"]

FROM python-base as qtsbe-api
WORKDIR /app/qtsbe
COPY QTSBE/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && find /usr/local/lib/python3.9/site-packages -name "*.pyc" -delete \
    && find /usr/local/lib/python3.9/site-packages -name "__pycache__" -delete
COPY QTSBE/ .
ENV PYTHONPATH=/app/qtsbe \
    PYTHONDONTWRITEBYTECODE=1
EXPOSE 5002
CMD ["sh", "sh/api.sh"]

FROM python-base as qtsbe-autofetch
WORKDIR /app/qtsbe
COPY QTSBE/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && find /usr/local/lib/python3.9/site-packages -name "*.pyc" -delete \
    && find /usr/local/lib/python3.9/site-packages -name "__pycache__" -delete
COPY QTSBE/ .
ENV PYTHONPATH=/app/qtsbe \
    PYTHONDONTWRITEBYTECODE=1
CMD ["sh", "sh/auto_fetch.sh"]

FROM python-base as qtsbe-discord
WORKDIR /app/qtsbe
COPY QTSBE/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && find /usr/local/lib/python3.9/site-packages -name "*.pyc" -delete \
    && find /usr/local/lib/python3.9/site-packages -name "__pycache__" -delete
COPY QTSBE/ .
ENV PYTHONPATH=/app/qtsbe \
    PYTHONDONTWRITEBYTECODE=1
CMD ["sh", "sh/discord_chat_bot.sh"]

FROM python-base as qtb-main
WORKDIR /app/qtb
COPY qtb/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && find /usr/local/lib/python3.9/site-packages -name "*.pyc" -delete \
    && find /usr/local/lib/python3.9/site-packages -name "__pycache__" -delete
COPY qtb/ .
ENV PYTHONPATH=/app/qtb \
    PYTHONDONTWRITEBYTECODE=1
CMD ["sh", "sh/qtb.sh"]

FROM python-base as qtb-app
WORKDIR /app/qtb
COPY qtb/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && find /usr/local/lib/python3.9/site-packages -name "*.pyc" -delete \
    && find /usr/local/lib/python3.9/site-packages -name "__pycache__" -delete
COPY qtb/ .
ENV PYTHONPATH=/app/qtb \
    PYTHONDONTWRITEBYTECODE=1
CMD ["sh", "sh/qtbapp.sh"]

FROM nginx:alpine
WORKDIR /app
COPY --from=webapp-builder /app/webapp/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN rm -rf /var/cache/nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]