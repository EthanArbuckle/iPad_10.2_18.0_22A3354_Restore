@implementation WFSettingsIPV4

+ (id)automaticConfig
{
  return -[WFSettingsIPV4 initWithMethod:addresses:subnetMasks:router:dhcpClientID:]([WFSettingsIPV4 alloc], "initWithMethod:addresses:subnetMasks:router:dhcpClientID:", 1, 0, 0, 0, 0);
}

+ (id)bootPConfig
{
  return -[WFSettingsIPV4 initWithMethod:addresses:subnetMasks:router:dhcpClientID:]([WFSettingsIPV4 alloc], "initWithMethod:addresses:subnetMasks:router:dhcpClientID:", 5, 0, 0, 0, 0);
}

- (WFSettingsIPV4)initWithDictionary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSArray *v9;
  NSArray *addresses;
  NSArray *v11;
  NSArray *subnetMasks;
  NSString *v13;
  NSString *router;
  NSString *v15;
  NSString *dhcpClientID;
  NSObject *v18;
  os_log_type_t v19;
  os_log_type_t v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v7 = 0;
    goto LABEL_17;
  }
  objc_storeStrong((id *)&self->_items, a3);
  -[NSDictionary objectForKey:](self->_items, "objectForKey:", *MEMORY[0x24BDF5AE0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18)
    {
      if (os_log_type_enabled(v18, v20))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_219FC8000, v18, v20, "Missing kSCPropNetIPv4ConfigMethod in dictionary.", (uint8_t *)&v21, 2u);
      }
      v7 = 0;
    }
LABEL_16:

LABEL_17:
    self = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5BD0]) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDF5BE0]) & 1) == 0)
  {
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDF5BF8]) & 1) != 0)
    {
      v8 = 4;
      goto LABEL_6;
    }
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDF5BD8]) & 1) != 0)
    {
      v8 = 5;
      goto LABEL_6;
    }
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      v21 = 138543362;
      v22 = v7;
      _os_log_impl(&dword_219FC8000, v18, v19, "Unsupported IPv4 config method %{public}@", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_16;
  }
  v8 = 1;
LABEL_6:
  self->_method = v8;
  -[NSDictionary objectForKey:](self->_items, "objectForKey:", *MEMORY[0x24BDF5AD8]);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  addresses = self->_addresses;
  self->_addresses = v9;

  -[NSDictionary objectForKey:](self->_items, "objectForKey:", *MEMORY[0x24BDF5B00]);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  subnetMasks = self->_subnetMasks;
  self->_subnetMasks = v11;

  -[NSDictionary objectForKey:](self->_items, "objectForKey:", *MEMORY[0x24BDF5AF8]);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  router = self->_router;
  self->_router = v13;

  -[NSDictionary objectForKey:](self->_items, "objectForKey:", *MEMORY[0x24BDF5AE8]);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  dhcpClientID = self->_dhcpClientID;
  self->_dhcpClientID = v15;

LABEL_7:
  return self;
}

- (WFSettingsIPV4)initWithMethod:(int64_t)a3 addresses:(id)a4 subnetMasks:(id)a5 router:(id)a6 dhcpClientID:(id)a7
{
  id v13;
  id v14;
  id v15;
  WFSettingsIPV4 *v16;
  id *v17;
  NSObject *v18;
  os_log_type_t v19;
  NSDictionary *v20;
  id v21;
  void *items;
  void *v23;
  WFSettingsIPV4 *v24;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v26 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)WFSettingsIPV4;
  v16 = -[WFSettingsIPV4 init](&v27, sel_init);
  if (v16)
  {
    v17 = (id *)MEMORY[0x24BDF5BE0];
    switch(a3)
    {
      case 0:
      case 2:
      case 6:
      case 7:
        goto LABEL_3;
      case 1:
      case 3:
        goto LABEL_13;
      case 4:
        v17 = (id *)MEMORY[0x24BDF5BF8];
        goto LABEL_13;
      case 5:
        v17 = (id *)MEMORY[0x24BDF5BD8];
LABEL_13:
        v21 = *v17;
        if (v21)
        {
          v16->_method = a3;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v21, *MEMORY[0x24BDF5AE0]);
          if (v26)
          {
            objc_storeStrong((id *)&v16->_addresses, a4);
            objc_msgSend(v23, "setObject:forKey:", v26, *MEMORY[0x24BDF5AD8]);
          }
          if (v13)
          {
            objc_storeStrong((id *)&v16->_subnetMasks, a5);
            objc_msgSend(v23, "setObject:forKey:", v13, *MEMORY[0x24BDF5B00]);
          }
          if (v14)
          {
            objc_storeStrong((id *)&v16->_router, a6);
            objc_msgSend(v23, "setObject:forKey:", v14, *MEMORY[0x24BDF5AF8]);
          }
          if (v15)
          {
            objc_storeStrong((id *)&v16->_dhcpClientID, a7);
            objc_msgSend(v23, "setObject:forKey:", v15, *MEMORY[0x24BDF5AE8]);
          }
          v20 = v23;
          items = v16->_items;
          v16->_items = v20;
        }
        else
        {
          v20 = 0;
          items = v16;
          v16 = 0;
        }
        break;
      default:
        if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_3:
          WFLogForCategory(0);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
          {
            *(_DWORD *)buf = 134217984;
            v29 = a3;
            _os_log_impl(&dword_219FC8000, v18, v19, "Unsupported WFIPv4ConfigMethod used %lu", buf, 0xCu);
          }

        }
        v20 = 0;
        v21 = 0;
        items = v16;
        v16 = 0;
        break;
    }
  }
  else
  {
    v20 = 0;
    v21 = 0;
    items = 0;
  }

  v24 = v16;
  return v24;
}

- (id)protocol
{
  return (id)*MEMORY[0x24BDF59F0];
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@- "), v5);

  -[WFSettingsIPV4 items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDF5AE0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("ConfigMethod: %@ "), v7);

  objc_msgSend(v3, "appendString:", CFSTR("| Addresses: "));
  -[WFSettingsIPV4 addresses](self, "addresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFSettingsIPV4 addresses](self, "addresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v10);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("(None) "));
  }
  objc_msgSend(v3, "appendString:", CFSTR("| SubnetMasks: "));
  -[WFSettingsIPV4 subnetMasks](self, "subnetMasks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFSettingsIPV4 subnetMasks](self, "subnetMasks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v13);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("(None) "));
  }
  objc_msgSend(v3, "appendString:", CFSTR("| Router: "));
  -[WFSettingsIPV4 router](self, "router");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[WFSettingsIPV4 router](self, "router");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v15);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("(None) "));
  }
  objc_msgSend(v3, "appendString:", CFSTR("| DHCP Client ID: "));
  -[WFSettingsIPV4 dhcpClientID](self, "dhcpClientID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[WFSettingsIPV4 dhcpClientID](self, "dhcpClientID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v17);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("(None) "));
  }
  return (NSString *)v3;
}

- (int64_t)method
{
  return self->_method;
}

- (void)setMethod:(int64_t)a3
{
  self->_method = a3;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_addresses, a3);
}

- (NSArray)subnetMasks
{
  return self->_subnetMasks;
}

- (void)setSubnetMasks:(id)a3
{
  objc_storeStrong((id *)&self->_subnetMasks, a3);
}

- (NSString)router
{
  return self->_router;
}

- (void)setRouter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)dhcpClientID
{
  return self->_dhcpClientID;
}

- (void)setDhcpClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dhcpClientID, 0);
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_subnetMasks, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end
