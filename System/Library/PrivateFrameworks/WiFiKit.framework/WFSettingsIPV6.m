@implementation WFSettingsIPV6

- (WFSettingsIPV6)initWithDictionary:(id)a3
{
  id v5;
  WFSettingsIPV6 *v6;
  WFSettingsIPV6 *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *prefixLengths;
  uint64_t v13;
  NSArray *addresses;
  uint64_t v15;
  WFSettingsIPV6 *router;
  NSObject *v18;
  os_log_type_t v19;
  os_log_type_t v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFSettingsIPV6;
  v6 = -[WFSettingsIPV6 init](&v21, sel_init);
  v7 = v6;
  v8 = 0;
  if (!v5 || !v6)
  {
    router = v6;
    v7 = 0;
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_items, a3);
  -[NSDictionary objectForKey:](v7->_items, "objectForKey:", *MEMORY[0x24BDF5B10]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  if (!v9)
  {
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18)
    {
      if (os_log_type_enabled(v18, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v18, v20, "Missing kSCPropNetIPv6ConfigMethod in dictionary.", buf, 2u);
      }
      v8 = 0;
    }
    goto LABEL_16;
  }
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDF5C10]) & 1) == 0)
  {
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDF5C20]) & 1) != 0)
    {
      v10 = 3;
      goto LABEL_10;
    }
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDF5C18]) & 1) != 0)
    {
      v10 = 2;
      goto LABEL_10;
    }
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v8;
      _os_log_impl(&dword_219FC8000, v18, v19, "Uknown IPv6 config method %{public}@", buf, 0xCu);
    }
LABEL_16:

    router = v7;
    v7 = 0;
    goto LABEL_11;
  }
  v10 = 1;
LABEL_10:
  v7->_method = v10;
  -[NSDictionary objectForKey:](v7->_items, "objectForKey:", *MEMORY[0x24BDF5B28]);
  v11 = objc_claimAutoreleasedReturnValue();
  prefixLengths = v7->_prefixLengths;
  v7->_prefixLengths = (NSArray *)v11;

  -[NSDictionary objectForKey:](v7->_items, "objectForKey:", *MEMORY[0x24BDF5B08]);
  v13 = objc_claimAutoreleasedReturnValue();
  addresses = v7->_addresses;
  v7->_addresses = (NSArray *)v13;

  -[NSDictionary objectForKey:](v7->_items, "objectForKey:", *MEMORY[0x24BDF5B30]);
  v15 = objc_claimAutoreleasedReturnValue();
  router = (WFSettingsIPV6 *)v7->_router;
  v7->_router = (NSString *)v15;
LABEL_11:

  return v7;
}

- (WFSettingsIPV6)initWithMethod:(int64_t)a3 addresses:(id)a4 prefixLengths:(id)a5 router:(id)a6
{
  id v10;
  id v11;
  id v12;
  WFSettingsIPV6 *v13;
  id *v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  os_log_type_t v21;
  NSDictionary *v22;
  id v23;
  void *items;
  void *v25;
  WFSettingsIPV6 *v26;
  objc_super v28;
  uint8_t buf[4];
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)WFSettingsIPV6;
  v13 = -[WFSettingsIPV6 init](&v28, sel_init);
  if (v13)
  {
    v14 = (id *)MEMORY[0x24BDF5C10];
    switch(a3)
    {
      case 0:
      case 4:
      case 5:
        WFLogForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = OSLogForWFLogLevel(1uLL);
        if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v16))
          goto LABEL_13;
        *(_DWORD *)buf = 134349056;
        v30 = a3;
        v17 = "Unsupported WFIPv6ConfigMethod used %{public}ld";
        v18 = v15;
        v19 = v16;
        v20 = 12;
        goto LABEL_12;
      case 1:
        goto LABEL_18;
      case 2:
        v14 = (id *)MEMORY[0x24BDF5C18];
        goto LABEL_18;
      case 3:
        v14 = (id *)MEMORY[0x24BDF5C20];
LABEL_18:
        v23 = *v14;
        if (v23)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v23, *MEMORY[0x24BDF5B10]);
          if (v11)
            objc_msgSend(v25, "setObject:forKey:", v11, *MEMORY[0x24BDF5B28]);
          if (v10)
            objc_msgSend(v25, "setObject:forKey:", v10, *MEMORY[0x24BDF5B08]);
          if (v12)
            objc_msgSend(v25, "setObject:forKey:", v12, *MEMORY[0x24BDF5B30]);
          v22 = v25;
          items = v13->_items;
          v13->_items = v22;
        }
        else
        {
          v22 = 0;
LABEL_15:
          items = v13;
          v13 = 0;
        }
        break;
      default:
        if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        {
          WFLogForCategory(0);
          v15 = objc_claimAutoreleasedReturnValue();
          v21 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v21))
          {
            *(_WORD *)buf = 0;
            v17 = "Unknown WFIPv6ConfigMethod used";
            v18 = v15;
            v19 = v21;
            v20 = 2;
LABEL_12:
            _os_log_impl(&dword_219FC8000, v18, v19, v17, buf, v20);
          }
LABEL_13:

        }
        v22 = 0;
        v23 = 0;
        goto LABEL_15;
    }
  }
  else
  {
    v22 = 0;
    v23 = 0;
    items = 0;
  }

  v26 = v13;
  return v26;
}

+ (id)automaticConfig
{
  return -[WFSettingsIPV6 initWithMethod:addresses:prefixLengths:router:]([WFSettingsIPV6 alloc], "initWithMethod:addresses:prefixLengths:router:", 1, 0, 0, 0);
}

+ (id)linkLocalConfig
{
  return -[WFSettingsIPV6 initWithMethod:addresses:prefixLengths:router:]([WFSettingsIPV6 alloc], "initWithMethod:addresses:prefixLengths:router:", 2, 0, 0, 0);
}

- (id)protocol
{
  return (id)*MEMORY[0x24BDF59F8];
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

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@- "), v5);

  -[WFSettingsIPV6 items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDF5B10]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("ConfigMethod: %@ "), v7);

  objc_msgSend(v3, "appendString:", CFSTR("| Addresses: "));
  -[WFSettingsIPV6 addresses](self, "addresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFSettingsIPV6 addresses](self, "addresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v10);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("(None) "));
  }
  objc_msgSend(v3, "appendString:", CFSTR("| Router: "));
  -[WFSettingsIPV6 router](self, "router");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFSettingsIPV6 router](self, "router");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v12);

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

- (NSArray)prefixLengths
{
  return self->_prefixLengths;
}

- (void)setPrefixLengths:(id)a3
{
  objc_storeStrong((id *)&self->_prefixLengths, a3);
}

- (NSString)router
{
  return self->_router;
}

- (void)setRouter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_prefixLengths, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end
