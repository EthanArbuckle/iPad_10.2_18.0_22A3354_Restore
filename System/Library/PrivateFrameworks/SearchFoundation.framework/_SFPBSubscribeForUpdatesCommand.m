@implementation _SFPBSubscribeForUpdatesCommand

- (_SFPBSubscribeForUpdatesCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBSubscribeForUpdatesCommand *v5;
  void *v6;
  _SFPBCloudChannelsRequestItem *v7;
  void *v8;
  _SFPBCloudChannelsRequestItem *v9;
  void *v10;
  _SFPBDomainSubscriptionRequestItem *v11;
  void *v12;
  _SFPBDomainSubscriptionRequestItem *v13;
  _SFPBSubscribeForUpdatesCommand *v14;

  v4 = a3;
  v5 = -[_SFPBSubscribeForUpdatesCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "cloudChannelsRequestItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBCloudChannelsRequestItem alloc];
      objc_msgSend(v4, "cloudChannelsRequestItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBCloudChannelsRequestItem initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBSubscribeForUpdatesCommand setCloudChannelsRequestItem:](v5, "setCloudChannelsRequestItem:", v9);

    }
    objc_msgSend(v4, "domainSubscriptionRequestItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBDomainSubscriptionRequestItem alloc];
      objc_msgSend(v4, "domainSubscriptionRequestItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBDomainSubscriptionRequestItem initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBSubscribeForUpdatesCommand setDomainSubscriptionRequestItem:](v5, "setDomainSubscriptionRequestItem:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setCloudChannelsRequestItem:(id)a3
{
  objc_storeStrong((id *)&self->_cloudChannelsRequestItem, a3);
}

- (void)setDomainSubscriptionRequestItem:(id)a3
{
  objc_storeStrong((id *)&self->_domainSubscriptionRequestItem, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSubscribeForUpdatesCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBSubscribeForUpdatesCommand cloudChannelsRequestItem](self, "cloudChannelsRequestItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBSubscribeForUpdatesCommand domainSubscriptionRequestItem](self, "domainSubscriptionRequestItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBSubscribeForUpdatesCommand cloudChannelsRequestItem](self, "cloudChannelsRequestItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudChannelsRequestItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBSubscribeForUpdatesCommand cloudChannelsRequestItem](self, "cloudChannelsRequestItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBSubscribeForUpdatesCommand cloudChannelsRequestItem](self, "cloudChannelsRequestItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudChannelsRequestItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBSubscribeForUpdatesCommand domainSubscriptionRequestItem](self, "domainSubscriptionRequestItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainSubscriptionRequestItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBSubscribeForUpdatesCommand domainSubscriptionRequestItem](self, "domainSubscriptionRequestItem");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBSubscribeForUpdatesCommand domainSubscriptionRequestItem](self, "domainSubscriptionRequestItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domainSubscriptionRequestItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_SFPBCloudChannelsRequestItem hash](self->_cloudChannelsRequestItem, "hash");
  return -[_SFPBDomainSubscriptionRequestItem hash](self->_domainSubscriptionRequestItem, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cloudChannelsRequestItem)
  {
    -[_SFPBSubscribeForUpdatesCommand cloudChannelsRequestItem](self, "cloudChannelsRequestItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cloudChannelsRequestItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cloudChannelsRequestItem"));

    }
  }
  if (self->_domainSubscriptionRequestItem)
  {
    -[_SFPBSubscribeForUpdatesCommand domainSubscriptionRequestItem](self, "domainSubscriptionRequestItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("domainSubscriptionRequestItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("domainSubscriptionRequestItem"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSubscribeForUpdatesCommand dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBSubscribeForUpdatesCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSubscribeForUpdatesCommand *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBSubscribeForUpdatesCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSubscribeForUpdatesCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSubscribeForUpdatesCommand *v5;
  void *v6;
  _SFPBCloudChannelsRequestItem *v7;
  void *v8;
  _SFPBDomainSubscriptionRequestItem *v9;
  _SFPBSubscribeForUpdatesCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBSubscribeForUpdatesCommand;
  v5 = -[_SFPBSubscribeForUpdatesCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cloudChannelsRequestItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBCloudChannelsRequestItem initWithDictionary:]([_SFPBCloudChannelsRequestItem alloc], "initWithDictionary:", v6);
      -[_SFPBSubscribeForUpdatesCommand setCloudChannelsRequestItem:](v5, "setCloudChannelsRequestItem:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainSubscriptionRequestItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBDomainSubscriptionRequestItem initWithDictionary:]([_SFPBDomainSubscriptionRequestItem alloc], "initWithDictionary:", v8);
      -[_SFPBSubscribeForUpdatesCommand setDomainSubscriptionRequestItem:](v5, "setDomainSubscriptionRequestItem:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (_SFPBCloudChannelsRequestItem)cloudChannelsRequestItem
{
  return self->_cloudChannelsRequestItem;
}

- (_SFPBDomainSubscriptionRequestItem)domainSubscriptionRequestItem
{
  return self->_domainSubscriptionRequestItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainSubscriptionRequestItem, 0);
  objc_storeStrong((id *)&self->_cloudChannelsRequestItem, 0);
}

@end
