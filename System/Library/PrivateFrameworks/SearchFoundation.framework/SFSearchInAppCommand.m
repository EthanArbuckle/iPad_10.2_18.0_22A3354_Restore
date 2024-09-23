@implementation SFSearchInAppCommand

- (void)setSearchInAppType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_searchInAppType = a3;
}

- (BOOL)hasSearchInAppType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFSearchInAppCommand)initWithCoder:(id)a3
{
  id v4;
  SFSearchInAppCommand *v5;
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
  v5 = -[SFSearchInAppCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand searchString](v8, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchInAppCommand setSearchString:](v5, "setSearchString:", v9);

    -[SFCommand applicationBundleIdentifier](v8, "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchInAppCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v10);

    -[SFSearchInAppCommand setSearchInAppType:](v5, "setSearchInAppType:", -[SFCommand searchInAppType](v8, "searchInAppType"));
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
  v3.super_class = (Class)SFSearchInAppCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSearchInAppCommand *v2;
  void *v3;

  v2 = -[_SFPBSearchInAppCommand initWithFacade:]([_SFPBSearchInAppCommand alloc], "initWithFacade:", self);
  -[_SFPBSearchInAppCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSearchInAppCommand *v2;
  void *v3;

  v2 = -[_SFPBSearchInAppCommand initWithFacade:]([_SFPBSearchInAppCommand alloc], "initWithFacade:", self);
  -[_SFPBSearchInAppCommand jsonData](v2, "jsonData");
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
  v10.super_class = (Class)SFSearchInAppCommand;
  v4 = -[SFCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFSearchInAppCommand searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSearchString:", v6);

  -[SFSearchInAppCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setApplicationBundleIdentifier:", v8);

  objc_msgSend(v4, "setSearchInAppType:", -[SFSearchInAppCommand searchInAppType](self, "searchInAppType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFSearchInAppCommand *v5;
  SFSearchInAppCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v5 = (SFSearchInAppCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFSearchInAppCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v23.receiver = self;
      v23.super_class = (Class)SFSearchInAppCommand;
      if (-[SFCommand isEqual:](&v23, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFSearchInAppCommand searchString](self, "searchString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSearchInAppCommand searchString](v6, "searchString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_25:

          goto LABEL_26;
        }
        -[SFSearchInAppCommand searchString](self, "searchString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFSearchInAppCommand searchString](self, "searchString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSearchInAppCommand searchString](v6, "searchString");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_23;
          }
          v22 = v10;
        }
        -[SFSearchInAppCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSearchInAppCommand applicationBundleIdentifier](v6, "applicationBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_22;
        }
        -[SFSearchInAppCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v19 = v3;
          -[SFSearchInAppCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSearchInAppCommand applicationBundleIdentifier](v6, "applicationBundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
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
        v17 = -[SFSearchInAppCommand searchInAppType](self, "searchInAppType");
        v11 = v17 == -[SFSearchInAppCommand searchInAppType](v6, "searchInAppType");
        if (!v15)
          goto LABEL_21;
        goto LABEL_20;
      }
    }
    v11 = 0;
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
  v10.super_class = (Class)SFSearchInAppCommand;
  v3 = -[SFCommand hash](&v10, sel_hash);
  -[SFSearchInAppCommand searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFSearchInAppCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SFSearchInAppCommand searchInAppType](self, "searchInAppType") ^ v3;

  return v8;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)searchInAppType
{
  return self->_searchInAppType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSearchInAppCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFSearchInAppCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFSearchInAppCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFSearchInAppCommand;
  v5 = -[SFSearchInAppCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "searchString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchInAppCommand setSearchString:](v5, "setSearchString:", v7);

    }
    objc_msgSend(v4, "applicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchInAppCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    if (objc_msgSend(v4, "searchInAppType"))
      -[SFSearchInAppCommand setSearchInAppType:](v5, "setSearchInAppType:", objc_msgSend(v4, "searchInAppType"));
    v10 = v5;
  }

  return v5;
}

@end
