@implementation SFSubscribeForUpdatesCommand

- (SFSubscribeForUpdatesCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFSubscribeForUpdatesCommand *v5;
  void *v6;
  SFCloudChannelsRequestItem *v7;
  void *v8;
  SFCloudChannelsRequestItem *v9;
  void *v10;
  SFDomainSubscriptionRequestItem *v11;
  void *v12;
  SFDomainSubscriptionRequestItem *v13;
  SFSubscribeForUpdatesCommand *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFSubscribeForUpdatesCommand;
  v5 = -[SFSubscribeForUpdatesCommand init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "cloudChannelsRequestItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFCloudChannelsRequestItem alloc];
      objc_msgSend(v4, "cloudChannelsRequestItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFCloudChannelsRequestItem initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFSubscribeForUpdatesCommand setCloudChannelsRequestItem:](v5, "setCloudChannelsRequestItem:", v9);

    }
    objc_msgSend(v4, "domainSubscriptionRequestItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFDomainSubscriptionRequestItem alloc];
      objc_msgSend(v4, "domainSubscriptionRequestItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFDomainSubscriptionRequestItem initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFSubscribeForUpdatesCommand setDomainSubscriptionRequestItem:](v5, "setDomainSubscriptionRequestItem:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (SFSubscribeForUpdatesCommand)initWithCoder:(id)a3
{
  id v4;
  SFSubscribeForUpdatesCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[SFSubscribeForUpdatesCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand cloudChannelsRequestItem](v8, "cloudChannelsRequestItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSubscribeForUpdatesCommand setCloudChannelsRequestItem:](v5, "setCloudChannelsRequestItem:", v9);

    -[SFCommand domainSubscriptionRequestItem](v8, "domainSubscriptionRequestItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSubscribeForUpdatesCommand setDomainSubscriptionRequestItem:](v5, "setDomainSubscriptionRequestItem:", v10);

    -[SFCommand commandDetail](v8, "commandDetail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v11);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v12);

    -[SFCommand backendData](v8, "backendData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v13);

    -[SFCommand commandReference](v8, "commandReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v14);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFSubscribeForUpdatesCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSubscribeForUpdatesCommand *v2;
  void *v3;

  v2 = -[_SFPBSubscribeForUpdatesCommand initWithFacade:]([_SFPBSubscribeForUpdatesCommand alloc], "initWithFacade:", self);
  -[_SFPBSubscribeForUpdatesCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSubscribeForUpdatesCommand *v2;
  void *v3;

  v2 = -[_SFPBSubscribeForUpdatesCommand initWithFacade:]([_SFPBSubscribeForUpdatesCommand alloc], "initWithFacade:", self);
  -[_SFPBSubscribeForUpdatesCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFSubscribeForUpdatesCommand;
  v4 = -[SFCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFSubscribeForUpdatesCommand cloudChannelsRequestItem](self, "cloudChannelsRequestItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCloudChannelsRequestItem:", v6);

  -[SFSubscribeForUpdatesCommand domainSubscriptionRequestItem](self, "domainSubscriptionRequestItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDomainSubscriptionRequestItem:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFSubscribeForUpdatesCommand *v5;
  SFSubscribeForUpdatesCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v5 = (SFSubscribeForUpdatesCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFSubscribeForUpdatesCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v22.receiver = self;
      v22.super_class = (Class)SFSubscribeForUpdatesCommand;
      if (-[SFCommand isEqual:](&v22, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFSubscribeForUpdatesCommand cloudChannelsRequestItem](self, "cloudChannelsRequestItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSubscribeForUpdatesCommand cloudChannelsRequestItem](v6, "cloudChannelsRequestItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[SFSubscribeForUpdatesCommand cloudChannelsRequestItem](self, "cloudChannelsRequestItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFSubscribeForUpdatesCommand cloudChannelsRequestItem](self, "cloudChannelsRequestItem");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSubscribeForUpdatesCommand cloudChannelsRequestItem](v6, "cloudChannelsRequestItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v10))
          {
            v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        -[SFSubscribeForUpdatesCommand domainSubscriptionRequestItem](self, "domainSubscriptionRequestItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSubscribeForUpdatesCommand domainSubscriptionRequestItem](v6, "domainSubscriptionRequestItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFSubscribeForUpdatesCommand domainSubscriptionRequestItem](self, "domainSubscriptionRequestItem");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            -[SFSubscribeForUpdatesCommand domainSubscriptionRequestItem](self, "domainSubscriptionRequestItem");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFSubscribeForUpdatesCommand domainSubscriptionRequestItem](v6, "domainSubscriptionRequestItem");
            v20 = v3;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v19, "isEqual:", v17);

            v3 = v20;
          }
          else
          {

            v11 = 1;
          }
        }
        v10 = v21;
        if (!v9)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    v11 = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFSubscribeForUpdatesCommand;
  v3 = -[SFCommand hash](&v9, sel_hash);
  -[SFSubscribeForUpdatesCommand cloudChannelsRequestItem](self, "cloudChannelsRequestItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFSubscribeForUpdatesCommand domainSubscriptionRequestItem](self, "domainSubscriptionRequestItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (SFCloudChannelsRequestItem)cloudChannelsRequestItem
{
  return self->_cloudChannelsRequestItem;
}

- (void)setCloudChannelsRequestItem:(id)a3
{
  objc_storeStrong((id *)&self->_cloudChannelsRequestItem, a3);
}

- (SFDomainSubscriptionRequestItem)domainSubscriptionRequestItem
{
  return self->_domainSubscriptionRequestItem;
}

- (void)setDomainSubscriptionRequestItem:(id)a3
{
  objc_storeStrong((id *)&self->_domainSubscriptionRequestItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainSubscriptionRequestItem, 0);
  objc_storeStrong((id *)&self->_cloudChannelsRequestItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
