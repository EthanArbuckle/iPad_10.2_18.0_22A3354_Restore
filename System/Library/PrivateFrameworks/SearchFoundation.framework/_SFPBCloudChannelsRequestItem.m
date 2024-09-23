@implementation _SFPBCloudChannelsRequestItem

- (_SFPBCloudChannelsRequestItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBCloudChannelsRequestItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBCloudChannelsRequestItem *v12;

  v4 = a3;
  v5 = -[_SFPBCloudChannelsRequestItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "channelIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "channelIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCloudChannelsRequestItem setChannelIdentifier:](v5, "setChannelIdentifier:", v7);

    }
    objc_msgSend(v4, "pushTopic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "pushTopic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCloudChannelsRequestItem setPushTopic:](v5, "setPushTopic:", v9);

    }
    objc_msgSend(v4, "subscribedEntityIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "subscribedEntityIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCloudChannelsRequestItem setSubscribedEntityIdentifier:](v5, "setSubscribedEntityIdentifier:", v11);

    }
    v12 = v5;
  }

  return v5;
}

- (void)setChannelIdentifier:(id)a3
{
  NSString *v4;
  NSString *channelIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  channelIdentifier = self->_channelIdentifier;
  self->_channelIdentifier = v4;

}

- (void)setPushTopic:(id)a3
{
  NSString *v4;
  NSString *pushTopic;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  pushTopic = self->_pushTopic;
  self->_pushTopic = v4;

}

- (void)setSubscribedEntityIdentifier:(id)a3
{
  NSString *v4;
  NSString *subscribedEntityIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subscribedEntityIdentifier = self->_subscribedEntityIdentifier;
  self->_subscribedEntityIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCloudChannelsRequestItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBCloudChannelsRequestItem channelIdentifier](self, "channelIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBCloudChannelsRequestItem pushTopic](self, "pushTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBCloudChannelsRequestItem subscribedEntityIdentifier](self, "subscribedEntityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBCloudChannelsRequestItem channelIdentifier](self, "channelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBCloudChannelsRequestItem channelIdentifier](self, "channelIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBCloudChannelsRequestItem channelIdentifier](self, "channelIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "channelIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBCloudChannelsRequestItem pushTopic](self, "pushTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBCloudChannelsRequestItem pushTopic](self, "pushTopic");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBCloudChannelsRequestItem pushTopic](self, "pushTopic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pushTopic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBCloudChannelsRequestItem subscribedEntityIdentifier](self, "subscribedEntityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribedEntityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBCloudChannelsRequestItem subscribedEntityIdentifier](self, "subscribedEntityIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBCloudChannelsRequestItem subscribedEntityIdentifier](self, "subscribedEntityIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscribedEntityIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_channelIdentifier, "hash");
  v4 = -[NSString hash](self->_pushTopic, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_subscribedEntityIdentifier, "hash");
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
  if (self->_channelIdentifier)
  {
    -[_SFPBCloudChannelsRequestItem channelIdentifier](self, "channelIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("channelIdentifier"));

  }
  if (self->_pushTopic)
  {
    -[_SFPBCloudChannelsRequestItem pushTopic](self, "pushTopic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("pushTopic"));

  }
  if (self->_subscribedEntityIdentifier)
  {
    -[_SFPBCloudChannelsRequestItem subscribedEntityIdentifier](self, "subscribedEntityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("subscribedEntityIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCloudChannelsRequestItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCloudChannelsRequestItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCloudChannelsRequestItem *v5;
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
    self = -[_SFPBCloudChannelsRequestItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCloudChannelsRequestItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCloudChannelsRequestItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBCloudChannelsRequestItem *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBCloudChannelsRequestItem;
  v5 = -[_SFPBCloudChannelsRequestItem init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channelIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBCloudChannelsRequestItem setChannelIdentifier:](v5, "setChannelIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pushTopic"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBCloudChannelsRequestItem setPushTopic:](v5, "setPushTopic:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscribedEntityIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBCloudChannelsRequestItem setSubscribedEntityIdentifier:](v5, "setSubscribedEntityIdentifier:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (NSString)subscribedEntityIdentifier
{
  return self->_subscribedEntityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end
