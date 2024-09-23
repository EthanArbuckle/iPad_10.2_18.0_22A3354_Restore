@implementation SFCoreSpotlightButtonItem

- (SFCoreSpotlightButtonItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCoreSpotlightButtonItem *v6;
  SFCoreSpotlightButtonItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCoreSpotlightButtonItem initWithData:]([_SFPBCoreSpotlightButtonItem alloc], "initWithData:", v5);
  v7 = -[SFCoreSpotlightButtonItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCoreSpotlightButtonItem *v6;

  v4 = a3;
  v6 = -[_SFPBCoreSpotlightButtonItem initWithFacade:]([_SFPBCoreSpotlightButtonItem alloc], "initWithFacade:", self);
  -[_SFPBCoreSpotlightButtonItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCoreSpotlightButtonItem *v2;
  void *v3;

  v2 = -[_SFPBCoreSpotlightButtonItem initWithFacade:]([_SFPBCoreSpotlightButtonItem alloc], "initWithFacade:", self);
  -[_SFPBCoreSpotlightButtonItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCoreSpotlightButtonItem *v2;
  void *v3;

  v2 = -[_SFPBCoreSpotlightButtonItem initWithFacade:]([_SFPBCoreSpotlightButtonItem alloc], "initWithFacade:", self);
  -[_SFPBCoreSpotlightButtonItem jsonData](v2, "jsonData");
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
  v12.super_class = (Class)SFCoreSpotlightButtonItem;
  v4 = -[SFButtonItem copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFCoreSpotlightButtonItem actionItemTypes](self, "actionItemTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setActionItemTypes:", v6);

  -[SFCoreSpotlightButtonItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setApplicationBundleIdentifier:", v8);

  -[SFCoreSpotlightButtonItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setCoreSpotlightIdentifier:", v10);

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFCoreSpotlightButtonItem *v5;
  SFCoreSpotlightButtonItem *v6;
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
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
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
  void *v32;
  objc_super v33;

  v5 = (SFCoreSpotlightButtonItem *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFCoreSpotlightButtonItem isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v33.receiver = self;
      v33.super_class = (Class)SFCoreSpotlightButtonItem;
      if (-[SFButtonItem isEqual:](&v33, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFCoreSpotlightButtonItem actionItemTypes](self, "actionItemTypes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightButtonItem actionItemTypes](v6, "actionItemTypes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
        -[SFCoreSpotlightButtonItem actionItemTypes](self, "actionItemTypes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFCoreSpotlightButtonItem actionItemTypes](self, "actionItemTypes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCoreSpotlightButtonItem actionItemTypes](v6, "actionItemTypes");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        -[SFCoreSpotlightButtonItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightButtonItem applicationBundleIdentifier](v6, "applicationBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_30;
        }
        -[SFCoreSpotlightButtonItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v26 = v12;
          -[SFCoreSpotlightButtonItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCoreSpotlightButtonItem applicationBundleIdentifier](v6, "applicationBundleIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        -[SFCoreSpotlightButtonItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightButtonItem coreSpotlightIdentifier](v6, "coreSpotlightIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
        {

          v11 = 0;
          v15 = v31;
          v3 = v28;
          if (!v31)
            goto LABEL_29;
          goto LABEL_28;
        }
        v24 = v18;
        v25 = v17;
        -[SFCoreSpotlightButtonItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
        v15 = v31;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27
          || (-[SFCoreSpotlightButtonItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFCoreSpotlightButtonItem coreSpotlightIdentifier](v6, "coreSpotlightIdentifier"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          v3 = v28;
          v20 = -[SFButtonItem uniqueId](self, "uniqueId");
          v11 = v20 == -[SFButtonItem uniqueId](v6, "uniqueId");
          if (!v27)
            goto LABEL_27;
        }
        else
        {
          v11 = 0;
          v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    v11 = 0;
  }
LABEL_34:

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
  uint64_t v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFCoreSpotlightButtonItem;
  v3 = -[SFButtonItem hash](&v12, sel_hash);
  -[SFCoreSpotlightButtonItem actionItemTypes](self, "actionItemTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFCoreSpotlightButtonItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFCoreSpotlightButtonItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[SFButtonItem uniqueId](self, "uniqueId") ^ v3;

  return v10;
}

- (NSArray)actionItemTypes
{
  return self->_actionItemTypes;
}

- (void)setActionItemTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionItemTypes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCoreSpotlightButtonItem)initWithProtobuf:(id)a3
{
  id v4;
  SFCoreSpotlightButtonItem *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SFCoreSpotlightButtonItem *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFCoreSpotlightButtonItem;
  v5 = -[SFCoreSpotlightButtonItem init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "actionItemTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "actionItemTypes", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          if (*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i))
            objc_msgSend(v7, "addObject:");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    -[SFCoreSpotlightButtonItem setActionItemTypes:](v5, "setActionItemTypes:", v7);
    objc_msgSend(v4, "applicationBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightButtonItem setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v14);

    }
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "coreSpotlightIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightButtonItem setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v16);

    }
    if (objc_msgSend(v4, "uniqueId"))
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v17 = v5;

  }
  return v5;
}

@end
