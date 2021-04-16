terraform {
  required_providers {
    tines = {
      source  = "github.com/tuckner/tines"
      version = ">= 0.0.5"
    }
  }
  backend "s3" {
    bucket = "tines-terraform-state"
    region = "us-east-1"
    key = "deploy/terraform.tfstate"
  }
}

provider "tines" {
    email    = var.tines_email
    base_url = var.tines_base_url
    token    = var.tines_token
}

resource "tines_story" "story1" {
    name = "Github Action Example"
    description = "Hello there!"
    team_id = var.team_id
}

resource "tines_note" "note1" {
    story_id = tines_story.story1.id
    content = "This was created by Terraform!!!"
    position = {
      x = 105.0
      y = 100.0
    }
}  

resource "tines_note" "note2" {
    story_id = tines_story.story1.id
    content = "Each new deploy is registered in version control."
    position = {
      x = 105.0
      y = 170.0
    }
}  

resource "tines_note" "note3" {
    story_id = tines_story.story1.id
    content = "Any changes will need to go through the Github flow!"
    position = {
      x = 105.0
      y = 240.0
    }
}  

resource "tines_note" "note4" {
    story_id = tines_story.story1.id
    content = "For more information, check out https://github.com/tuckner/tines-deploy-actions"
    position = {
      x = 105.0
      y = 320.0
    }
}  
