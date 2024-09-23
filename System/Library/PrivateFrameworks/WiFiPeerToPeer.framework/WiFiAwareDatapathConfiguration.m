@implementation WiFiAwareDatapathConfiguration

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
  -[WiFiAwareDatapathConfiguration discoveryResult](self, "discoveryResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WiFiAwareDataRequest.discoveryResult"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwareDatapathConfiguration serviceType](self, "serviceType"), CFSTR("WiFiAwareDataRequest.serviceType"));
  -[WiFiAwareDatapathConfiguration passphrase](self, "passphrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WiFiAwareDataRequest.passphrase"));

  -[WiFiAwareDatapathConfiguration pmk](self, "pmk");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WiFiAwareDataRequest.pmk"));

  -[WiFiAwareDatapathConfiguration pmkID](self, "pmkID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("WiFiAwareDataRequest.pmkID"));

  -[WiFiAwareDatapathConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WiFiAwareDataRequest.serviceSpecificInfo"));

  -[WiFiAwareDatapathConfiguration internetSharingConfiguration](self, "internetSharingConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("WiFiAwareDataRequest.internetSharingConfiguration"));

}

- (WiFiAwareDatapathConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WiFiAwareDatapathConfiguration *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataRequest.discoveryResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WiFiAwareDataRequest.serviceType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataRequest.passphrase"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataRequest.pmk"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataRequest.pmkID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataRequest.serviceSpecificInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataRequest.internetSharingConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[WiFiAwareDatapathConfiguration initWithDiscoveryResult:serviceType:passphrase:pmk:pmkID:serviceSpecificInfo:internetSharingConfiguration:](self, "initWithDiscoveryResult:serviceType:passphrase:pmk:pmkID:serviceSpecificInfo:internetSharingConfiguration:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (WiFiAwareDatapathConfiguration)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 passphrase:(id)a5 pmk:(id)a6 pmkID:(id)a7 serviceSpecificInfo:(id)a8 internetSharingConfiguration:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  WiFiAwareDatapathConfiguration *v22;
  WiFiAwareDatapathConfiguration *v23;
  uint64_t v24;
  NSString *passphrase;
  uint64_t v26;
  NSData *pmk;
  uint64_t v28;
  NSData *pmkID;
  uint64_t v30;
  WiFiAwarePublishDatapathServiceSpecificInfo *serviceSpecificInfo;
  uint64_t v32;
  WiFiAwareInternetSharingConfiguration *internetSharingConfiguration;
  objc_super v35;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v35.receiver = self;
  v35.super_class = (Class)WiFiAwareDatapathConfiguration;
  v22 = -[WiFiAwareDatapathConfiguration init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_discoveryResult, a3);
    v23->_serviceType = a4;
    v24 = objc_msgSend(v17, "copy");
    passphrase = v23->_passphrase;
    v23->_passphrase = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    pmk = v23->_pmk;
    v23->_pmk = (NSData *)v26;

    v28 = objc_msgSend(v19, "copy");
    pmkID = v23->_pmkID;
    v23->_pmkID = (NSData *)v28;

    v30 = objc_msgSend(v20, "copy");
    serviceSpecificInfo = v23->_serviceSpecificInfo;
    v23->_serviceSpecificInfo = (WiFiAwarePublishDatapathServiceSpecificInfo *)v30;

    v32 = objc_msgSend(v21, "copy");
    internetSharingConfiguration = v23->_internetSharingConfiguration;
    v23->_internetSharingConfiguration = (WiFiAwareInternetSharingConfiguration *)v32;

  }
  return v23;
}

- (BOOL)passphraseEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwareDatapathConfiguration passphrase](self, "passphrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passphrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareDatapathConfiguration passphrase](self, "passphrase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passphrase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)pmkEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwareDatapathConfiguration pmk](self, "pmk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pmk");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareDatapathConfiguration pmk](self, "pmk");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pmk");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)pmkIDEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwareDatapathConfiguration pmkID](self, "pmkID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pmkID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareDatapathConfiguration pmkID](self, "pmkID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pmkID");
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
  -[WiFiAwareDatapathConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceSpecificInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareDatapathConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSpecificInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)internetSharingEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwareDatapathConfiguration internetSharingConfiguration](self, "internetSharingConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internetSharingConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareDatapathConfiguration internetSharingConfiguration](self, "internetSharingConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internetSharingConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwareDatapathConfiguration *v4;
  WiFiAwareDatapathConfiguration *v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;
  BOOL v10;

  v4 = (WiFiAwareDatapathConfiguration *)a3;
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
      goto LABEL_16;
    }
    v5 = v4;
    -[WiFiAwareDatapathConfiguration discoveryResult](self, "discoveryResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwareDatapathConfiguration discoveryResult](v5, "discoveryResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v7)
      || (v8 = -[WiFiAwareDatapathConfiguration serviceType](self, "serviceType"),
          v8 != -[WiFiAwareDatapathConfiguration serviceType](v5, "serviceType"))
      || !-[WiFiAwareDatapathConfiguration passphraseEqual:](self, "passphraseEqual:", v5)
      || !-[WiFiAwareDatapathConfiguration pmkEqual:](self, "pmkEqual:", v5)
      || !-[WiFiAwareDatapathConfiguration pmkIDEqual:](self, "pmkIDEqual:", v5)
      || !-[WiFiAwareDatapathConfiguration serviceSpecificInfoEqual:](self, "serviceSpecificInfoEqual:", v5))
    {

LABEL_15:
      v10 = 0;
      goto LABEL_16;
    }
    v9 = -[WiFiAwareDatapathConfiguration internetSharingEqual:](self, "internetSharingEqual:", v5);

    if (!v9)
      goto LABEL_15;
  }
  v10 = 1;
LABEL_16:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  const char *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwareDatapathConfiguration discoveryResult](self, "discoveryResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WiFiAwareDatapathConfiguration serviceType](self, "serviceType");
  v6 = "unrecognized";
  if (v5 == 1)
    v6 = "realtime";
  if (v5)
    v7 = v6;
  else
    v7 = "adaptive";
  -[WiFiAwareDatapathConfiguration passphrase](self, "passphrase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDatapathConfiguration pmk](self, "pmk");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDatapathConfiguration pmkID](self, "pmkID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDatapathConfiguration serviceSpecificInfo](self, "serviceSpecificInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDatapathConfiguration internetSharingConfiguration](self, "internetSharingConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WiFiAwareDatapathConfiguration: discoveryResult=%@, serviceType=%s, passphrase=%@, pmk=%@, pmkID=%@, serviceSpecificInfo=%@, internetSharing=%@>"), v4, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (WiFiAwareDiscoveryResult)discoveryResult
{
  return self->_discoveryResult;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (NSData)pmk
{
  return self->_pmk;
}

- (NSData)pmkID
{
  return self->_pmkID;
}

- (WiFiAwarePublishDatapathServiceSpecificInfo)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (void)setServiceSpecificInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (WiFiAwareInternetSharingConfiguration)internetSharingConfiguration
{
  return self->_internetSharingConfiguration;
}

- (void)setInternetSharingConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internetSharingConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_pmkID, 0);
  objc_storeStrong((id *)&self->_pmk, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_discoveryResult, 0);
}

@end
