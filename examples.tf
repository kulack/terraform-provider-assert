// Any condition that evaluates to false will throw error

// make sure all users are using workspaces
// if current workspace is default throw error
data "asserting_test" "workspace" {
    test = terraform.workspace != "default"
    throw = "default workspace is not valid in this project"
}

data "aws_region" "current" {}

// region restrictions
// make sure this project is only deployable in certain region
data "asserting_test" "region" {
    test = data.aws_region.current.name == "eu-west-1"
    throw = "You cannot deploy this resource in any other region but eu-west-1"
}