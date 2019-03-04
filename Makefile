ENV_FILE := .env
include ${ENV_FILE}
export $(shell sed 's/=.*//' ${ENV_FILE})

# NOTE: the actual commands here have to be indented by TABs
oc_login:
	${OC} login ${OC_URL} -u ${OC_USER} -p ${OC_PASSWORD}

datagrid: oc_login
	./datagrid/deploy.sh
