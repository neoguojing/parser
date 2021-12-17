# debug
# docker run -it --name pyresparser -v PWD:/pyresparser -p 8501:8501 lixiepeng/cv:pyresparser-0.0.1 # update code
# docker run -it --name pyresparser --network host lixiepeng/cv:pyresparser-0.0.1 # pass port issue

# deploy
docker run -it --name pyresparser -p 8501:8501 lixiepeng/cv:pyresparser-0.0.1