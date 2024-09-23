@implementation SFOpenMediaCommand

- (SFOpenMediaCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFOpenMediaCommand *v5;
  void *v6;
  SFMediaMetadata *v7;
  void *v8;
  SFMediaMetadata *v9;
  void *v10;
  void *v11;
  SFOpenMediaCommand *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFOpenMediaCommand;
  v5 = -[SFOpenMediaCommand init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mediaMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFMediaMetadata alloc];
      objc_msgSend(v4, "mediaMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFMediaMetadata initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFOpenMediaCommand setMediaMetadata:](v5, "setMediaMetadata:", v9);

    }
    objc_msgSend(v4, "clientSelectedBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "clientSelectedBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFOpenMediaCommand setClientSelectedBundleIdentifier:](v5, "setClientSelectedBundleIdentifier:", v11);

    }
    v12 = v5;
  }

  return v5;
}

- (SFOpenMediaCommand)initWithCoder:(id)a3
{
  id v4;
  SFOpenMediaCommand *v5;
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
  v5 = -[SFOpenMediaCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand mediaMetadata](v8, "mediaMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenMediaCommand setMediaMetadata:](v5, "setMediaMetadata:", v9);

    -[SFCommand clientSelectedBundleIdentifier](v8, "clientSelectedBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenMediaCommand setClientSelectedBundleIdentifier:](v5, "setClientSelectedBundleIdentifier:", v10);

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
  v3.super_class = (Class)SFOpenMediaCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBOpenMediaCommand *v2;
  void *v3;

  v2 = -[_SFPBOpenMediaCommand initWithFacade:]([_SFPBOpenMediaCommand alloc], "initWithFacade:", self);
  -[_SFPBOpenMediaCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBOpenMediaCommand *v2;
  void *v3;

  v2 = -[_SFPBOpenMediaCommand initWithFacade:]([_SFPBOpenMediaCommand alloc], "initWithFacade:", self);
  -[_SFPBOpenMediaCommand jsonData](v2, "jsonData");
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
  v10.super_class = (Class)SFOpenMediaCommand;
  v4 = -[SFCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFOpenMediaCommand mediaMetadata](self, "mediaMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMediaMetadata:", v6);

  -[SFOpenMediaCommand clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setClientSelectedBundleIdentifier:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFOpenMediaCommand *v5;
  SFOpenMediaCommand *v6;
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

  v5 = (SFOpenMediaCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFOpenMediaCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v22.receiver = self;
      v22.super_class = (Class)SFOpenMediaCommand;
      if (-[SFCommand isEqual:](&v22, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFOpenMediaCommand mediaMetadata](self, "mediaMetadata");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFOpenMediaCommand mediaMetadata](v6, "mediaMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[SFOpenMediaCommand mediaMetadata](self, "mediaMetadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFOpenMediaCommand mediaMetadata](self, "mediaMetadata");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFOpenMediaCommand mediaMetadata](v6, "mediaMetadata");
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
        -[SFOpenMediaCommand clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFOpenMediaCommand clientSelectedBundleIdentifier](v6, "clientSelectedBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFOpenMediaCommand clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            -[SFOpenMediaCommand clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFOpenMediaCommand clientSelectedBundleIdentifier](v6, "clientSelectedBundleIdentifier");
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
  v9.super_class = (Class)SFOpenMediaCommand;
  v3 = -[SFCommand hash](&v9, sel_hash);
  -[SFOpenMediaCommand mediaMetadata](self, "mediaMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFOpenMediaCommand clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (SFMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (void)setMediaMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_mediaMetadata, a3);
}

- (NSString)clientSelectedBundleIdentifier
{
  return self->_clientSelectedBundleIdentifier;
}

- (void)setClientSelectedBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSelectedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
