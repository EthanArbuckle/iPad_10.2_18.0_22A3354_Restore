@implementation SFShowAppStoreSheetCommand

- (SFShowAppStoreSheetCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFShowAppStoreSheetCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFShowAppStoreSheetCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFShowAppStoreSheetCommand;
  v5 = -[SFShowAppStoreSheetCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "storeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFShowAppStoreSheetCommand setStoreIdentifier:](v5, "setStoreIdentifier:", v7);

    }
    objc_msgSend(v4, "applicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFShowAppStoreSheetCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (SFShowAppStoreSheetCommand)initWithCoder:(id)a3
{
  id v4;
  SFShowAppStoreSheetCommand *v5;
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
  v5 = -[SFShowAppStoreSheetCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand storeIdentifier](v8, "storeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowAppStoreSheetCommand setStoreIdentifier:](v5, "setStoreIdentifier:", v9);

    -[SFCommand applicationBundleIdentifier](v8, "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowAppStoreSheetCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v10);

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
  v3.super_class = (Class)SFShowAppStoreSheetCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBShowAppStoreSheetCommand *v2;
  void *v3;

  v2 = -[_SFPBShowAppStoreSheetCommand initWithFacade:]([_SFPBShowAppStoreSheetCommand alloc], "initWithFacade:", self);
  -[_SFPBShowAppStoreSheetCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBShowAppStoreSheetCommand *v2;
  void *v3;

  v2 = -[_SFPBShowAppStoreSheetCommand initWithFacade:]([_SFPBShowAppStoreSheetCommand alloc], "initWithFacade:", self);
  -[_SFPBShowAppStoreSheetCommand jsonData](v2, "jsonData");
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
  v10.super_class = (Class)SFShowAppStoreSheetCommand;
  v4 = -[SFCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFShowAppStoreSheetCommand storeIdentifier](self, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setStoreIdentifier:", v6);

  -[SFShowAppStoreSheetCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setApplicationBundleIdentifier:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFShowAppStoreSheetCommand *v5;
  SFShowAppStoreSheetCommand *v6;
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

  v5 = (SFShowAppStoreSheetCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFShowAppStoreSheetCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v22.receiver = self;
      v22.super_class = (Class)SFShowAppStoreSheetCommand;
      if (-[SFCommand isEqual:](&v22, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFShowAppStoreSheetCommand storeIdentifier](self, "storeIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFShowAppStoreSheetCommand storeIdentifier](v6, "storeIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[SFShowAppStoreSheetCommand storeIdentifier](self, "storeIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFShowAppStoreSheetCommand storeIdentifier](self, "storeIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFShowAppStoreSheetCommand storeIdentifier](v6, "storeIdentifier");
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
        -[SFShowAppStoreSheetCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFShowAppStoreSheetCommand applicationBundleIdentifier](v6, "applicationBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFShowAppStoreSheetCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            -[SFShowAppStoreSheetCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFShowAppStoreSheetCommand applicationBundleIdentifier](v6, "applicationBundleIdentifier");
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
  v9.super_class = (Class)SFShowAppStoreSheetCommand;
  v3 = -[SFCommand hash](&v9, sel_hash);
  -[SFShowAppStoreSheetCommand storeIdentifier](self, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFShowAppStoreSheetCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
