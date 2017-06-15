docker stop webapp
docker rm webapp 
docker run -d -p 8081:4567 --name webapp -v $PWD/webapp:/opt/webapp pkpk1234/sinatra
