FROM golang:1.14

RUN go get -u github.com/tomnomnom/httprobe

ENTRYPOINT ["/go/bin/httprobe"] 
CMD ["-h"]