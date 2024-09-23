@implementation WiFiAwarePublishConfiguration

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
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WiFiAwarePublishConfiguration serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WiFiAwarePublishConfiguration.serviceName"));

  -[WiFiAwarePublishConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WiFiAwarePublishConfiguration.serviceSpecificInfo"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiAwarePublishConfiguration furtherServiceDiscoveryRequired](self, "furtherServiceDiscoveryRequired"), CFSTR("WiFiAwarePublishConfiguration.furtherServiceDiscoveryRequired"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiAwarePublishConfiguration jumboServiceDiscoveryMessages](self, "jumboServiceDiscoveryMessages"), CFSTR("WiFiAwarePublishConfiguration.jumboServiceDiscoveryMessages"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwarePublishConfiguration authenticationType](self, "authenticationType"), CFSTR("WiFiAwarePublishConfiguration.authenticationType"));
  -[WiFiAwarePublishConfiguration datapathConfiguration](self, "datapathConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WiFiAwarePublishConfiguration.datapathConfiguration"));

  -[WiFiAwarePublishConfiguration fastDiscoveryConfiguration](self, "fastDiscoveryConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("WiFiAwarePublishConfiguration.fastDiscoveryConfiguration"));

  -[WiFiAwarePublishConfiguration internetSharingConfiguration](self, "internetSharingConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WiFiAwarePublishConfiguration.internetSharingConfiguration"));

  -[WiFiAwarePublishConfiguration multicastAddress](self, "multicastAddress");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("WiFiAwarePublishConfiguration.multicastAddress"));

}

- (WiFiAwarePublishConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WiFiAwarePublishConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishConfiguration.serviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WiFiAwarePublishConfiguration initWithServiceName:](self, "initWithServiceName:", v5);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishConfiguration.serviceSpecificInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishConfiguration setServiceSpecificInfo:](v6, "setServiceSpecificInfo:", v7);

  -[WiFiAwarePublishConfiguration setFurtherServiceDiscoveryRequired:](v6, "setFurtherServiceDiscoveryRequired:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiAwarePublishConfiguration.furtherServiceDiscoveryRequired")));
  -[WiFiAwarePublishConfiguration setJumboServiceDiscoveryMessages:](v6, "setJumboServiceDiscoveryMessages:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiAwarePublishConfiguration.jumboServiceDiscoveryMessages")));
  -[WiFiAwarePublishConfiguration setAuthenticationType:](v6, "setAuthenticationType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WiFiAwarePublishConfiguration.authenticationType")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishConfiguration.datapathConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishConfiguration setDatapathConfiguration:](v6, "setDatapathConfiguration:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishConfiguration.fastDiscoveryConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishConfiguration setFastDiscoveryConfiguration:](v6, "setFastDiscoveryConfiguration:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishConfiguration.internetSharingConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishConfiguration setInternetSharingConfiguration:](v6, "setInternetSharingConfiguration:", v10);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishConfiguration.multicastAddress"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiAwarePublishConfiguration setMulticastAddress:](v6, "setMulticastAddress:", v11);
  return v6;
}

- (WiFiAwarePublishConfiguration)initWithServiceName:(id)a3
{
  id v4;
  WiFiAwarePublishConfiguration *v5;
  uint64_t v6;
  NSString *serviceName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WiFiAwarePublishConfiguration;
  v5 = -[WiFiAwarePublishConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

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
  -[WiFiAwarePublishConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceSpecificInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSpecificInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)datapathConfigurationEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwarePublishConfiguration datapathConfiguration](self, "datapathConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datapathConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishConfiguration datapathConfiguration](self, "datapathConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "datapathConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)fastDiscoveryConfigurationEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwarePublishConfiguration fastDiscoveryConfiguration](self, "fastDiscoveryConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fastDiscoveryConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishConfiguration fastDiscoveryConfiguration](self, "fastDiscoveryConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fastDiscoveryConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)internetSharingConfigurationEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwarePublishConfiguration internetSharingConfiguration](self, "internetSharingConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internetSharingConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishConfiguration internetSharingConfiguration](self, "internetSharingConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internetSharingConfiguration");
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
  -[WiFiAwarePublishConfiguration multicastAddress](self, "multicastAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multicastAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishConfiguration multicastAddress](self, "multicastAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multicastAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwarePublishConfiguration *v4;
  WiFiAwarePublishConfiguration *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int64_t v10;
  BOOL v11;
  BOOL v12;

  v4 = (WiFiAwarePublishConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      v5 = 0;
      goto LABEL_18;
    }
    v5 = v4;
    -[WiFiAwarePublishConfiguration serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwarePublishConfiguration serviceName](v5, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", v7)
      || !-[WiFiAwarePublishConfiguration serviceSpecificInfoEqual:](self, "serviceSpecificInfoEqual:", v5)
      || (v8 = -[WiFiAwarePublishConfiguration furtherServiceDiscoveryRequired](self, "furtherServiceDiscoveryRequired"),
          v8 != -[WiFiAwarePublishConfiguration furtherServiceDiscoveryRequired](v5, "furtherServiceDiscoveryRequired"))
      || (v9 = -[WiFiAwarePublishConfiguration jumboServiceDiscoveryMessages](self, "jumboServiceDiscoveryMessages"),
          v9 != -[WiFiAwarePublishConfiguration jumboServiceDiscoveryMessages](v5, "jumboServiceDiscoveryMessages"))
      || (v10 = -[WiFiAwarePublishConfiguration authenticationType](self, "authenticationType"),
          v10 != -[WiFiAwarePublishConfiguration authenticationType](v5, "authenticationType"))
      || !-[WiFiAwarePublishConfiguration datapathConfigurationEqual:](self, "datapathConfigurationEqual:", v5)
      || !-[WiFiAwarePublishConfiguration fastDiscoveryConfigurationEqual:](self, "fastDiscoveryConfigurationEqual:", v5)|| !-[WiFiAwarePublishConfiguration internetSharingConfigurationEqual:](self, "internetSharingConfigurationEqual:", v5))
    {

LABEL_17:
      v12 = 0;
      goto LABEL_18;
    }
    v11 = -[WiFiAwarePublishConfiguration multicastAddressConfigurationEqual:](self, "multicastAddressConfigurationEqual:", v5);

    if (!v11)
      goto LABEL_17;
  }
  v12 = 1;
LABEL_18:

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwarePublishConfiguration serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WiFiAwarePublishConfiguration furtherServiceDiscoveryRequired](self, "furtherServiceDiscoveryRequired"))
    v6 = "YES";
  else
    v6 = "NO";
  if (-[WiFiAwarePublishConfiguration jumboServiceDiscoveryMessages](self, "jumboServiceDiscoveryMessages"))
    v7 = "YES";
  else
    v7 = "NO";
  -[WiFiAwarePublishConfiguration datapathConfiguration](self, "datapathConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishConfiguration fastDiscoveryConfiguration](self, "fastDiscoveryConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishConfiguration internetSharingConfiguration](self, "internetSharingConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WiFiAwarePublishConfiguration: serviceName=%@, serviceSpecificInfo=%@, furtherServiceDiscoveryRequired=%s, jumboMessages=%s, dataConfig=%@, fastDiscovery=%@, internetSharing=%@>"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiAwarePublishConfiguration *v4;
  void *v5;
  WiFiAwarePublishConfiguration *v6;
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

  v4 = [WiFiAwarePublishConfiguration alloc];
  -[WiFiAwarePublishConfiguration serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WiFiAwarePublishConfiguration initWithServiceName:](v4, "initWithServiceName:", v5);

  -[WiFiAwarePublishConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[WiFiAwarePublishConfiguration setServiceSpecificInfo:](v6, "setServiceSpecificInfo:", v8);

  -[WiFiAwarePublishConfiguration setFurtherServiceDiscoveryRequired:](v6, "setFurtherServiceDiscoveryRequired:", -[WiFiAwarePublishConfiguration furtherServiceDiscoveryRequired](self, "furtherServiceDiscoveryRequired"));
  -[WiFiAwarePublishConfiguration setJumboServiceDiscoveryMessages:](v6, "setJumboServiceDiscoveryMessages:", -[WiFiAwarePublishConfiguration jumboServiceDiscoveryMessages](self, "jumboServiceDiscoveryMessages"));
  -[WiFiAwarePublishConfiguration datapathConfiguration](self, "datapathConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[WiFiAwarePublishConfiguration setDatapathConfiguration:](v6, "setDatapathConfiguration:", v10);

  -[WiFiAwarePublishConfiguration setAuthenticationType:](v6, "setAuthenticationType:", -[WiFiAwarePublishConfiguration authenticationType](self, "authenticationType"));
  -[WiFiAwarePublishConfiguration fastDiscoveryConfiguration](self, "fastDiscoveryConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[WiFiAwarePublishConfiguration setFastDiscoveryConfiguration:](v6, "setFastDiscoveryConfiguration:", v12);

  -[WiFiAwarePublishConfiguration internetSharingConfiguration](self, "internetSharingConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[WiFiAwarePublishConfiguration setInternetSharingConfiguration:](v6, "setInternetSharingConfiguration:", v14);

  -[WiFiAwarePublishConfiguration multicastAddress](self, "multicastAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[WiFiAwarePublishConfiguration setMulticastAddress:](v6, "setMulticastAddress:", v16);

  return v6;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (WiFiAwarePublishServiceSpecificInfo)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (void)setServiceSpecificInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)furtherServiceDiscoveryRequired
{
  return self->_furtherServiceDiscoveryRequired;
}

- (void)setFurtherServiceDiscoveryRequired:(BOOL)a3
{
  self->_furtherServiceDiscoveryRequired = a3;
}

- (BOOL)jumboServiceDiscoveryMessages
{
  return self->_jumboServiceDiscoveryMessages;
}

- (void)setJumboServiceDiscoveryMessages:(BOOL)a3
{
  self->_jumboServiceDiscoveryMessages = a3;
}

- (WiFiMACAddress)multicastAddress
{
  return self->_multicastAddress;
}

- (void)setMulticastAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(int64_t)a3
{
  self->_authenticationType = a3;
}

- (WiFiAwarePublishDatapathConfiguration)datapathConfiguration
{
  return self->_datapathConfiguration;
}

- (void)setDatapathConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (WiFiAwareFastDiscoveryConfiguration)fastDiscoveryConfiguration
{
  return self->_fastDiscoveryConfiguration;
}

- (void)setFastDiscoveryConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (WiFiAwareInternetSharingConfiguration)internetSharingConfiguration
{
  return self->_internetSharingConfiguration;
}

- (void)setInternetSharingConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internetSharingConfiguration, 0);
  objc_storeStrong((id *)&self->_fastDiscoveryConfiguration, 0);
  objc_storeStrong((id *)&self->_datapathConfiguration, 0);
  objc_storeStrong((id *)&self->_multicastAddress, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
