PASSWD=$1
TAG=$2
echo tag=${TAG}
docker login -u lixiepeng -p ${PASSWD}
docker build . -t lixiepeng/cv:pyresparser-${TAG}
docker tag lixiepeng/cv:pyresparser-${TAG} hub.docker.com/lixiepeng/cv:pyresparser-${TAG}
docker push hub.docker.com/lixiepeng/cv:pyresparser-${TAG}
docker run -it --rm lixiepeng/cv:pyresparser-${TAG}