docker build -t mcdropout . -f Dockerfile
docker run -it --rm -e "PORT=80" -v $PWD:/app -p 0.0.0.0:8084:80 --name mcdropout  mcdropout
