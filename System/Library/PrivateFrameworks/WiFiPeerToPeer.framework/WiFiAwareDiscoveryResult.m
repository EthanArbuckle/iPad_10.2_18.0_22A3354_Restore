@implementation WiFiAwareDiscoveryResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WiFiAwareDiscoveryResult serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("WiFiAwareDiscoveryResult.serviceName"));

  -[WiFiAwareDiscoveryResult serviceSpecificInfo](self, "serviceSpecificInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("WiFiAwareDiscoveryResult.serviceSpecificInfo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[WiFiAwareDiscoveryResult publishID](self, "publishID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("WiFiAwareDiscoveryResult.publishID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[WiFiAwareDiscoveryResult subscribeID](self, "subscribeID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("WiFiAwareDiscoveryResult.subscribeID"));

  -[WiFiAwareDiscoveryResult publisherAddress](self, "publisherAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("WiFiAwareDiscoveryResult.publisherAddress"));

  objc_msgSend(v9, "encodeBool:forKey:", -[WiFiAwareDiscoveryResult datapathSupported](self, "datapathSupported"), CFSTR("WiFiAwareDiscoveryResult.datapathSupported"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[WiFiAwareDiscoveryResult datapathCipherSuite](self, "datapathCipherSuite"), CFSTR("WiFiAwareDiscoveryResult.datapathCipherSuite"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[WiFiAwareDiscoveryResult fsdFunction](self, "fsdFunction"), CFSTR("WiFiAwareDiscoveryResult.fsdFunction"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[WiFiAwareDiscoveryResult rssi](self, "rssi"), CFSTR("WiFiAwareDiscoveryResult.rssi"));

}

- (WiFiAwareDiscoveryResult)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WiFiAwareDiscoveryResult *v13;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDiscoveryResult.serviceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDiscoveryResult.serviceSpecificInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = decodeInstanceIDFrom(v3, CFSTR("WiFiAwareDiscoveryResult.publishID"));
  v7 = decodeInstanceIDFrom(v3, CFSTR("WiFiAwareDiscoveryResult.subscribeID"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDiscoveryResult.publisherAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("WiFiAwareDiscoveryResult.datapathSupported"));
  v10 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("WiFiAwareDiscoveryResult.datapathCipherSuite"));
  v11 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("WiFiAwareDiscoveryResult.fsdFunction"));
  v12 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("WiFiAwareDiscoveryResult.rssi"));

  v13 = -[WiFiAwareDiscoveryResult initWithServiceName:serviceSpecificInfo:publishID:subscribeID:publisherAddressKey:datapathSupported:datapathCipherSuite:fsdFunction:rssi:](self, "initWithServiceName:serviceSpecificInfo:publishID:subscribeID:publisherAddressKey:datapathSupported:datapathCipherSuite:fsdFunction:rssi:", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (WiFiAwareDiscoveryResult)initWithServiceName:(id)a3 serviceSpecificInfo:(id)a4 publishID:(unsigned __int8)a5 subscribeID:(unsigned __int8)a6 publisherAddressKey:(id)a7 datapathSupported:(BOOL)a8 datapathCipherSuite:(int64_t)a9 fsdFunction:(int64_t)a10 rssi:(int64_t)a11
{
  id v17;
  id v18;
  id v19;
  WiFiAwareDiscoveryResult *v20;
  uint64_t v21;
  NSString *serviceName;
  uint64_t v23;
  WiFiAwarePublishServiceSpecificInfo *serviceSpecificInfo;
  objc_super v26;

  v17 = a3;
  v18 = a4;
  v19 = a7;
  v26.receiver = self;
  v26.super_class = (Class)WiFiAwareDiscoveryResult;
  v20 = -[WiFiAwareDiscoveryResult init](&v26, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v17, "copy");
    serviceName = v20->_serviceName;
    v20->_serviceName = (NSString *)v21;

    v23 = objc_msgSend(v18, "copy");
    serviceSpecificInfo = v20->_serviceSpecificInfo;
    v20->_serviceSpecificInfo = (WiFiAwarePublishServiceSpecificInfo *)v23;

    v20->_publishID = a5;
    objc_storeStrong((id *)&v20->_publisherAddress, a7);
    v20->_subscribeID = a6;
    v20->_datapathSupported = a8;
    v20->_datapathCipherSuite = a9;
    v20->_fsdFunction = a10;
    v20->_rssi = a11;
  }

  return v20;
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
  -[WiFiAwareDiscoveryResult serviceSpecificInfo](self, "serviceSpecificInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceSpecificInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareDiscoveryResult serviceSpecificInfo](self, "serviceSpecificInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSpecificInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (unsigned)subscribeID
{
  return self->_subscribeID;
}

- (int64_t)datapathCipherSuite
{
  return self->_datapathCipherSuite;
}

- (BOOL)datapathSecurityRequired
{
  return -[WiFiAwareDiscoveryResult datapathCipherSuite](self, "datapathCipherSuite") != 0;
}

- (int64_t)fsdFunction
{
  return self->_fsdFunction;
}

- (BOOL)furtherServiceDiscoveryRequired
{
  int64_t v3;

  v3 = -[WiFiAwareDiscoveryResult fsdFunction](self, "fsdFunction");
  if (v3 != 1)
    LOBYTE(v3) = -[WiFiAwareDiscoveryResult fsdFunction](self, "fsdFunction") == 2;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwareDiscoveryResult *v4;
  WiFiAwareDiscoveryResult *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;

  v4 = (WiFiAwareDiscoveryResult *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = 0;
      v5 = 0;
      goto LABEL_19;
    }
    v5 = v4;
    -[WiFiAwareDiscoveryResult serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwareDiscoveryResult serviceName](v5, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      if (-[WiFiAwareDiscoveryResult serviceSpecificInfoEqual:](self, "serviceSpecificInfoEqual:", v5))
      {
        v8 = -[WiFiAwareDiscoveryResult publishID](self, "publishID");
        if (v8 == -[WiFiAwareDiscoveryResult publishID](v5, "publishID"))
        {
          v9 = -[WiFiAwareDiscoveryResult subscribeID](self, "subscribeID");
          if (v9 == -[WiFiAwareDiscoveryResult subscribeID](v5, "subscribeID"))
          {
            -[WiFiAwareDiscoveryResult publisherAddress](self, "publisherAddress");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[WiFiAwareDiscoveryResult publisherAddress](v5, "publisherAddress");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "isEqual:", v11))
            {
              v12 = -[WiFiAwareDiscoveryResult datapathSupported](self, "datapathSupported");
              if (v12 == -[WiFiAwareDiscoveryResult datapathSupported](v5, "datapathSupported"))
              {
                v13 = -[WiFiAwareDiscoveryResult datapathSecurityRequired](self, "datapathSecurityRequired");
                if (v13 == -[WiFiAwareDiscoveryResult datapathSecurityRequired](v5, "datapathSecurityRequired"))
                {
                  v14 = -[WiFiAwareDiscoveryResult fsdFunction](self, "fsdFunction");
                  if (v14 == -[WiFiAwareDiscoveryResult fsdFunction](v5, "fsdFunction"))
                  {
                    v15 = -[WiFiAwareDiscoveryResult rssi](self, "rssi");
                    v16 = -[WiFiAwareDiscoveryResult rssi](v5, "rssi");

                    if (v15 != v16)
                      goto LABEL_18;
                    goto LABEL_14;
                  }
                }
              }
            }

          }
        }
      }
    }

LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  v5 = 0;
LABEL_14:
  v17 = 1;
LABEL_19:

  return v17;
}

- (const)fsdFunctionString
{
  unint64_t v2;

  v2 = -[WiFiAwareDiscoveryResult fsdFunction](self, "fsdFunction");
  if (v2 > 2)
    return "unrecognized";
  else
    return off_1E6E1E420[v2];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  unint64_t v10;
  const char *v11;
  const char *v12;
  const char *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwareDiscoveryResult serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDiscoveryResult serviceSpecificInfo](self, "serviceSpecificInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WiFiAwareDiscoveryResult publishID](self, "publishID");
  -[WiFiAwareDiscoveryResult publisherAddress](self, "publisherAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WiFiAwareDiscoveryResult datapathSupported](self, "datapathSupported");
  v9 = -[WiFiAwareDiscoveryResult datapathSecurityRequired](self, "datapathSecurityRequired");
  v10 = -[WiFiAwareDiscoveryResult datapathCipherSuite](self, "datapathCipherSuite");
  if (v10 > 2)
    v11 = "unrecognized";
  else
    v11 = off_1E6E1E438[v10];
  if (v9)
    v12 = "YES";
  else
    v12 = "NO";
  if (v8)
    v13 = "YES";
  else
    v13 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WiFiAwareDiscoveryResult: name=%@, serviceSpecificInfo=%@, publishID=%u, publisherAddress=%@, datapath=%s, security=%s, cipherSuite=%s, FSD=%s, rssi=%ld>"), v4, v5, v6, v7, v13, v12, v11, -[WiFiAwareDiscoveryResult fsdFunctionString](self, "fsdFunctionString"), -[WiFiAwareDiscoveryResult rssi](self, "rssi"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (WiFiAwarePublishServiceSpecificInfo)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (unsigned)publishID
{
  return self->_publishID;
}

- (WiFiMACAddress)publisherAddress
{
  return self->_publisherAddress;
}

- (BOOL)datapathSupported
{
  return self->_datapathSupported;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherAddress, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
