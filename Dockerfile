FROM golang:alpine 

WORKDIR /webserver

COPY go.mod go.sum ./

RUN go mod download

COPY ./ ./

RUN CGO_ENABLED=0 GOOS=linux go build -o ./apiserver

CMD ["./apiserver"]
