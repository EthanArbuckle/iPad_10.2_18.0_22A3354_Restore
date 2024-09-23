@implementation AWDLServiceDiscoveryConfiguration

- (AWDLServiceDiscoveryConfiguration)initWithKey:(id)a3
{
  id v4;
  AWDLServiceDiscoveryConfiguration *v5;
  uint64_t v6;
  NSData *serviceKey;
  NSData *serviceValue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AWDLServiceDiscoveryConfiguration;
  v5 = -[AWDLServiceDiscoveryConfiguration init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceKey = v5->_serviceKey;
    v5->_serviceKey = (NSData *)v6;

    serviceValue = v5->_serviceValue;
    v5->_serviceValue = 0;

    v5->_isResolve = 0;
  }

  return v5;
}

- (AWDLServiceDiscoveryConfiguration)initWithKey:(id)a3 value:(id)a4 resolve:(BOOL)a5
{
  id v8;
  id v9;
  AWDLServiceDiscoveryConfiguration *v10;
  uint64_t v11;
  NSData *serviceKey;
  uint64_t v13;
  NSData *serviceValue;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AWDLServiceDiscoveryConfiguration;
  v10 = -[AWDLServiceDiscoveryConfiguration init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    serviceKey = v10->_serviceKey;
    v10->_serviceKey = (NSData *)v11;

    v13 = objc_msgSend(v9, "copy");
    serviceValue = v10->_serviceValue;
    v10->_serviceValue = (NSData *)v13;

    v10->_isResolve = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AWDLServiceDiscoveryConfiguration serviceKey](self, "serviceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AWDLServiceDiscoveryConfiguration.serviceKey"));

  -[AWDLServiceDiscoveryConfiguration serviceValue](self, "serviceValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("AWDLServiceDiscoveryConfiguration.serviceValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AWDLServiceDiscoveryConfiguration isResolve](self, "isResolve"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("AWDLServiceDiscoveryConfiguration.resolve"));

}

- (AWDLServiceDiscoveryConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  AWDLServiceDiscoveryConfiguration *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLServiceDiscoveryConfiguration.serviceKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLServiceDiscoveryConfiguration.serviceValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLServiceDiscoveryConfiguration.resolve"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "BOOLValue");
  v9 = -[AWDLServiceDiscoveryConfiguration initWithKey:value:resolve:](self, "initWithKey:value:resolve:", v5, v6, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  AWDLServiceDiscoveryConfiguration *v6;
  AWDLServiceDiscoveryConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  BOOL v14;

  v6 = (AWDLServiceDiscoveryConfiguration *)a3;
  if (self != v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
      v7 = 0;
      goto LABEL_15;
    }
    v7 = v6;
    -[AWDLServiceDiscoveryConfiguration serviceKey](self, "serviceKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWDLServiceDiscoveryConfiguration serviceKey](v7, "serviceKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToData:", v9) & 1) == 0)
    {

LABEL_14:
      v13 = 0;
      goto LABEL_15;
    }
    -[AWDLServiceDiscoveryConfiguration serviceValue](self, "serviceValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWDLServiceDiscoveryConfiguration serviceValue](v7, "serviceValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11
      || (-[AWDLServiceDiscoveryConfiguration serviceValue](self, "serviceValue"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[AWDLServiceDiscoveryConfiguration serviceValue](v7, "serviceValue"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v14 = -[AWDLServiceDiscoveryConfiguration isResolve](self, "isResolve");
      v12 = v14 ^ -[AWDLServiceDiscoveryConfiguration isResolve](v7, "isResolve");
      if (v10 == v11)
        goto LABEL_13;
    }
    else
    {
      v12 = 1;
    }

LABEL_13:
    if ((v12 & 1) != 0)
      goto LABEL_14;
    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:
  v13 = 1;
LABEL_15:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AWDLServiceDiscoveryConfiguration *v4;
  void *v5;
  void *v6;
  AWDLServiceDiscoveryConfiguration *v7;

  v4 = [AWDLServiceDiscoveryConfiguration alloc];
  -[AWDLServiceDiscoveryConfiguration serviceKey](self, "serviceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDLServiceDiscoveryConfiguration serviceValue](self, "serviceValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AWDLServiceDiscoveryConfiguration initWithKey:value:resolve:](v4, "initWithKey:value:resolve:", v5, v6, -[AWDLServiceDiscoveryConfiguration isResolve](self, "isResolve"));

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AWDLServiceDiscoveryConfiguration serviceValue](self, "serviceValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[AWDLServiceDiscoveryConfiguration isResolve](self, "isResolve");
    v6 = "Advertise";
    if (v5)
      v6 = "Resolve";
  }
  else
  {
    v6 = "Browse";
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AWDLServiceDiscoveryConfiguration %s>"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSData)serviceKey
{
  return self->_serviceKey;
}

- (NSData)serviceValue
{
  return self->_serviceValue;
}

- (BOOL)isResolve
{
  return self->_isResolve;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceValue, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
}

@end
