FROM alpine:latest
RUN apk add --no-cache wget unzip
WORKDIR /app
# Download the Xray core (The heart of Hiddify/VLESS)
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
unzip Xray-linux-64.zip && \
rm Xray-linux-64.zip
# Create a basic config
COPY config.json /app/config.json
CMD ["./xray", "-c", "config.json"]