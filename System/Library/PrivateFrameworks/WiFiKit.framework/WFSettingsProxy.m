@implementation WFSettingsProxy

- (WFSettingsProxy)initWithManualServer:(id)a3 port:(id)a4 username:(id)a5 password:(id)a6
{
  id v11;
  id v12;
  id v13;
  WFSettingsProxy *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *items;
  NSDictionary *v21;
  id v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v23 = a6;
  v24.receiver = self;
  v24.super_class = (Class)WFSettingsProxy;
  v14 = -[WFSettingsProxy init](&v24, sel_init);
  if (!v14)
    goto LABEL_13;
  v15 = (void *)MEMORY[0x24BDBCED8];
  +[WFSettingsProxy defaultProxyConfiguration](WFSettingsProxy, "defaultProxyConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryWithDictionary:", v16);
  v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  v14->_customProxy = 1;
  objc_storeStrong((id *)&v14->_server, a3);
  if (v11)
  {
    -[NSDictionary setObject:forKey:](v17, "setObject:forKey:", v11, *MEMORY[0x24BDF5B90]);
    -[NSDictionary setObject:forKey:](v17, "setObject:forKey:", v11, *MEMORY[0x24BDF5BA8]);
  }
  objc_storeStrong((id *)&v14->_port, a4);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "integerValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKey:](v17, "setObject:forKey:", v18, *MEMORY[0x24BDF5B88]);
    -[NSDictionary setObject:forKey:](v17, "setObject:forKey:", v18, *MEMORY[0x24BDF5BA0]);

  }
  if (objc_msgSend(v13, "length"))
  {
    v14->_authenticated = 1;
LABEL_9:
    -[NSDictionary setObject:forKey:](v17, "setObject:forKey:", &unk_24DC5D6A8, CFSTR("HTTPProxyAuthenticated"));
    goto LABEL_10;
  }
  v19 = objc_msgSend(v23, "length");
  v14->_authenticated = v19 != 0;
  if (v19)
    goto LABEL_9;
LABEL_10:
  objc_storeStrong((id *)&v14->_username, a5);
  if (v13)
    -[NSDictionary setObject:forKey:](v17, "setObject:forKey:", v13, CFSTR("HTTPProxyUsername"));
  -[NSDictionary setObject:forKey:](v17, "setObject:forKey:", &unk_24DC5D6A8, *MEMORY[0x24BDF5B80]);
  -[NSDictionary setObject:forKey:](v17, "setObject:forKey:", &unk_24DC5D6A8, *MEMORY[0x24BDF5B98]);
  objc_storeStrong((id *)&v14->_password, a6);
  items = v14->_items;
  v14->_items = v17;
  v21 = v17;

LABEL_13:
  return v14;
}

- (WFSettingsProxy)initWithAutoConfigureURL:(id)a3
{
  id v5;
  WFSettingsProxy *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  _QWORD *v11;
  NSDictionary *items;
  NSDictionary *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFSettingsProxy;
  v6 = -[WFSettingsProxy init](&v15, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCED8];
    +[WFSettingsProxy defaultProxyConfiguration](WFSettingsProxy, "defaultProxyConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v8);
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    v6->_customProxy = 1;
    objc_storeStrong((id *)&v6->_autoConfigureURL, a3);
    if (v5)
      v10 = v5;
    else
      v10 = &unk_24DC5D6A8;
    v11 = (_QWORD *)MEMORY[0x24BDF5BC0];
    if (v5)
      v11 = (_QWORD *)MEMORY[0x24BDF5BB8];
    -[NSDictionary setObject:forKey:](v9, "setObject:forKey:", v10, *v11);
    -[NSDictionary setObject:forKey:](v9, "setObject:forKey:", &unk_24DC5D6A8, *MEMORY[0x24BDF5BB0]);
    items = v6->_items;
    v6->_items = v9;
    v13 = v9;

  }
  return v6;
}

+ (id)offConfig
{
  return -[WFSettingsProxy initDefaultConfig]([WFSettingsProxy alloc], "initDefaultConfig");
}

- (id)initDefaultConfig
{
  WFSettingsProxy *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;
  void *items;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSettingsProxy;
  v2 = -[WFSettingsProxy init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDBCED8];
    +[WFSettingsProxy defaultProxyConfiguration](WFSettingsProxy, "defaultProxyConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithDictionary:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v5 = v5;
      items = v2->_items;
      v2->_items = v5;
    }
    else
    {
      items = v2;
      v2 = 0;
    }
  }
  else
  {
    v5 = 0;
    items = 0;
  }

  return v2;
}

- (WFSettingsProxy)initWithDictionary:(id)a3
{
  id v5;
  NSDictionary **p_items;
  NSDictionary *items;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *server;
  void *v13;
  NSString *v14;
  NSString *port;
  NSString *v16;
  NSString *username;
  NSString *v18;
  NSString *autoConfigureURL;
  uint64_t v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v5 = a3;
  if (!v5)
  {
    v13 = 0;
    v26 = self;
    self = 0;
    goto LABEL_13;
  }
  p_items = &self->_items;
  objc_storeStrong((id *)&self->_items, a3);
  items = self->_items;
  +[WFSettingsProxy defaultProxyConfiguration](WFSettingsProxy, "defaultProxyConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(items) = -[NSDictionary isEqualToDictionary:](items, "isEqualToDictionary:", v8);

  self->_customProxy = items ^ 1;
  -[NSDictionary objectForKey:](self->_items, "objectForKey:", CFSTR("HTTPProxyAuthenticated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSDictionary objectForKey:](*p_items, "objectForKey:", CFSTR("HTTPProxyAuthenticated"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v10, "BOOLValue");

  }
  self->_authenticated = (char)v9;
  -[NSDictionary objectForKey:](self->_items, "objectForKey:", *MEMORY[0x24BDF5B90]);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  server = self->_server;
  self->_server = v11;

  -[NSDictionary objectForKey:](self->_items, "objectForKey:", *MEMORY[0x24BDF5B88]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "stringValue");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
    v14 = v13;
  }
  port = self->_port;
  self->_port = v14;

LABEL_9:
  -[NSDictionary objectForKey:](self->_items, "objectForKey:", CFSTR("HTTPProxyUsername"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  username = self->_username;
  self->_username = v16;

  -[NSDictionary objectForKey:](self->_items, "objectForKey:", *MEMORY[0x24BDF5BB8]);
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  autoConfigureURL = self->_autoConfigureURL;
  self->_autoConfigureURL = v18;

  v20 = *MEMORY[0x24BDF5BB0];
  -[NSDictionary objectForKey:](self->_items, "objectForKey:", *MEMORY[0x24BDF5BB0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[NSDictionary objectForKey:](self->_items, "objectForKey:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    self->_autoConfigured = objc_msgSend(v22, "BOOLValue");

  }
  v23 = *p_items;
  v24 = *MEMORY[0x24BDF5BC0];
  -[NSDictionary objectForKey:](v23, "objectForKey:", *MEMORY[0x24BDF5BC0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[NSDictionary objectForKey:](self->_items, "objectForKey:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    self->_autoDiscoveryEnabled = objc_msgSend(v26, "BOOLValue");
LABEL_13:

  }
  return self;
}

- (BOOL)isAutomatic
{
  return -[WFSettingsProxy autoConfigured](self, "autoConfigured")
      || -[WFSettingsProxy autoDiscoveryEnabled](self, "autoDiscoveryEnabled");
}

- (id)protocol
{
  return (id)*MEMORY[0x24BDF5A28];
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
  uint64_t v10;
  const __CFString *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@- "), v5);

  -[WFSettingsProxy server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Server: %@ "), v6);

  -[WFSettingsProxy port](self, "port");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Port: %@ "), v7);

  if (-[WFSettingsProxy authenticated](self, "authenticated"))
  {
    -[WFSettingsProxy username](self, "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" Username: %@ "), v8);

    -[WFSettingsProxy password](self, "password");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v11 = CFSTR("<not nil>");
    if (!v10)
      v11 = CFSTR("<nil>");
    objc_msgSend(v3, "appendFormat:", CFSTR(" Password: %@"), v11);
    goto LABEL_7;
  }
  -[WFSettingsProxy autoConfigureURL](self, "autoConfigureURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[WFSettingsProxy autoConfigureURL](self, "autoConfigureURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" AutoConfigureURL: %@"), v9);
LABEL_7:

  }
  return (NSString *)v3;
}

+ (id)defaultProxyConfiguration
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF5B70];
  v4[0] = *MEMORY[0x24BDF5B68];
  v4[1] = v2;
  v5[0] = &unk_24DC5DBE8;
  v5[1] = &unk_24DC5D6A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)autoConfigureURL
{
  return self->_autoConfigureURL;
}

- (void)setAutoConfigureURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)customProxy
{
  return self->_customProxy;
}

- (void)setCustomProxy:(BOOL)a3
{
  self->_customProxy = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)autoConfigured
{
  return self->_autoConfigured;
}

- (void)setAutoConfigured:(BOOL)a3
{
  self->_autoConfigured = a3;
}

- (BOOL)autoDiscoveryEnabled
{
  return self->_autoDiscoveryEnabled;
}

- (void)setAutoDiscoveryEnabled:(BOOL)a3
{
  self->_autoDiscoveryEnabled = a3;
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
  objc_storeStrong((id *)&self->_autoConfigureURL, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
