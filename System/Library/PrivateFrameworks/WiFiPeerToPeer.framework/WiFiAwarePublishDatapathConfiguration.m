@implementation WiFiAwarePublishDatapathConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwarePublishDatapathConfiguration serviceType](self, "serviceType"), CFSTR("WiFiAwarePublishDatapathConfiguration.serviceType"));
  -[WiFiAwarePublishDatapathConfiguration securityConfiguration](self, "securityConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WiFiAwarePublishDatapathConfiguration.securityConfiguration"));

  -[WiFiAwarePublishDatapathConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WiFiAwarePublishDatapathConfiguration.serviceSpecificInfo"));

}

- (WiFiAwarePublishDatapathConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  WiFiAwarePublishDatapathConfiguration *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WiFiAwarePublishDatapathConfiguration.serviceType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishDatapathConfiguration.securityConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WiFiAwarePublishDatapathConfiguration initWithServiceType:securityConfiguration:](self, "initWithServiceType:securityConfiguration:", v5, v6);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishDatapathConfiguration.serviceSpecificInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiAwarePublishDatapathConfiguration setServiceSpecificInfo:](v7, "setServiceSpecificInfo:", v8);
  return v7;
}

- (WiFiAwarePublishDatapathConfiguration)initWithServiceType:(int64_t)a3 securityConfiguration:(id)a4
{
  id v7;
  WiFiAwarePublishDatapathConfiguration *v8;
  WiFiAwarePublishDatapathConfiguration *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WiFiAwarePublishDatapathConfiguration;
  v8 = -[WiFiAwarePublishDatapathConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_serviceType = a3;
    objc_storeStrong((id *)&v8->_securityConfiguration, a4);
  }

  return v9;
}

- (BOOL)securityConfigurationEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwarePublishDatapathConfiguration securityConfiguration](self, "securityConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "securityConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishDatapathConfiguration securityConfiguration](self, "securityConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "securityConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
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
  -[WiFiAwarePublishDatapathConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceSpecificInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishDatapathConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSpecificInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwarePublishDatapathConfiguration *v4;
  WiFiAwarePublishDatapathConfiguration *v5;
  int64_t v6;
  BOOL v7;

  v4 = (WiFiAwarePublishDatapathConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_8:
    v7 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    v5 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  v6 = -[WiFiAwarePublishDatapathConfiguration serviceType](self, "serviceType");
  if (v6 == -[WiFiAwarePublishDatapathConfiguration serviceType](v5, "serviceType")
    && -[WiFiAwarePublishDatapathConfiguration securityConfigurationEqual:](self, "securityConfigurationEqual:", v5)
    && -[WiFiAwarePublishDatapathConfiguration serviceSpecificInfoEqual:](self, "serviceSpecificInfoEqual:", v5))
  {
    goto LABEL_8;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

- (id)description
{
  int64_t v3;
  const char *v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[WiFiAwarePublishDatapathConfiguration serviceType](self, "serviceType");
  v4 = "unrecognized";
  if (v3 == 1)
    v4 = "realtime";
  if (v3)
    v5 = v4;
  else
    v5 = "adaptive";
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwarePublishDatapathConfiguration securityConfiguration](self, "securityConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishDatapathConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<WiFiAwarePublishDatapathConfiguration: serviceType=%s, securityConfig=%@, serviceSpecificInfo=%@>"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiAwarePublishDatapathConfiguration *v4;
  int64_t v5;
  void *v6;
  WiFiAwarePublishDatapathConfiguration *v7;
  void *v8;

  v4 = [WiFiAwarePublishDatapathConfiguration alloc];
  v5 = -[WiFiAwarePublishDatapathConfiguration serviceType](self, "serviceType");
  -[WiFiAwarePublishDatapathConfiguration securityConfiguration](self, "securityConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WiFiAwarePublishDatapathConfiguration initWithServiceType:securityConfiguration:](v4, "initWithServiceType:securityConfiguration:", v5, v6);

  -[WiFiAwarePublishDatapathConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishDatapathConfiguration setServiceSpecificInfo:](v7, "setServiceSpecificInfo:", v8);

  return v7;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (WiFiAwarePublishDatapathSecurityConfiguration)securityConfiguration
{
  return self->_securityConfiguration;
}

- (WiFiAwarePublishDatapathServiceSpecificInfo)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (void)setServiceSpecificInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_securityConfiguration, 0);
}

@end
