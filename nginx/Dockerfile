# In your Dockerfile.
FROM nginx:1.13.10

COPY build/config/nginx/certs/chat.crt /etc/nginx/certificate.crt
COPY build/config/nginx/keys/chat.key /etc/nginx/certificate.key

COPY nginx.conf /etc/nginx/nginx.conf