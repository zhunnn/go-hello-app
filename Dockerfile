FROM golang:1.24 as builder

WORKDIR /app
COPY . .

RUN go mod tidy
RUN go build -o server .

FROM alpine:3.20
COPY --from=builder /app/server /server
CMD ["/server"]
