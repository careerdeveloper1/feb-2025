# Resource Groups
varenvrg = {
  rg01 = {
    rg-name    = "master"
    rg-location = "east us"
  }
  rg02 = {
    rg-name    = "worker"
    rg-location = "central us"
  }

}


# Virtual Networks
varenvvn = {
  vn01 = {
    name                = "server-vn01"
    resource_group_name = "master"
    location            = "east us"
    address_space       = ["10.1.0.0/16"]
  }
  vn02 = {
    name                = "server-vn02"
    resource_group_name = "worker"
    location            = "central us"
    address_space       = ["10.2.0.0/16"]
  }

}

# Subnets
varenvsn = {
  sn01 = {
    name                 = "server-sn01"
    resource_group_name  = "master"
    virtual_network_name = "server-vn01"
    address_prefixes     = ["10.1.10.0/28"]
  }
  sn02 = {
    name                 = "server-sn02"
    resource_group_name  = "worker"
    virtual_network_name = "server-vn02"
    address_prefixes     = ["10.2.10.0/28"]
  }

}

# Public IPs
varenvpi = {
  pi01 = {
    name                = "server-pip01"
    resource_group_name = "master"
    location            = "east us"
    allocation_method   = "Static"
  }
  pi02 = {
    name                = "server-pip02"
    resource_group_name = "worker"
    location            = "central us"
    allocation_method   = "Static"
  }

}

# Network Interfaces
varenvni = {
  ni01 = {
    name                      = "server-pni01"
    resource_group_name       = "master"
    location                  = "east us"
    public                    = "pi01"
    subnet                    = "sn01"
    ip-name                   = "server-ip01"
    private_ip_address_allocation = "Dynamic"
  }
  ni02 = {
    name                      = "server-pni02"
    resource_group_name       = "worker"
    location                  = "central us"
    public                    = "pi02"
    subnet                    = "sn02"
    ip-name                   = "server-ip02"
    private_ip_address_allocation = "Dynamic"
  }

}

# Virtual Machines
varenvvm = {
  vm01 = {
    name                = "MasterVM"
    ni                  = "ni01"
    resource_group_name = "master"
    location            = "east us"
    size                = "Standard_D4s_v3"
    username            = "welcomeuser"
    password            = "welcome@12345"
  }
  vm02 = {
    name                = "WorkerVM"
    ni                  = "ni02"
    resource_group_name = "worker"
    location            = "central us"
    size                = "Standard_D4s_v3"
    username            = "welcomeuser"
    password            = "welcome@12345"
  }

}

# Network Security Groups
varenvnsg = {
  nsg01 = {
    name                = "server-nsg01"
    location            = "east us"
    resource_group_name = "master"
  }
  nsg02 = {
    name                = "server-nsg02"
    location            = "central us"
    resource_group_name = "worker"
  }

}

# Network Security Group Network Interface Attachments
varenvnsgni = {
  nsgni01 = {
    nsg-name            = "server-nsg01"
    resource_group_name = "master"
    ni-name             = "server-pni01"
  }
  nsgni02 = {
    nsg-name            = "server-nsg02"
    resource_group_name = "worker"
    ni-name             = "server-pni02"
  }

}