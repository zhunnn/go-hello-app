FROM golang:1.24-alpine AS builder

WORKDIR /app

# 安裝 git 和 libc（避免某些模組需要）
RUN apk add --no-cache git

COPY . .

RUN go mod tidy

# ✅ 強制靜態編譯
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /server .

# ---

FROM alpine:3.20

# 為安全起見，創建非 root 使用者（可選）
# RUN adduser -D appuser
# USER appuser

COPY --from=builder /server /server

ENTRYPOINT ["/server"]
