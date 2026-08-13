data "aws_vpc" "existing_vpc" {
    id = "vpc-05b4d69540852f37d"
} 

data "aws_subnet" "subnet1" {
    id = "subnet-0717ab502cf1dc447"
}

data "aws_subnet" "subnet2" {
    id = "subnet-0c48ea0b63991c512"
}