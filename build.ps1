$projectID = gcloud config get-value project;
docker build -t gcr.io/cloudside-academy/docker-windows .;
if ($?) {
    docker push gcr.io/cloudside-academy/docker-windows;
}
