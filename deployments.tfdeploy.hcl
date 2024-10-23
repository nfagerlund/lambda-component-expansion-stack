# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

store "varset" "stack-business" {
    category = "terraform"
    id = "varset-SbF4fhDrFFvU3pRW"
}

deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    role_arn       = store.varset.stack-business.demo_role_arn
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "production" {
  inputs = {
    regions        = ["us-east-1", "us-west-1"]
    role_arn       = store.varset.stack-business.demo_role_arn
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}
