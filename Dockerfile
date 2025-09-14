# Use a lightweight Nginx image
FROM nginx:alpine

# Copy your web app files into Nginx's default directory
COPY src/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
