FROM ghcr.io/booklore-app/booklore:latest

# Pre-create volume structure (will be populated at runtime)
RUN mkdir -p /booklore-data/app-data /booklore-data/books /bookdrop

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["java", "-jar", "/app/app.jar"]
