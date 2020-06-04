FROM golang:1.14

RUN go get -u github.com/tomnomnom/assetfinder

ENTRYPOINT ["/go/bin/assetfinder"] 
CMD ["-h"]