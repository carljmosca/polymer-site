
docker stop polymer-site
docker rm polymer-site
docker run -d --name=polymer-site \
    --user=1000001:0 \
    -p 8000:8000 \
    -e GIT_URI=https://github.com/carljmosca/polymer-site.git \
    -e GIT_DIRECTORY=site \
    carljmosca/polymer-site:1.00