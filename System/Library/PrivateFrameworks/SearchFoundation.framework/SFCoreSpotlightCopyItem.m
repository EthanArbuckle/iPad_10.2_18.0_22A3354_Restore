@implementation SFCoreSpotlightCopyItem

- (SFCoreSpotlightCopyItem)initWithProtobuf:(id)a3
{
  id v4;
  SFCoreSpotlightCopyItem *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SFCoreSpotlightCopyItem *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SFCoreSpotlightCopyItem;
  v5 = -[SFCoreSpotlightCopyItem init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "dataProviderTypeIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "dataProviderTypeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          if (*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i))
            objc_msgSend(v7, "addObject:");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v10);
    }

    -[SFCoreSpotlightCopyItem setDataProviderTypeIdentifiers:](v5, "setDataProviderTypeIdentifiers:", v7);
    objc_msgSend(v4, "fileProviderTypeIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v14 = 0;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "fileProviderTypeIdentifiers", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          if (*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j))
            objc_msgSend(v14, "addObject:");
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v17);
    }

    -[SFCoreSpotlightCopyItem setFileProviderTypeIdentifiers:](v5, "setFileProviderTypeIdentifiers:", v14);
    objc_msgSend(v4, "applicationBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightCopyItem setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v21);

    }
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "coreSpotlightIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightCopyItem setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v23);

    }
    v24 = v5;

  }
  return v5;
}

- (SFCoreSpotlightCopyItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCoreSpotlightCopyItem *v6;
  SFCoreSpotlightCopyItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCoreSpotlightCopyItem initWithData:]([_SFPBCoreSpotlightCopyItem alloc], "initWithData:", v5);
  v7 = -[SFCoreSpotlightCopyItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCoreSpotlightCopyItem *v6;

  v4 = a3;
  v6 = -[_SFPBCoreSpotlightCopyItem initWithFacade:]([_SFPBCoreSpotlightCopyItem alloc], "initWithFacade:", self);
  -[_SFPBCoreSpotlightCopyItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCoreSpotlightCopyItem *v2;
  void *v3;

  v2 = -[_SFPBCoreSpotlightCopyItem initWithFacade:]([_SFPBCoreSpotlightCopyItem alloc], "initWithFacade:", self);
  -[_SFPBCoreSpotlightCopyItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCoreSpotlightCopyItem *v2;
  void *v3;

  v2 = -[_SFPBCoreSpotlightCopyItem initWithFacade:]([_SFPBCoreSpotlightCopyItem alloc], "initWithFacade:", self);
  -[_SFPBCoreSpotlightCopyItem jsonData](v2, "jsonData");
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
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFCoreSpotlightCopyItem;
  v4 = -[SFCopyItem copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[SFCoreSpotlightCopyItem dataProviderTypeIdentifiers](self, "dataProviderTypeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDataProviderTypeIdentifiers:", v6);

  -[SFCoreSpotlightCopyItem fileProviderTypeIdentifiers](self, "fileProviderTypeIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setFileProviderTypeIdentifiers:", v8);

  -[SFCoreSpotlightCopyItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setApplicationBundleIdentifier:", v10);

  -[SFCoreSpotlightCopyItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setCoreSpotlightIdentifier:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFCoreSpotlightCopyItem *v5;
  SFCoreSpotlightCopyItem *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;

  v5 = (SFCoreSpotlightCopyItem *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFCoreSpotlightCopyItem isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v42.receiver = self;
      v42.super_class = (Class)SFCoreSpotlightCopyItem;
      if (-[SFCopyItem isEqual:](&v42, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFCoreSpotlightCopyItem dataProviderTypeIdentifiers](self, "dataProviderTypeIdentifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightCopyItem dataProviderTypeIdentifiers](v6, "dataProviderTypeIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_38:

          goto LABEL_39;
        }
        -[SFCoreSpotlightCopyItem dataProviderTypeIdentifiers](self, "dataProviderTypeIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFCoreSpotlightCopyItem dataProviderTypeIdentifiers](self, "dataProviderTypeIdentifiers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCoreSpotlightCopyItem dataProviderTypeIdentifiers](v6, "dataProviderTypeIdentifiers");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_36;
          }
          v41 = v10;
        }
        -[SFCoreSpotlightCopyItem fileProviderTypeIdentifiers](self, "fileProviderTypeIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightCopyItem fileProviderTypeIdentifiers](v6, "fileProviderTypeIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_35;
        }
        -[SFCoreSpotlightCopyItem fileProviderTypeIdentifiers](self, "fileProviderTypeIdentifiers");
        v15 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v15;
        if (v15)
        {
          v16 = (void *)v15;
          v35 = v14;
          v17 = v12;
          -[SFCoreSpotlightCopyItem fileProviderTypeIdentifiers](self, "fileProviderTypeIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCoreSpotlightCopyItem fileProviderTypeIdentifiers](v6, "fileProviderTypeIdentifiers");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            v11 = 0;
            v12 = v17;
            v14 = v35;
            goto LABEL_33;
          }
          v39 = v3;
          v12 = v17;
          v14 = v35;
        }
        else
        {
          v39 = v3;
        }
        -[SFCoreSpotlightCopyItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightCopyItem applicationBundleIdentifier](v6, "applicationBundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) == (v20 != 0))
        {

          v11 = 0;
          v3 = v39;
          v16 = v40;
          if (!v40)
            goto LABEL_34;
          goto LABEL_33;
        }
        v33 = v20;
        v34 = v19;
        -[SFCoreSpotlightCopyItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v16 = v40;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36
          || (-[SFCoreSpotlightCopyItem applicationBundleIdentifier](self, "applicationBundleIdentifier"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFCoreSpotlightCopyItem applicationBundleIdentifier](v6, "applicationBundleIdentifier"),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              v32 = v21,
              objc_msgSend(v21, "isEqual:")))
        {
          -[SFCoreSpotlightCopyItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCoreSpotlightCopyItem coreSpotlightIdentifier](v6, "coreSpotlightIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v22 == 0) == (v23 != 0))
          {

            v11 = 0;
            v16 = v40;
          }
          else
          {
            v29 = v22;
            v30 = v23;
            -[SFCoreSpotlightCopyItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
            v24 = objc_claimAutoreleasedReturnValue();
            v16 = v40;
            if (v24)
            {
              v28 = (void *)v24;
              -[SFCoreSpotlightCopyItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFCoreSpotlightCopyItem coreSpotlightIdentifier](v6, "coreSpotlightIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v27, "isEqual:");

            }
            else
            {

              v11 = 1;
            }
          }
          v3 = v39;
          if (!v36)
          {
LABEL_32:

            if (!v16)
            {
LABEL_34:

LABEL_35:
              v10 = v41;
              if (!v9)
              {
LABEL_37:

                goto LABEL_38;
              }
LABEL_36:

              goto LABEL_37;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
        else
        {
          v11 = 0;
          v3 = v39;
        }

        goto LABEL_32;
      }
    }
    v11 = 0;
  }
LABEL_39:

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
  void *v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFCoreSpotlightCopyItem;
  v3 = -[SFCopyItem hash](&v13, sel_hash);
  -[SFCoreSpotlightCopyItem dataProviderTypeIdentifiers](self, "dataProviderTypeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFCoreSpotlightCopyItem fileProviderTypeIdentifiers](self, "fileProviderTypeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFCoreSpotlightCopyItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[SFCoreSpotlightCopyItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash") ^ v3;

  return v11;
}

- (NSArray)dataProviderTypeIdentifiers
{
  return self->_dataProviderTypeIdentifiers;
}

- (void)setDataProviderTypeIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)fileProviderTypeIdentifiers
{
  return self->_fileProviderTypeIdentifiers;
}

- (void)setFileProviderTypeIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fileProviderTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_dataProviderTypeIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
