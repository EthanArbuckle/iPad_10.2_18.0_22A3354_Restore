@implementation WiFiAwareSubscribeConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WiFiAwareSubscribeConfiguration serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WiFiAwareSubscribeConfiguration.serviceName"));

  -[WiFiAwareSubscribeConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WiFiAwareSubscribeConfiguration.serviceSpecificInfo"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwareSubscribeConfiguration authenticationType](self, "authenticationType"), CFSTR("WiFiAwareSubscribeConfiguration.authenticationType"));
  -[WiFiAwareSubscribeConfiguration fastDiscoveryConfiguration](self, "fastDiscoveryConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WiFiAwareSubscribeConfiguration.fastDiscoveryConfiguration"));

  -[WiFiAwareSubscribeConfiguration multicastAddress](self, "multicastAddress");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("WiFiAwareSubscribeConfiguration.multicastAddress"));

}

- (WiFiAwareSubscribeConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WiFiAwareSubscribeConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareSubscribeConfiguration.serviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WiFiAwareSubscribeConfiguration initWithServiceName:](self, "initWithServiceName:", v5);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareSubscribeConfiguration.serviceSpecificInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareSubscribeConfiguration setServiceSpecificInfo:](v6, "setServiceSpecificInfo:", v7);

  -[WiFiAwareSubscribeConfiguration setAuthenticationType:](v6, "setAuthenticationType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WiFiAwareSubscribeConfiguration.authenticationType")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareSubscribeConfiguration.fastDiscoveryConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareSubscribeConfiguration setFastDiscoveryConfiguration:](v6, "setFastDiscoveryConfiguration:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareSubscribeConfiguration.multicastAddress"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiAwareSubscribeConfiguration setMulticastAddress:](v6, "setMulticastAddress:", v9);
  return v6;
}

- (WiFiAwareSubscribeConfiguration)initWithServiceName:(id)a3 serviceSpecificInfo:(id)a4
{
  id v6;
  WiFiAwareSubscribeConfiguration *v7;

  v6 = a4;
  v7 = -[WiFiAwareSubscribeConfiguration initWithServiceName:](self, "initWithServiceName:", a3);
  -[WiFiAwareSubscribeConfiguration setServiceSpecificInfo:](v7, "setServiceSpecificInfo:", v6);

  return v7;
}

- (WiFiAwareSubscribeConfiguration)initWithServiceName:(id)a3
{
  id v4;
  WiFiAwareSubscribeConfiguration *v5;
  uint64_t v6;
  NSString *serviceName;
  NSData *serviceSpecificInfo;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WiFiAwareSubscribeConfiguration;
  v5 = -[WiFiAwareSubscribeConfiguration init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    serviceSpecificInfo = v5->_serviceSpecificInfo;
    v5->_serviceSpecificInfo = 0;

    v5->_authenticationType = 1;
  }

  return v5;
}

- (BOOL)serviceSpecificInfoEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwareSubscribeConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceSpecificInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareSubscribeConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSpecificInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)fastDiscoveryConfigEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwareSubscribeConfiguration fastDiscoveryConfiguration](self, "fastDiscoveryConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fastDiscoveryConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareSubscribeConfiguration fastDiscoveryConfiguration](self, "fastDiscoveryConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fastDiscoveryConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)multicastAddressConfigurationEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwareSubscribeConfiguration multicastAddress](self, "multicastAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multicastAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareSubscribeConfiguration multicastAddress](self, "multicastAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multicastAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwareSubscribeConfiguration *v4;
  WiFiAwareSubscribeConfiguration *v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;
  BOOL v10;

  v4 = (WiFiAwareSubscribeConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      v5 = 0;
      goto LABEL_14;
    }
    v5 = v4;
    -[WiFiAwareSubscribeConfiguration serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwareSubscribeConfiguration serviceName](v5, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", v7)
      || !-[WiFiAwareSubscribeConfiguration serviceSpecificInfoEqual:](self, "serviceSpecificInfoEqual:", v5)
      || (v8 = -[WiFiAwareSubscribeConfiguration authenticationType](self, "authenticationType"),
          v8 != -[WiFiAwareSubscribeConfiguration authenticationType](v5, "authenticationType"))
      || !-[WiFiAwareSubscribeConfiguration fastDiscoveryConfigEqual:](self, "fastDiscoveryConfigEqual:", v5))
    {

LABEL_13:
      v10 = 0;
      goto LABEL_14;
    }
    v9 = -[WiFiAwareSubscribeConfiguration multicastAddressConfigurationEqual:](self, "multicastAddressConfigurationEqual:", v5);

    if (!v9)
      goto LABEL_13;
  }
  v10 = 1;
LABEL_14:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwareSubscribeConfiguration serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareSubscribeConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareSubscribeConfiguration fastDiscoveryConfiguration](self, "fastDiscoveryConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WiFiAwareSubscribeConfiguration: name=%@, serviceSpecificInfo=%@, fastDiscoveryConfiguration=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiAwareSubscribeConfiguration *v4;
  void *v5;
  WiFiAwareSubscribeConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = [WiFiAwareSubscribeConfiguration alloc];
  -[WiFiAwareSubscribeConfiguration serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WiFiAwareSubscribeConfiguration initWithServiceName:](v4, "initWithServiceName:", v5);

  -[WiFiAwareSubscribeConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareSubscribeConfiguration setServiceSpecificInfo:](v6, "setServiceSpecificInfo:", v7);

  -[WiFiAwareSubscribeConfiguration setAuthenticationType:](v6, "setAuthenticationType:", -[WiFiAwareSubscribeConfiguration authenticationType](self, "authenticationType"));
  -[WiFiAwareSubscribeConfiguration fastDiscoveryConfiguration](self, "fastDiscoveryConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareSubscribeConfiguration setFastDiscoveryConfiguration:](v6, "setFastDiscoveryConfiguration:", v8);

  -[WiFiAwareSubscribeConfiguration multicastAddress](self, "multicastAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareSubscribeConfiguration setMulticastAddress:](v6, "setMulticastAddress:", v9);

  return v6;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSData)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (void)setServiceSpecificInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (WiFiMACAddress)multicastAddress
{
  return self->_multicastAddress;
}

- (void)setMulticastAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(int64_t)a3
{
  self->_authenticationType = a3;
}

- (WiFiAwareFastDiscoveryConfiguration)fastDiscoveryConfiguration
{
  return self->_fastDiscoveryConfiguration;
}

- (void)setFastDiscoveryConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastDiscoveryConfiguration, 0);
  objc_storeStrong((id *)&self->_multicastAddress, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
