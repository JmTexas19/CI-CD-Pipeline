The purpose of this repository is to accomplish the following:
- Create a simple hello world web application using Express and Node.js.
- Containerize the app into a Docker Container.
- Using Github Actions, create a CI/CD pipeline that will do the following.
  - Run CI on the app, such as lint, on every push to the repo.
  - Build the docker image from the Dockerfile and push it to the Artifact Registry in GCP.
  - Using Terraform, spin up a Cloud Run Service that will deploy that same Docker image to `https://simple-web-app-service-yjnc6rax3q-uc.a.run.app/`.

 Any push to master will result in the above. You can then `cd` into `terraform` and run `terraform destroy` to wind the resource back down.

 The Github Actions Secrets contain the GCP Project ID and the Service Account API Key needed.
