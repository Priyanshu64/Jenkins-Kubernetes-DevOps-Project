FROM ubuntu:latest

# Update package list and install required packages
RUN apt-get update && \
    apt-get install -y apache2 unzip curl

# Download the zip file and add it to the directory
ADD http://www.free-css.com/assets/files/free-css-templates/downloads/pages254/photogenic.zip /var/www/html/

# Change the working directory
WORKDIR /var/www/html

# Unzip the file and remove the zip file
RUN unzip photogenic.zip && rm photogenic.zip

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]



