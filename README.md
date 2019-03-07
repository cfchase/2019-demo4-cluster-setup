# RH Summit 2019 Demo 4 Cluster Setup

This repo contains all scripts to prepare an OpenShift 4 cluster to run Demo 4.

## Setup

Create a `.env` file with all the required environment variables. An example env file [.env.example](.env.example) is included.

```bash
cp .env.example .env
```

Test that you can login to the server with

```bash
make oc_login
```

### Adding scripts

Just create a sub directory, add a shell script and resource files and execute them via the Makefile.
Note that the commands in a `Makefile` have to be indented by tabs.
Also add a short description to this `README.md`

## Knative

To install all Knative components (build, serving, and eventing) and
its required Istio, run

```bash
make install_knative
```

For the most part, it should be idempotent, i.e. it won't install OLM
or Istio if their respective namespaces already exist. It will
re-apply the knative operator resources, but as long as they haven't
changed, OLM shouldn't care.

## Deloying Infinispan/Datagrid
To deploy datagrid to the `datagrid-demo` project:
```
make datagrid
```

## Deploying front end phone application, websocket server, and AI endpoint
To deploy the phone application, set the appropriate s3 environment variables
for your s3 bucket as shown in the `.env.example`.  Leaving the s3 variables 
will run the frontend without saving the training data to s3.
```
make frontend
```
