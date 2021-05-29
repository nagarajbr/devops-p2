STACK_NAME="UdaDevOpsP2-HA-compute-services"
ACTION=$1

case $ACTION in

  create)
    aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body file://compute-scaling-elb-stack-config.yaml \
    --parameters file://compute-scaling-elb-params.json \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
    --region=us-east-1
    ;;

  update)
    aws cloudformation update-stack \
    --stack-name $STACK_NAME \
    --template-body file://compute-scaling-elb-stack-config.yaml \
    --parameters file://compute-scaling-elb-params.json
    ;;

  delete)
    aws cloudformation delete-stack \
    --stack-name $STACK_NAME
    ;;

  *)
    echo -n "Valid Arguments are: create | update | delete"
    ;;
esac