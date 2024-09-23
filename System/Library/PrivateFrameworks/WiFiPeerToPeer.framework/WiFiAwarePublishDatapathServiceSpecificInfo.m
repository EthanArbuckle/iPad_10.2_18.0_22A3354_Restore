@implementation WiFiAwarePublishDatapathServiceSpecificInfo

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
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwarePublishDatapathServiceSpecificInfo protocolType](self, "protocolType"), CFSTR("WiFiAwarePublishDatapathServiceSpecificInfo.protocolType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[WiFiAwarePublishDatapathServiceSpecificInfo servicePort](self, "servicePort"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WiFiAwarePublishDatapathServiceSpecificInfo.port"));

  -[WiFiAwarePublishDatapathServiceSpecificInfo hostname](self, "hostname");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WiFiAwarePublishDatapathServiceSpecificInfo.hostname"));

}

- (WiFiAwarePublishDatapathServiceSpecificInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  WiFiAwarePublishDatapathServiceSpecificInfo *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WiFiAwarePublishDatapathServiceSpecificInfo.protocolType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishDatapathServiceSpecificInfo.port"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedShortValue");

  v8 = -[WiFiAwarePublishDatapathServiceSpecificInfo initWithProtocolType:servicePort:](self, "initWithProtocolType:servicePort:", v5, v7);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishDatapathServiceSpecificInfo.hostname"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiAwarePublishDatapathServiceSpecificInfo setHostname:](v8, "setHostname:", v9);
  return v8;
}

- (WiFiAwarePublishDatapathServiceSpecificInfo)initWithProtocolType:(int64_t)a3 servicePort:(unsigned __int16)a4
{
  WiFiAwarePublishDatapathServiceSpecificInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WiFiAwarePublishDatapathServiceSpecificInfo;
  result = -[WiFiAwarePublishDatapathServiceSpecificInfo init](&v7, sel_init);
  if (result)
  {
    result->_protocolType = a3;
    result->_servicePort = a4;
  }
  return result;
}

- (BOOL)hostnameEquals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwarePublishDatapathServiceSpecificInfo hostname](self, "hostname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishDatapathServiceSpecificInfo hostname](self, "hostname");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostname");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwarePublishDatapathServiceSpecificInfo *v4;
  WiFiAwarePublishDatapathServiceSpecificInfo *v5;
  int64_t v6;
  int v7;
  BOOL v8;

  v4 = (WiFiAwarePublishDatapathServiceSpecificInfo *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_8:
    v8 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    v5 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  v6 = -[WiFiAwarePublishDatapathServiceSpecificInfo protocolType](self, "protocolType");
  if (v6 == -[WiFiAwarePublishDatapathServiceSpecificInfo protocolType](v5, "protocolType"))
  {
    v7 = -[WiFiAwarePublishDatapathServiceSpecificInfo servicePort](self, "servicePort");
    if (v7 == -[WiFiAwarePublishDatapathServiceSpecificInfo servicePort](v5, "servicePort"))
    {
      if (-[WiFiAwarePublishDatapathServiceSpecificInfo hostnameEquals:](self, "hostnameEquals:", v5))
        goto LABEL_8;
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)description
{
  int64_t v3;
  const char *v4;
  const char *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v3 = -[WiFiAwarePublishDatapathServiceSpecificInfo protocolType](self, "protocolType");
  v4 = "UDP";
  if (v3 != 1)
    v4 = 0;
  if (v3)
    v5 = v4;
  else
    v5 = "TCP";
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = -[WiFiAwarePublishDatapathServiceSpecificInfo servicePort](self, "servicePort");
  -[WiFiAwarePublishDatapathServiceSpecificInfo hostname](self, "hostname");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<WiFiAwarePublishDatapathServiceSpecificInfo: protocolType=%s, servicePort=%hu, hostname=%@>"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiAwarePublishDatapathServiceSpecificInfo *v4;
  void *v5;

  v4 = -[WiFiAwarePublishDatapathServiceSpecificInfo initWithProtocolType:servicePort:]([WiFiAwarePublishDatapathServiceSpecificInfo alloc], "initWithProtocolType:servicePort:", -[WiFiAwarePublishDatapathServiceSpecificInfo protocolType](self, "protocolType"), -[WiFiAwarePublishDatapathServiceSpecificInfo servicePort](self, "servicePort"));
  -[WiFiAwarePublishDatapathServiceSpecificInfo hostname](self, "hostname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishDatapathServiceSpecificInfo setHostname:](v4, "setHostname:", v5);

  return v4;
}

- (int64_t)protocolType
{
  return self->_protocolType;
}

- (unsigned)servicePort
{
  return self->_servicePort;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end
