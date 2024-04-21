# Use a imagem oficial do Golang como base
FROM golang:1.18-alpine AS builder

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o código fonte para o diretório de trabalho
COPY . .

# Compila o código fonte
RUN go build -o scraper .

# Imagem final
FROM alpine:latest

# Copia o binário compilado do estágio anterior
COPY --from=builder /app/scraper /usr/local/bin/scraper

# Comando padrão a ser executado quando o contêiner for iniciado
CMD ["scraper"]
