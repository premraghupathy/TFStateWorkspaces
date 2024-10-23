resource "aws_instance" "prem_tf_workspace-ec2" {
  instance_type="t2.micro"
  ami="ami-0e86e20dae9224db8"
  subnet_id="subnet-04edb3ea22236883e"
}

terraform {
  backend "s3" {
    bucket = "prem-tf-state-s3"
    key = "workspaces/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "prem-tf-state-lock-dyna"
    encrypt = true
  }
}
