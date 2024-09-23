@implementation SFRequestProductPageCommand

- (SFRequestProductPageCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFRequestProductPageCommand *v5;
  void *v6;
  void *v7;
  SFRequestProductPageCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFRequestProductPageCommand;
  v5 = -[SFRequestProductPageCommand init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "distributorBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "distributorBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRequestProductPageCommand setDistributorBundleIdentifier:](v5, "setDistributorBundleIdentifier:", v7);

    }
    if (objc_msgSend(v4, "itemIdentifier"))
      -[SFRequestProductPageCommand setItemIdentifier:](v5, "setItemIdentifier:", objc_msgSend(v4, "itemIdentifier"));
    if (objc_msgSend(v4, "versionIdentifier"))
      -[SFRequestProductPageCommand setVersionIdentifier:](v5, "setVersionIdentifier:", objc_msgSend(v4, "versionIdentifier"));
    v8 = v5;
  }

  return v5;
}

- (void)setItemIdentifier:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_itemIdentifier = a3;
}

- (BOOL)hasItemIdentifier
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setVersionIdentifier:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_versionIdentifier = a3;
}

- (BOOL)hasVersionIdentifier
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFRequestProductPageCommand)initWithCoder:(id)a3
{
  id v4;
  SFRequestProductPageCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFRequestProductPageCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand distributorBundleIdentifier](v8, "distributorBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRequestProductPageCommand setDistributorBundleIdentifier:](v5, "setDistributorBundleIdentifier:", v9);

    -[SFRequestProductPageCommand setItemIdentifier:](v5, "setItemIdentifier:", -[SFCommand itemIdentifier](v8, "itemIdentifier"));
    -[SFRequestProductPageCommand setVersionIdentifier:](v5, "setVersionIdentifier:", -[SFCommand versionIdentifier](v8, "versionIdentifier"));
    -[SFCommand commandDetail](v8, "commandDetail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v10);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v11);

    -[SFCommand backendData](v8, "backendData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v12);

    -[SFCommand commandReference](v8, "commandReference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFRequestProductPageCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRequestProductPageCommand *v2;
  void *v3;

  v2 = -[_SFPBRequestProductPageCommand initWithFacade:]([_SFPBRequestProductPageCommand alloc], "initWithFacade:", self);
  -[_SFPBRequestProductPageCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRequestProductPageCommand *v2;
  void *v3;

  v2 = -[_SFPBRequestProductPageCommand initWithFacade:]([_SFPBRequestProductPageCommand alloc], "initWithFacade:", self);
  -[_SFPBRequestProductPageCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFRequestProductPageCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFRequestProductPageCommand distributorBundleIdentifier](self, "distributorBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDistributorBundleIdentifier:", v6);

  objc_msgSend(v4, "setItemIdentifier:", -[SFRequestProductPageCommand itemIdentifier](self, "itemIdentifier"));
  objc_msgSend(v4, "setVersionIdentifier:", -[SFRequestProductPageCommand versionIdentifier](self, "versionIdentifier"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFRequestProductPageCommand *v6;
  SFRequestProductPageCommand *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  objc_super v15;

  v6 = (SFRequestProductPageCommand *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFRequestProductPageCommand isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v15.receiver = self;
      v15.super_class = (Class)SFRequestProductPageCommand;
      if (-[SFCommand isEqual:](&v15, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFRequestProductPageCommand distributorBundleIdentifier](self, "distributorBundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFRequestProductPageCommand distributorBundleIdentifier](v7, "distributorBundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
        -[SFRequestProductPageCommand distributorBundleIdentifier](self, "distributorBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFRequestProductPageCommand distributorBundleIdentifier](self, "distributorBundleIdentifier"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFRequestProductPageCommand distributorBundleIdentifier](v7, "distributorBundleIdentifier"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFRequestProductPageCommand itemIdentifier](self, "itemIdentifier");
          if (v12 == -[SFRequestProductPageCommand itemIdentifier](v7, "itemIdentifier"))
          {
            v13 = -[SFRequestProductPageCommand versionIdentifier](self, "versionIdentifier");
            v11 = v13 == -[SFRequestProductPageCommand versionIdentifier](v7, "versionIdentifier");
            if (!v10)
              goto LABEL_16;
          }
          else
          {
            v11 = 0;
            if (!v10)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_16;
      }
    }
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFRequestProductPageCommand;
  v3 = -[SFCommand hash](&v9, sel_hash);
  -[SFRequestProductPageCommand distributorBundleIdentifier](self, "distributorBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFRequestProductPageCommand itemIdentifier](self, "itemIdentifier");
  v7 = v6 ^ -[SFRequestProductPageCommand versionIdentifier](self, "versionIdentifier") ^ v3;

  return v7;
}

- (NSString)distributorBundleIdentifier
{
  return self->_distributorBundleIdentifier;
}

- (void)setDistributorBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (unint64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributorBundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
