# terminate-all-instances-in-auto-scaling-group
aws ec2 describe-instances --filter Name=tag:aws:autoscaling:groupName,Values=<ASG-NAME> --query 'Reservations[].Instances[].{ID:InstanceId}' --output text |
while read line; 
do 
aws autoscaling terminate-instance-in-auto-scaling-group --instance-id $line --no-should-decrement-desired-capacity;
done