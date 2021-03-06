# Qualysvm_scan_cloud_vm
Terraform Template to create Qualys scanner in your Qualys subscription, your aws/azure cloud to scan your AWS/Azure VMs.

# License
_**THIS SCRIPT IS PROVIDED TO YOU "AS IS."  TO THE EXTENT PERMITTED BY LAW, QUALYS HEREBY DISCLAIMS ALL WARRANTIES AND LIABILITY FOR THE PROVISION OR USE OF THIS SCRIPT.  IN NO EVENT SHALL THESE SCRIPTS BE DEEMED TO BE CLOUD SERVICES AS PROVIDED BY QUALYS**_

# Usage:
Use Terraform Template to create a Qualys Virtual Scanner and a vulnerable target VM in AWS/Azure and run a scan against them and get the output. To run the script you will need to supply credentials for the Qualys user name and password for Qualys API Access.

## Common Input Parameters: 

* userName: Default: {supply_Qualys_user_name_for_CloudView_API} ...

* password: Default: {supply_Qualys_user_password_for_CloudView_API}

* baseurl: Url of the Qualys CloudView APIs  example : https://qualysguard.qg2.apps.qualys.com 

* scannername: Name of the Qualys Scanner

* optionprofile: Name of the scanning option profile


## AWS Input Parameters:

* instance_type:

* vpc_id:

* key_name:

* subnet_id:


## Azure Input Parameters:

* instance_type:

* vpc_id:

* key_name:

* subnet_id:


## Terraform CLI to Run Template
An Example:
` terraform init

terraform plan

terraform apply `

You can copy/upload these templates and directly run in Azure Shell.

## Note
The terraform template makes use of the module by Matti present in this [GitHub repo](https://github.com/matti/terraform-shell-resource) for generation of output & error for null resource due to limitation of terraform. 
