@implementation RMStoreUnresolvedAsset

- (RMStoreUnresolvedAsset)initWithAsset:(id)a3 queryParameters:(id)a4
{
  id v6;
  void *v7;
  RMStoreUnresolvedAsset *v8;

  v6 = a4;
  objc_msgSend(a3, "declarationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RMStoreUnresolvedAsset initWithAssetIdentifier:resolveAs:queryParameters:downloadURL:extensionToken:](self, "initWithAssetIdentifier:resolveAs:queryParameters:downloadURL:extensionToken:", v7, 0, v6, 0, 0);

  return v8;
}

- (RMStoreUnresolvedAsset)initWithAsset:(id)a3 queryParameters:(id)a4 downloadURL:(id)a5
{
  id v8;
  id v9;
  void *v10;
  RMStoreUnresolvedAsset *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "declarationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[RMStoreUnresolvedAsset initWithAssetIdentifier:resolveAs:queryParameters:downloadURL:extensionToken:](self, "initWithAssetIdentifier:resolveAs:queryParameters:downloadURL:extensionToken:", v10, 1, v9, v8, 0);

  return v11;
}

- (RMStoreUnresolvedAsset)initWithAssetIdentifier:(id)a3 queryParameters:(id)a4
{
  return -[RMStoreUnresolvedAsset initWithAssetIdentifier:resolveAs:queryParameters:downloadURL:extensionToken:](self, "initWithAssetIdentifier:resolveAs:queryParameters:downloadURL:extensionToken:", a3, 0, a4, 0, 0);
}

- (RMStoreUnresolvedAsset)initWithAssetIdentifier:(id)a3 queryParameters:(id)a4 downloadURL:(id)a5
{
  return -[RMStoreUnresolvedAsset initWithAssetIdentifier:resolveAs:queryParameters:downloadURL:extensionToken:](self, "initWithAssetIdentifier:resolveAs:queryParameters:downloadURL:extensionToken:", a3, 1, a4, a5, 0);
}

- (RMStoreUnresolvedAsset)initWithAssetIdentifier:(id)a3 resolveAs:(int64_t)a4 queryParameters:(id)a5 downloadURL:(id)a6 extensionToken:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RMStoreUnresolvedAsset *v17;
  RMStoreUnresolvedAsset *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RMStoreUnresolvedAsset;
  v17 = -[RMStoreUnresolvedAsset init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetIdentifier, a3);
    v18->_resolveAs = a4;
    objc_storeStrong((id *)&v18->_queryParameters, a5);
    objc_storeStrong((id *)&v18->_downloadURL, a6);
    objc_storeStrong((id *)&v18->_extensionToken, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMStoreUnresolvedAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RMStoreUnresolvedAsset *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asset-identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resolve-as"));
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("query-parameters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("download-url"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extension-token"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[RMStoreUnresolvedAsset initWithAssetIdentifier:resolveAs:queryParameters:downloadURL:extensionToken:](self, "initWithAssetIdentifier:resolveAs:queryParameters:downloadURL:extensionToken:", v5, v6, v10, v11, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RMStoreUnresolvedAsset assetIdentifier](self, "assetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("asset-identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[RMStoreUnresolvedAsset resolveAs](self, "resolveAs"), CFSTR("resolve-as"));
  -[RMStoreUnresolvedAsset queryParameters](self, "queryParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("query-parameters"));

  -[RMStoreUnresolvedAsset downloadURL](self, "downloadURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("download-url"));

  -[RMStoreUnresolvedAsset extensionToken](self, "extensionToken");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("extension-token"));

}

- (BOOL)isEqual:(id)a3
{
  RMStoreUnresolvedAsset *v4;
  BOOL v5;

  v4 = (RMStoreUnresolvedAsset *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMStoreUnresolvedAsset isEqualToUnresolvedAsset:](self, "isEqualToUnresolvedAsset:", v4);
  }

  return v5;
}

- (BOOL)isEqualToUnresolvedAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;

  v4 = a3;
  -[RMStoreUnresolvedAsset assetIdentifier](self, "assetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = -[RMStoreUnresolvedAsset resolveAs](self, "resolveAs");
    if (v7 == objc_msgSend(v4, "resolveAs"))
    {
      -[RMStoreUnresolvedAsset queryParameters](self, "queryParameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "queryParameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {

      }
      else
      {
        v13 = 0;
        v14 = v11;
        v15 = v10;
        if (!v10 || !v11)
          goto LABEL_24;
        v16 = objc_msgSend(v10, "isEqual:", v11);

        if (!v16)
        {
          v13 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      v27 = v12;
      -[RMStoreUnresolvedAsset downloadURL](self, "downloadURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "downloadURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      v19 = v18;
      v14 = v19;
      if (v15 == v19)
      {

      }
      else
      {
        v13 = 0;
        v20 = v19;
        v21 = v15;
        if (!v15 || !v19)
        {
LABEL_22:

          goto LABEL_23;
        }
        v22 = objc_msgSend(v15, "isEqual:", v19);

        if (!v22)
        {
          v13 = 0;
LABEL_23:
          v12 = v27;
LABEL_24:

          goto LABEL_25;
        }
      }
      -[RMStoreUnresolvedAsset extensionToken](self, "extensionToken");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "extensionToken");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v23;
      v25 = v24;
      v20 = v25;
      if (v21 == v25)
      {
        v13 = 1;
      }
      else
      {
        v13 = 0;
        if (v21 && v25)
          v13 = objc_msgSend(v21, "isEqual:", v25);
      }

      goto LABEL_22;
    }
  }
  v13 = 0;
LABEL_26:

  return v13;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (int64_t)resolveAs
{
  return self->_resolveAs;
}

- (NSDictionary)queryParameters
{
  return self->_queryParameters;
}

- (NSURL)downloadURL
{
  return self->_downloadURL;
}

- (NSString)extensionToken
{
  return self->_extensionToken;
}

- (void)setExtensionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionToken, 0);
  objc_storeStrong((id *)&self->_downloadURL, 0);
  objc_storeStrong((id *)&self->_queryParameters, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end
