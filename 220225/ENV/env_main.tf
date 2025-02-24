variable "varenvrg" {}
variable "varenvvn" {}
variable "varenvsn" {}
variable "varenvpi" {}
variable "varenvni" {}
variable "varenvvm" {}
# variable "varenvkv" {}
variable "varenvnsg" {}
variable "varenvnsgni" {}


module "rg-mod" {
  source = "source = git::https://github.com/careerdeveloper1/code.git//RG"
  varrg = var.varenvrg
  
}

module "vn-mod" {
  source = "source = git::https://github.com/careerdeveloper1/code.git//VN"
  varvn = var.varenvvn
  depends_on = [ module.rg-mod ]
  
}

module "sn-mod" {
  source = "source = git::https://github.com/careerdeveloper1/code.git//SN"
  varsn = var.varenvsn
  depends_on = [ module.vn-mod ]
  
}

module "pi-mod" {
  source = "source = git::https://github.com/careerdeveloper1/code.git//PI"
  varpi = var.varenvpi
  depends_on = [ module.rg-mod ]
  
}


module "ni-mod" {
  depends_on = [ module.pi-mod, module.sn-mod, module.vn-mod ]
  source = "source = git::https://github.com/careerdeveloper1/code.git//NI"
  varni = var.varenvni
  vardatapi = var.varenvpi
  vardatasi = var.varenvsn
  
  
}

module "vm-mod" {
  depends_on = [ module.ni-mod, module.sn-mod ]
  source = "source = git::https://github.com/careerdeveloper1/code.git//VM"
  varvm= var.varenvvm
  vardatanic= var.varenvni
  # varkv = var.varenvkv
}


module "nsg-mod" {
  depends_on = [ module.rg-mod ]
  source = "source = git::https://github.com/careerdeveloper1/code.git//NSG"
  varnsg = var.varenvnsg
}

module "nsgni-mod" {
  depends_on = [ module.nsg-mod, module.ni-mod ]
  source = "source = git::https://github.com/careerdeveloper1/code.git//NSGNI"
  varnsgni = var.varenvnsgni
  
}