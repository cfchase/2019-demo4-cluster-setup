ENV_FILE := .env
include ${ENV_FILE}
export $(shell sed 's/=.*//' ${ENV_FILE})

# NOTE: the actual commands here have to be indented by TABs
oc_login:
	${OC} login ${OC_URL} -u ${OC_USER} -p ${OC_PASSWORD} --insecure-skip-tls-verify=true

install_knative: oc_login
	./knative/install.sh

datagrid: oc_login
	./datagrid/deploy.sh

kafka: oc_login
	./kafka/deploy.sh

ml: oc_login
	./ml/deploy.sh

syndesis: oc_login
	./syndesis/deploy.sh

camel-k: oc_login
	./syndesis/deploy_camel_k.sh

frontend: oc_login
	./frontend/deploy.sh

machine-history: oc_login
	./machinehistory/install.sh

apicurio: oc_login
	./apicurio/install.sh

optaplanner: oc_login
	./optaplanner/deploy.sh

opendatahub: oc_login
	./opendatahub/deploy.sh

cluster_create:
	./cluster-installer/create.sh ${CLUSTER_NAME} ${MASTER_EC2_TYPE} ${WORKER_EC2_TYPE} ${AWS_REGION} ${CLUSTER_CONFIG_HOME} ${VERSION}

.PHONY: kafka
