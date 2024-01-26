provider "aws" {
  profile   =   "mjbmgt"
  region    =   "ap-northeast-1"
  assume_role {
    role_arn = "arn:aws:iam::342156233500:role/_MJBMGTIn-MJBSANDBOX-Admin"
    session_name = "paul-sandbox"
  }  
}

module "template" {
  source    = "./modules/launch_template"
  template_list = var.template_list
}