# Use a base image
FROM nginx:latest

# Copy the built application to the NGINX web root directory
COPY c:/Faisalkayani/wwwroot /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Start NGINX when the container is run
CMD ["nginx", "-g", "daemon off;"]
