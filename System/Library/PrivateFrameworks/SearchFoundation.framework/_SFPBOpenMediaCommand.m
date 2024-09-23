@implementation _SFPBOpenMediaCommand

- (_SFPBOpenMediaCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBOpenMediaCommand *v5;
  void *v6;
  _SFPBMediaMetadata *v7;
  void *v8;
  _SFPBMediaMetadata *v9;
  void *v10;
  void *v11;
  _SFPBOpenMediaCommand *v12;

  v4 = a3;
  v5 = -[_SFPBOpenMediaCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "mediaMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBMediaMetadata alloc];
      objc_msgSend(v4, "mediaMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBMediaMetadata initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBOpenMediaCommand setMediaMetadata:](v5, "setMediaMetadata:", v9);

    }
    objc_msgSend(v4, "clientSelectedBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "clientSelectedBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBOpenMediaCommand setClientSelectedBundleIdentifier:](v5, "setClientSelectedBundleIdentifier:", v11);

    }
    v12 = v5;
  }

  return v5;
}

- (void)setMediaMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_mediaMetadata, a3);
}

- (void)setClientSelectedBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *clientSelectedBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  clientSelectedBundleIdentifier = self->_clientSelectedBundleIdentifier;
  self->_clientSelectedBundleIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBOpenMediaCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBOpenMediaCommand mediaMetadata](self, "mediaMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBOpenMediaCommand clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBOpenMediaCommand mediaMetadata](self, "mediaMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBOpenMediaCommand mediaMetadata](self, "mediaMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBOpenMediaCommand mediaMetadata](self, "mediaMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBOpenMediaCommand clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientSelectedBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBOpenMediaCommand clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBOpenMediaCommand clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientSelectedBundleIdentifier");
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

  v3 = -[_SFPBMediaMetadata hash](self->_mediaMetadata, "hash");
  return -[NSString hash](self->_clientSelectedBundleIdentifier, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clientSelectedBundleIdentifier)
  {
    -[_SFPBOpenMediaCommand clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clientSelectedBundleIdentifier"));

  }
  if (self->_mediaMetadata)
  {
    -[_SFPBOpenMediaCommand mediaMetadata](self, "mediaMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mediaMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mediaMetadata"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBOpenMediaCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBOpenMediaCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBOpenMediaCommand *v5;
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
    self = -[_SFPBOpenMediaCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBOpenMediaCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBOpenMediaCommand *v5;
  void *v6;
  _SFPBMediaMetadata *v7;
  void *v8;
  void *v9;
  _SFPBOpenMediaCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBOpenMediaCommand;
  v5 = -[_SFPBOpenMediaCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBMediaMetadata initWithDictionary:]([_SFPBMediaMetadata alloc], "initWithDictionary:", v6);
      -[_SFPBOpenMediaCommand setMediaMetadata:](v5, "setMediaMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientSelectedBundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBOpenMediaCommand setClientSelectedBundleIdentifier:](v5, "setClientSelectedBundleIdentifier:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (_SFPBMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (NSString)clientSelectedBundleIdentifier
{
  return self->_clientSelectedBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSelectedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
}

@end
