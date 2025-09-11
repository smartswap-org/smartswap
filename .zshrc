stop() {
    echo "Stopping containers..."
    docker-compose down
    echo "Containers stopped."
}

start() {
    echo "Starting containers..."
    docker-compose up -d
    echo "Containers started."
}