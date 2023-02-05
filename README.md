# bluegreen-terraform-infra-study
AWS infrastructure designed by Terraform for Blue-Green Deployments

Steps to the solution:
1.  Design "vpc.tf"
2.  Design "subnets.tf"
3.  Allocate "internet_gw.tf"
4.  Create "route_table.tf"
5.  Associate "route_table_association.tf"
6.  Configure "security_group.tf" (ingress & egress settings)
7.  Define "ami_datasource.tf"
8.  Describe the traffic distribution between blue and/or green deployment nodes "locals.tf"
9.  Create userdata for the instrances "userdata-apache.sh"
10. Design Blue deployment instance configuration "blue_instance.tf" #Address "userdata-apache.sh" file 
11. Design Green deployment instance configuration "green_instance.tf" #Address "userdata-apache.sh" file
12. Define "variables.tf"
13. Create "load_balancer.tf" #including listener
14. Create "outputs.tf"

15. While applying the module do not forget modifying:

        1.  -var traffic_distribution=(blue / blue-90 / split / green-90 / green)
        2.  -var enable_green_env=(true / false) #default is false
        3.  -var enable_blue_env=(true / false) #default is true

16. For visualizing the infrastructure: 
        1.  Create "plan.out"
        2.  Create "plan.json"
        3.  Submit plan.json file to the address to see the output: https://hieven.github.io/terraform-visual/
