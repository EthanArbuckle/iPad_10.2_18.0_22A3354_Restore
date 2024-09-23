@implementation WiFiAwarePublisherDataSessionHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedChar:", -[WiFiAwarePublisherDataSessionHandle datapathID](self, "datapathID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("WiFiAwarePublisherDataSessionHandle.datapathID"));

  -[WiFiAwarePublisherDataSessionHandle initiatorDataAddress](self, "initiatorDataAddress");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("WiFiAwarePublisherDataSessionHandle.initiatorDataAddress"));

}

- (WiFiAwarePublisherDataSessionHandle)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  WiFiAwarePublisherDataSessionHandle *v7;

  v4 = a3;
  v5 = decodeInstanceIDFrom(v4, CFSTR("WiFiAwarePublisherDataSessionHandle.datapathID"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublisherDataSessionHandle.initiatorDataAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WiFiAwarePublisherDataSessionHandle initWithDatapathID:initiatorDataAddress:](self, "initWithDatapathID:initiatorDataAddress:", v5, v6);
  return v7;
}

- (WiFiAwarePublisherDataSessionHandle)initWithDatapathID:(unsigned __int8)a3 initiatorDataAddress:(id)a4
{
  id v7;
  WiFiAwarePublisherDataSessionHandle *v8;
  WiFiAwarePublisherDataSessionHandle *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WiFiAwarePublisherDataSessionHandle;
  v8 = -[WiFiAwarePublisherDataSessionHandle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_datapathID = a3;
    objc_storeStrong((id *)&v8->_initiatorDataAddress, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwarePublisherDataSessionHandle *v4;
  WiFiAwarePublisherDataSessionHandle *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;

  v4 = (WiFiAwarePublisherDataSessionHandle *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_7:
    v10 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    v5 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  v6 = -[WiFiAwarePublisherDataSessionHandle datapathID](self, "datapathID");
  if (v6 == -[WiFiAwarePublisherDataSessionHandle datapathID](v5, "datapathID"))
  {
    -[WiFiAwarePublisherDataSessionHandle initiatorDataAddress](self, "initiatorDataAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwarePublisherDataSessionHandle initiatorDataAddress](v5, "initiatorDataAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
      goto LABEL_7;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[WiFiAwarePublisherDataSessionHandle datapathID](self, "datapathID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WiFiAwarePublisherDataSessionHandle initiatorDataAddress](self, "initiatorDataAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[WiFiAwarePublisherDataSessionHandle datapathID](self, "datapathID");
  -[WiFiAwarePublisherDataSessionHandle initiatorDataAddress](self, "initiatorDataAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WiFiAwarePublisherDataSessionHandle: ID=%u, initiator=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)datapathID
{
  return self->_datapathID;
}

- (WiFiMACAddress)initiatorDataAddress
{
  return self->_initiatorDataAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatorDataAddress, 0);
}

@end
