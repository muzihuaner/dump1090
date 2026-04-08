FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    librtlsdr-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN make

EXPOSE 8080

CMD ["./dump1090", "--interactive", "--net"]
