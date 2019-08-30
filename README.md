# cloud_run_app

## Running the Application Locally

Run `aqueduct serve` from this directory to run the application. For running within an IDE, run `bin/main.dart`. By default, a configuration file named `config.yaml` will be used.

To generate a SwaggerUI client, run `aqueduct document client`.

## Running Application Tests

To run all tests for this application, run the following in this directory:

```
pub run test
```

The default configuration file used when testing is `config.src.yaml`. This file should be checked into version control. It also the template for configuration files used in deployment.

## Deploying an Application

See the documentation for [Deployment](https://aqueduct.io/docs/deploy/).

## Recreate this project

```
$ pub global activate aqueduct
$ aqueduct create cloud_run_app
$ cd cloud_run_app

[add environment variable support]
[rename bin/main.dart to bin/server.dart]
[add Dockerfile]
[build image]

$ gcloud auth login
$ gcloud config set project myproject-8d802
$ gcloud builds submit --tag gcr.io/myproject-8d802/helloworld
$ gcloud config set run/region us-central1
$ gcloud beta run deploy --image gcr.io/myproject-8d802/helloworld --platform managed
```