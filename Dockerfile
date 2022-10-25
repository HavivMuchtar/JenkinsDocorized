FROM alpine:latest as pre-builder
workdir /pre-builder
COPY ./test.py .
CMD ["sh", "echo", "Prebuild actions"]

FROM alpine:latest as builder
workdir /builder
CMD ["sh", "docker build --target Build ."]

FROM alpine:latest as test
workdir /test
COPY --from=pre-builder /pre-builder/test.py .
CMD ["sh", "docker build --target test ."]

FROM alpine:latest as security
workdir /security
CMD ["sh", "echo", "This is security"]

FROM alpine:latest as backend
workdir /backend
CMD ["sh", "echo", "mvn --version"]

FROM alpine:latest as frontend
workdir /frontend
CMD ["sh", "echo", "Frontend actions"]

FROM alpine:latest as deploy
workdir /deploy
CMD ["sh", "docker build --target deploy ."]

FROM alpine:latest as post
workdir /post
CMD ["sh", "echo", "Clear env actions"]
