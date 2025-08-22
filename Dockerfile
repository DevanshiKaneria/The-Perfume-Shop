# Use a lightweight NGINX web server
FROM nginx:alpine

# Copy all your website files from the current folder
# to the web server's root directory in the container.
COPY . /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80