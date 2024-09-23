@implementation WiFiAwareInternetSharingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwareInternetSharingConfiguration)initWithInterfaceName:(id)a3 isProvider:(BOOL)a4 isAutomatic:(BOOL)a5
{
  id v8;
  WiFiAwareInternetSharingConfiguration *v9;
  uint64_t v10;
  NSString *interfaceName;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WiFiAwareInternetSharingConfiguration;
  v9 = -[WiFiAwareInternetSharingConfiguration init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    interfaceName = v9->_interfaceName;
    v9->_interfaceName = (NSString *)v10;

    v9->_provider = a4;
    v9->_automatic = a5;
    v9->_useBridging = 0;
  }

  return v9;
}

- (WiFiAwareInternetSharingConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  WiFiAwareInternetSharingConfiguration *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareInternetSharingConfiguration.interfaceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiAwareInternetSharingConfiguration.provider"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiAwareInternetSharingConfiguration.automatic"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiAwareInternetSharingConfiguration.useBridging"));

  v9 = -[WiFiAwareInternetSharingConfiguration initWithInterfaceName:isProvider:isAutomatic:](self, "initWithInterfaceName:isProvider:isAutomatic:", v5, v6, v7);
  v9->_useBridging = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WiFiAwareInternetSharingConfiguration interfaceName](self, "interfaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("WiFiAwareInternetSharingConfiguration.interfaceName"));

  objc_msgSend(v5, "encodeBool:forKey:", -[WiFiAwareInternetSharingConfiguration provider](self, "provider"), CFSTR("WiFiAwareInternetSharingConfiguration.provider"));
  objc_msgSend(v5, "encodeBool:forKey:", -[WiFiAwareInternetSharingConfiguration automatic](self, "automatic"), CFSTR("WiFiAwareInternetSharingConfiguration.automatic"));
  objc_msgSend(v5, "encodeBool:forKey:", -[WiFiAwareInternetSharingConfiguration useBridging](self, "useBridging"), CFSTR("WiFiAwareInternetSharingConfiguration.useBridging"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiAwareInternetSharingConfiguration *v4;
  void *v5;
  WiFiAwareInternetSharingConfiguration *v6;

  v4 = [WiFiAwareInternetSharingConfiguration alloc];
  -[WiFiAwareInternetSharingConfiguration interfaceName](self, "interfaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WiFiAwareInternetSharingConfiguration initWithInterfaceName:isProvider:isAutomatic:](v4, "initWithInterfaceName:isProvider:isAutomatic:", v5, -[WiFiAwareInternetSharingConfiguration provider](self, "provider"), -[WiFiAwareInternetSharingConfiguration automatic](self, "automatic"));

  -[WiFiAwareInternetSharingConfiguration setUseBridging:](v6, "setUseBridging:", -[WiFiAwareInternetSharingConfiguration useBridging](self, "useBridging"));
  return v6;
}

+ (id)provideInternetToInitiatorsFromInterface:(id)a3
{
  id v3;
  WiFiAwareInternetSharingConfiguration *v4;

  v3 = a3;
  v4 = -[WiFiAwareInternetSharingConfiguration initWithInterfaceName:isProvider:isAutomatic:]([WiFiAwareInternetSharingConfiguration alloc], "initWithInterfaceName:isProvider:isAutomatic:", v3, 1, 0);

  return v4;
}

+ (id)automaticallyProvideInternetToResponders
{
  return -[WiFiAwareInternetSharingConfiguration initWithInterfaceName:isProvider:isAutomatic:]([WiFiAwareInternetSharingConfiguration alloc], "initWithInterfaceName:isProvider:isAutomatic:", 0, 1, 1);
}

+ (id)requestInterentFromResponder
{
  return -[WiFiAwareInternetSharingConfiguration initWithInterfaceName:isProvider:isAutomatic:]([WiFiAwareInternetSharingConfiguration alloc], "initWithInterfaceName:isProvider:isAutomatic:", 0, 0, 0);
}

+ (id)automaticallyRequestInternetFromInitiators
{
  return -[WiFiAwareInternetSharingConfiguration initWithInterfaceName:isProvider:isAutomatic:]([WiFiAwareInternetSharingConfiguration alloc], "initWithInterfaceName:isProvider:isAutomatic:", 0, 0, 1);
}

- (BOOL)interfaceNameEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwareInternetSharingConfiguration interfaceName](self, "interfaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interfaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareInternetSharingConfiguration interfaceName](self, "interfaceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interfaceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwareInternetSharingConfiguration *v4;
  WiFiAwareInternetSharingConfiguration *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;

  v4 = (WiFiAwareInternetSharingConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_9:
    v9 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    v5 = 0;
    goto LABEL_11;
  }
  v5 = v4;
  if (-[WiFiAwareInternetSharingConfiguration interfaceNameEqual:](self, "interfaceNameEqual:", v5))
  {
    v6 = -[WiFiAwareInternetSharingConfiguration provider](self, "provider");
    if (v6 == -[WiFiAwareInternetSharingConfiguration provider](v5, "provider"))
    {
      v7 = -[WiFiAwareInternetSharingConfiguration automatic](self, "automatic");
      if (v7 == -[WiFiAwareInternetSharingConfiguration automatic](v5, "automatic"))
      {
        v8 = -[WiFiAwareInternetSharingConfiguration useBridging](self, "useBridging");
        if (v8 == -[WiFiAwareInternetSharingConfiguration useBridging](v5, "useBridging"))
          goto LABEL_9;
      }
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const char *v8;
  __CFString *v9;
  void *v10;
  _BOOL4 v11;
  const char *v12;
  void *v13;

  -[WiFiAwareInternetSharingConfiguration interfaceName](self, "interfaceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = "";
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[WiFiAwareInternetSharingConfiguration interfaceName](self, "interfaceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WiFiAwareInternetSharingConfiguration useBridging](self, "useBridging");
    v8 = " (bridged)";
    if (!v7)
      v8 = "";
    objc_msgSend(v5, "stringWithFormat:", CFSTR(" on interface=%@%s"), v6, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E6E1F318;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  if (-[WiFiAwareInternetSharingConfiguration automatic](self, "automatic"))
    v4 = "automatic ";
  v11 = -[WiFiAwareInternetSharingConfiguration provider](self, "provider");
  v12 = "requester";
  if (v11)
    v12 = "provider";
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%s%s%@>"), v4, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceName, a3);
}

- (BOOL)provider
{
  return self->_provider;
}

- (void)setProvider:(BOOL)a3
{
  self->_provider = a3;
}

- (BOOL)automatic
{
  return self->_automatic;
}

- (void)setAutomatic:(BOOL)a3
{
  self->_automatic = a3;
}

- (BOOL)useBridging
{
  return self->_useBridging;
}

- (void)setUseBridging:(BOOL)a3
{
  self->_useBridging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
