@implementation SFOpenFileProviderItemCommand

- (void)setShouldRevealFile:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldRevealFile = a3;
}

- (BOOL)hasShouldRevealFile
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFOpenFileProviderItemCommand)initWithCoder:(id)a3
{
  id v4;
  SFOpenFileProviderItemCommand *v5;
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
  v5 = -[SFOpenFileProviderItemCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand coreSpotlightIdentifier](v8, "coreSpotlightIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenFileProviderItemCommand setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v9);

    -[SFCommand fileProviderIdentifier](v8, "fileProviderIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenFileProviderItemCommand setFileProviderIdentifier:](v5, "setFileProviderIdentifier:", v10);

    -[SFOpenFileProviderItemCommand setShouldRevealFile:](v5, "setShouldRevealFile:", -[SFCommand shouldRevealFile](v8, "shouldRevealFile"));
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
  v3.super_class = (Class)SFOpenFileProviderItemCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBOpenFileProviderItemCommand *v2;
  void *v3;

  v2 = -[_SFPBOpenFileProviderItemCommand initWithFacade:]([_SFPBOpenFileProviderItemCommand alloc], "initWithFacade:", self);
  -[_SFPBOpenFileProviderItemCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBOpenFileProviderItemCommand *v2;
  void *v3;

  v2 = -[_SFPBOpenFileProviderItemCommand initWithFacade:]([_SFPBOpenFileProviderItemCommand alloc], "initWithFacade:", self);
  -[_SFPBOpenFileProviderItemCommand jsonData](v2, "jsonData");
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
  v10.super_class = (Class)SFOpenFileProviderItemCommand;
  v4 = -[SFCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFOpenFileProviderItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCoreSpotlightIdentifier:", v6);

  -[SFOpenFileProviderItemCommand fileProviderIdentifier](self, "fileProviderIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setFileProviderIdentifier:", v8);

  objc_msgSend(v4, "setShouldRevealFile:", -[SFOpenFileProviderItemCommand shouldRevealFile](self, "shouldRevealFile"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFOpenFileProviderItemCommand *v5;
  SFOpenFileProviderItemCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v5 = (SFOpenFileProviderItemCommand *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[SFOpenFileProviderItemCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v23.receiver = self;
      v23.super_class = (Class)SFOpenFileProviderItemCommand;
      if (-[SFCommand isEqual:](&v23, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFOpenFileProviderItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFOpenFileProviderItemCommand coreSpotlightIdentifier](v6, "coreSpotlightIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_25:

          goto LABEL_26;
        }
        -[SFOpenFileProviderItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFOpenFileProviderItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFOpenFileProviderItemCommand coreSpotlightIdentifier](v6, "coreSpotlightIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            LOBYTE(v11) = 0;
            goto LABEL_23;
          }
          v22 = v10;
        }
        -[SFOpenFileProviderItemCommand fileProviderIdentifier](self, "fileProviderIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFOpenFileProviderItemCommand fileProviderIdentifier](v6, "fileProviderIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          LOBYTE(v11) = 0;
          goto LABEL_22;
        }
        -[SFOpenFileProviderItemCommand fileProviderIdentifier](self, "fileProviderIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v19 = v3;
          -[SFOpenFileProviderItemCommand fileProviderIdentifier](self, "fileProviderIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFOpenFileProviderItemCommand fileProviderIdentifier](v6, "fileProviderIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            LOBYTE(v11) = 0;
            v3 = v19;
LABEL_20:

LABEL_21:
LABEL_22:
            v10 = v22;
            if (!v9)
            {
LABEL_24:

              goto LABEL_25;
            }
LABEL_23:

            goto LABEL_24;
          }
          v3 = v19;
        }
        v17 = -[SFOpenFileProviderItemCommand shouldRevealFile](self, "shouldRevealFile");
        v11 = v17 ^ -[SFOpenFileProviderItemCommand shouldRevealFile](v6, "shouldRevealFile") ^ 1;
        if (!v15)
          goto LABEL_21;
        goto LABEL_20;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFOpenFileProviderItemCommand;
  v3 = -[SFCommand hash](&v10, sel_hash);
  -[SFOpenFileProviderItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFOpenFileProviderItemCommand fileProviderIdentifier](self, "fileProviderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SFOpenFileProviderItemCommand shouldRevealFile](self, "shouldRevealFile") ^ v3;

  return v8;
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)fileProviderIdentifier
{
  return self->_fileProviderIdentifier;
}

- (void)setFileProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)shouldRevealFile
{
  return self->_shouldRevealFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFOpenFileProviderItemCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFOpenFileProviderItemCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFOpenFileProviderItemCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFOpenFileProviderItemCommand;
  v5 = -[SFOpenFileProviderItemCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "coreSpotlightIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFOpenFileProviderItemCommand setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v7);

    }
    objc_msgSend(v4, "fileProviderIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "fileProviderIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFOpenFileProviderItemCommand setFileProviderIdentifier:](v5, "setFileProviderIdentifier:", v9);

    }
    if (objc_msgSend(v4, "shouldRevealFile"))
      -[SFOpenFileProviderItemCommand setShouldRevealFile:](v5, "setShouldRevealFile:", objc_msgSend(v4, "shouldRevealFile"));
    v10 = v5;
  }

  return v5;
}

@end
