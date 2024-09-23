@implementation SFOpenCoreSpotlightItemCommand

- (SFOpenCoreSpotlightItemCommand)initWithCoder:(id)a3
{
  id v4;
  SFOpenCoreSpotlightItemCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = -[SFOpenCoreSpotlightItemCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand coreSpotlightIdentifier](v8, "coreSpotlightIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenCoreSpotlightItemCommand setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v9);

    -[SFCommand applicationBundleIdentifier](v8, "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenCoreSpotlightItemCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v10);

    -[SFCommand actionIdentifier](v8, "actionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenCoreSpotlightItemCommand setActionIdentifier:](v5, "setActionIdentifier:", v11);

    -[SFCommand commandDetail](v8, "commandDetail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v12);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v13);

    -[SFCommand backendData](v8, "backendData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v14);

    -[SFCommand commandReference](v8, "commandReference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v15);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFOpenCoreSpotlightItemCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBOpenCoreSpotlightItemCommand *v2;
  void *v3;

  v2 = -[_SFPBOpenCoreSpotlightItemCommand initWithFacade:]([_SFPBOpenCoreSpotlightItemCommand alloc], "initWithFacade:", self);
  -[_SFPBOpenCoreSpotlightItemCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBOpenCoreSpotlightItemCommand *v2;
  void *v3;

  v2 = -[_SFPBOpenCoreSpotlightItemCommand initWithFacade:]([_SFPBOpenCoreSpotlightItemCommand alloc], "initWithFacade:", self);
  -[_SFPBOpenCoreSpotlightItemCommand jsonData](v2, "jsonData");
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
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFOpenCoreSpotlightItemCommand;
  v4 = -[SFCommand copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFOpenCoreSpotlightItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCoreSpotlightIdentifier:", v6);

  -[SFOpenCoreSpotlightItemCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setApplicationBundleIdentifier:", v8);

  -[SFOpenCoreSpotlightItemCommand actionIdentifier](self, "actionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setActionIdentifier:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFOpenCoreSpotlightItemCommand *v5;
  SFOpenCoreSpotlightItemCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v5 = (SFOpenCoreSpotlightItemCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFOpenCoreSpotlightItemCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v32.receiver = self;
      v32.super_class = (Class)SFOpenCoreSpotlightItemCommand;
      if (-[SFCommand isEqual:](&v32, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFOpenCoreSpotlightItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFOpenCoreSpotlightItemCommand coreSpotlightIdentifier](v6, "coreSpotlightIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        -[SFOpenCoreSpotlightItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFOpenCoreSpotlightItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFOpenCoreSpotlightItemCommand coreSpotlightIdentifier](v6, "coreSpotlightIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v10))
          {
            v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        -[SFOpenCoreSpotlightItemCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFOpenCoreSpotlightItemCommand applicationBundleIdentifier](v6, "applicationBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_28;
        }
        -[SFOpenCoreSpotlightItemCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v25 = v12;
          -[SFOpenCoreSpotlightItemCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFOpenCoreSpotlightItemCommand applicationBundleIdentifier](v6, "applicationBundleIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v12 = v25;
            goto LABEL_26;
          }
          v29 = v15;
          v30 = v3;
          v12 = v25;
        }
        else
        {
          v29 = 0;
          v30 = v3;
        }
        -[SFOpenCoreSpotlightItemCommand actionIdentifier](self, "actionIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFOpenCoreSpotlightItemCommand actionIdentifier](v6, "actionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
        {

          v11 = 0;
          v15 = v29;
          v3 = v30;
          if (!v29)
            goto LABEL_27;
        }
        else
        {
          v24 = v17;
          v26 = v18;
          -[SFOpenCoreSpotlightItemCommand actionIdentifier](self, "actionIdentifier");
          v19 = objc_claimAutoreleasedReturnValue();
          v15 = v29;
          if (v19)
          {
            v23 = (void *)v19;
            -[SFOpenCoreSpotlightItemCommand actionIdentifier](self, "actionIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFOpenCoreSpotlightItemCommand actionIdentifier](v6, "actionIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v22, "isEqual:");

          }
          else
          {

            v11 = 1;
          }
          v3 = v30;
          if (!v29)
            goto LABEL_27;
        }
LABEL_26:

LABEL_27:
LABEL_28:
        v10 = v31;
        if (!v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    v11 = 0;
  }
LABEL_32:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFOpenCoreSpotlightItemCommand;
  v3 = -[SFCommand hash](&v11, sel_hash);
  -[SFOpenCoreSpotlightItemCommand coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFOpenCoreSpotlightItemCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFOpenCoreSpotlightItemCommand actionIdentifier](self, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (void)setCoreSpotlightIdentifier:(id)a3
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

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFOpenCoreSpotlightItemCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFOpenCoreSpotlightItemCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFOpenCoreSpotlightItemCommand *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFOpenCoreSpotlightItemCommand;
  v5 = -[SFOpenCoreSpotlightItemCommand init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "coreSpotlightIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFOpenCoreSpotlightItemCommand setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v7);

    }
    objc_msgSend(v4, "applicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFOpenCoreSpotlightItemCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    objc_msgSend(v4, "actionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "actionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFOpenCoreSpotlightItemCommand setActionIdentifier:](v5, "setActionIdentifier:", v11);

    }
    v12 = v5;
  }

  return v5;
}

@end
