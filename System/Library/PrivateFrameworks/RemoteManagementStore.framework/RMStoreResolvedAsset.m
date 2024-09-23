@implementation RMStoreResolvedAsset

- (RMStoreResolvedAsset)initWithData:(id)a3
{
  id v5;
  RMStoreResolvedAsset *v6;
  RMStoreResolvedAsset *v7;
  NSURL *assetFile;
  NSData *assetKeychainReference;
  NSString *assetKeychainUserName;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RMStoreResolvedAsset;
  v6 = -[RMStoreResolvedAsset init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetData, a3);
    assetFile = v7->_assetFile;
    v7->_assetFile = 0;

    assetKeychainReference = v7->_assetKeychainReference;
    v7->_assetKeychainReference = 0;

    assetKeychainUserName = v7->_assetKeychainUserName;
    v7->_assetKeychainUserName = 0;

  }
  return v7;
}

- (RMStoreResolvedAsset)initWithFile:(id)a3
{
  id v5;
  RMStoreResolvedAsset *v6;
  RMStoreResolvedAsset *v7;
  NSData *assetData;
  NSData *assetKeychainReference;
  NSString *assetKeychainUserName;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RMStoreResolvedAsset;
  v6 = -[RMStoreResolvedAsset init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    assetData = v6->_assetData;
    v6->_assetData = 0;

    objc_storeStrong((id *)&v7->_assetFile, a3);
    assetKeychainReference = v7->_assetKeychainReference;
    v7->_assetKeychainReference = 0;

    assetKeychainUserName = v7->_assetKeychainUserName;
    v7->_assetKeychainUserName = 0;

  }
  return v7;
}

- (RMStoreResolvedAsset)initWithKeychainReference:(id)a3
{
  id v5;
  RMStoreResolvedAsset *v6;
  RMStoreResolvedAsset *v7;
  NSData *assetData;
  NSURL *assetFile;
  NSString *assetKeychainUserName;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RMStoreResolvedAsset;
  v6 = -[RMStoreResolvedAsset init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    assetData = v6->_assetData;
    v6->_assetData = 0;

    assetFile = v7->_assetFile;
    v7->_assetFile = 0;

    objc_storeStrong((id *)&v7->_assetKeychainReference, a3);
    assetKeychainUserName = v7->_assetKeychainUserName;
    v7->_assetKeychainUserName = 0;

  }
  return v7;
}

- (RMStoreResolvedAsset)initWithKeychainReference:(id)a3 userName:(id)a4
{
  id v7;
  id v8;
  RMStoreResolvedAsset *v9;
  RMStoreResolvedAsset *v10;
  NSData *assetData;
  NSURL *assetFile;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RMStoreResolvedAsset;
  v9 = -[RMStoreResolvedAsset init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    assetData = v9->_assetData;
    v9->_assetData = 0;

    assetFile = v10->_assetFile;
    v10->_assetFile = 0;

    objc_storeStrong((id *)&v10->_assetKeychainReference, a3);
    objc_storeStrong((id *)&v10->_assetKeychainUserName, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMStoreResolvedAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RMStoreResolvedAsset *v9;
  RMStoreResolvedAsset *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asset-data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asset-file"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asset-keychain-reference"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asset-keychain-username"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9 = -[RMStoreResolvedAsset initWithData:](self, "initWithData:", v5);
  }
  else if (v6)
  {
    v9 = -[RMStoreResolvedAsset initWithFile:](self, "initWithFile:", v6);
  }
  else
  {
    v9 = -[RMStoreResolvedAsset initWithKeychainReference:userName:](self, "initWithKeychainReference:userName:", v7, v8);
  }
  v10 = v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RMStoreResolvedAsset assetData](self, "assetData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("asset-data"));

  -[RMStoreResolvedAsset assetFile](self, "assetFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("asset-file"));

  -[RMStoreResolvedAsset assetKeychainReference](self, "assetKeychainReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("asset-keychain-reference"));

  -[RMStoreResolvedAsset assetKeychainUserName](self, "assetKeychainUserName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("asset-keychain-username"));

}

- (BOOL)isEqual:(id)a3
{
  RMStoreResolvedAsset *v4;
  BOOL v5;

  v4 = (RMStoreResolvedAsset *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMStoreResolvedAsset isEqualToResolvedAsset:](self, "isEqualToResolvedAsset:", v4);
  }

  return v5;
}

- (BOOL)isEqualToResolvedAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;

  v4 = a3;
  -[RMStoreResolvedAsset assetData](self, "assetData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  v10 = 0;
  v11 = v8;
  v12 = v7;
  if (!v7 || !v8)
    goto LABEL_29;
  v13 = objc_msgSend(v7, "isEqual:", v8);

  if (v13)
  {
LABEL_7:
    -[RMStoreResolvedAsset assetFile](self, "assetFile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetFile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v16 = v15;
    v11 = v16;
    if (v12 == v16)
    {

    }
    else
    {
      v10 = 0;
      v17 = v16;
      v18 = v12;
      if (!v12 || !v16)
        goto LABEL_28;
      v19 = objc_msgSend(v12, "isEqual:", v16);

      if (!v19)
      {
        v10 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    -[RMStoreResolvedAsset assetKeychainReference](self, "assetKeychainReference");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetKeychainReference");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;
    v22 = v21;
    v30 = v22;
    if (v18 != v22)
    {
      v10 = 0;
      if (v18)
      {
        v23 = v22;
        v24 = v18;
        if (v22)
        {
          v25 = objc_msgSend(v18, "isEqual:", v22);

          if (!v25)
          {
            v10 = 0;
LABEL_27:
            v17 = v30;
LABEL_28:

            goto LABEL_29;
          }
          goto LABEL_19;
        }
      }
      else
      {
        v23 = v22;
        v24 = 0;
      }
LABEL_26:

      goto LABEL_27;
    }

LABEL_19:
    -[RMStoreResolvedAsset assetKeychainUserName](self, "assetKeychainUserName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetKeychainUserName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26;
    v28 = v27;
    v23 = v28;
    if (v24 == v28)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v24 && v28)
        v10 = objc_msgSend(v24, "isEqual:", v28);
    }

    goto LABEL_26;
  }
  v10 = 0;
LABEL_30:

  return v10;
}

- (NSData)assetData
{
  return self->_assetData;
}

- (NSURL)assetFile
{
  return self->_assetFile;
}

- (NSData)assetKeychainReference
{
  return self->_assetKeychainReference;
}

- (NSString)assetKeychainUserName
{
  return self->_assetKeychainUserName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetKeychainUserName, 0);
  objc_storeStrong((id *)&self->_assetKeychainReference, 0);
  objc_storeStrong((id *)&self->_assetFile, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
}

@end
